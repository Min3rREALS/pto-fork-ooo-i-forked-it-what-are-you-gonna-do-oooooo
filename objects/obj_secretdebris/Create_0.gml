event_inherited();

image_index = random_range(0,4)
image_speed = 0
vsp = random_range(-4, 0)
hsp = random_range(-4, 4)
grav = 0.4
image_angle = random_range(1, 270)

depth = -1

s = -1;
mode = 0;
tile_dataid = 0;
if global.secretdebris && room != custom_lvl_room
{
	tile_dataset = tileset_secret;
	tile_dataid = 49;
	mode = 1;
}
momentum = [0, 0];

