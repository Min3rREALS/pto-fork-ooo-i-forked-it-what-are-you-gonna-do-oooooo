hp = 2
if obj_player1.character = "N"
{
	sprite_index = spr_halloweenbigblockescape
	if check_sugary()
		sprite_index = spr_destroyable2bigescape_ss_noise
}
if obj_player1.character = "SP"
	sprite_index = spr_destroyable2bigescape_ss

depth = 1
content = obj_null