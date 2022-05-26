/// @description Perform collisions, but also do extra checks for grinding and ladder-climbing
function scr_collide_player()
{
	grounded = false
	grinding = false
	
	var _hsp = hsp;
	var _vsp = vsp;
	
	if !variable_instance_exists(id, "hascollision") or hascollision
	{
		// Vertical
		if abs(_vsp) > 0
		{
			repeat abs(_vsp)
			{
				// make sure the player doesnt go too fast and miss the hallway
				with instance_place(x, y, obj_verticalhallway)
				{
					event_perform(ev_collision, obj_player);
					break;
				}
				
				if !scr_solid_player(x, y + sign(_vsp))
					y += sign(_vsp);
				else
				{
					if vsp >= 0
						grounded |= true;
					vsp = 0;
					break;
				}
			}
		}
		x = floor(x);
		
		// Horizontal
		if abs(_hsp) > 0
		{
			repeat abs(_hsp)
			{
				// Move up slope
				if scr_solid_player(x + sign(_hsp), y) && !scr_solid_player(x + sign(_hsp), y - 1)
					y--;
	
				// Move down slope
				if !scr_solid_player(x + sign(_hsp), y) && !scr_solid_player(x + sign(_hsp), y + 1) && scr_solid_player(x + sign(_hsp), y + 2)
					y++;
		
				// if youre going too fast you might phase right through some object triggers, so-
				with instance_place(x, y + 1, obj_destructibleplatform)
				{
					if !falling
					{
						falling = true;
						sprite_index = spr_dissolve;
						image_index = 0;
					}
				}
				with instance_place(x, y, obj_hallway)
				{
					event_perform(ev_collision, obj_player);
					break;
				}
				
				if !scr_solid_player(x + sign(_hsp), y)
					x += sign(_hsp);
				else
				{
					hsp = 0;
					break;
				}
			}
		}
		y = floor(y);
		
		// Check if a wall is below me	
		grounded |= scr_solid_player(x, y + 1)
		// Check if I'm on a grindrail
		grinding = !place_meeting(x, y, obj_grindrail) && place_meeting(x, y + 1, obj_grindrail)
		grounded |= grinding
	}
	
	//Gravity
	vsp = min(vsp + (grav * gravmult), 20 * gravmult);
}
