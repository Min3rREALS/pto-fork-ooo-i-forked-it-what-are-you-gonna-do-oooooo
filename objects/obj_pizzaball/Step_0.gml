switch state
{
	case states.normal:
		scr_pizzaball_normal();
		break
	case states.tumble:
		scr_pizzaball_roll();
		break
	case states.golf:
		scr_pizzaball_golf();
		break
}

if kicked
	mask_index = msk_pizzaball_crouch
else
	mask_index = spr_pizzaball_idle

with instance_place(x, y + 1, obj_destructibleplatform)
{
	if !falling
	{
		falling = true;
		sprite_index = spr_dissolve;
		image_index = 0;
	}
}

