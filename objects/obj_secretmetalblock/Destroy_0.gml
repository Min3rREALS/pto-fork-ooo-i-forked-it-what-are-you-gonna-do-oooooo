
if  ds_list_find_index(global.saveroom, id) = -1
{
	/*
	instance_create(x+ 32,y+ 32,obj_metaldebris)
	instance_create(x+ 32,y+ 32,obj_metaldebris)
	instance_create(x+ 32,y+ 32,obj_metaldebris)
	instance_create(x + 32,y+ 32,obj_metaldebris)
	tile_layer_delete_at(1, x, y);
	tile_layer_delete_at(1, x+32, y);
	tile_layer_delete_at(1, x+32, y+32);
	tile_layer_delete_at(1, x, y+32);
	*/

    with (obj_camera) {
	
	    shake_mag=20;
	    shake_mag_acc=40/room_speed;
	}

	scr_soundeffect(sfx_breakmetal)
	ds_list_add(global.saveroom, id) 


	var lay_id = get_layer("Tiles_1");
	var lay_id2 = get_layer("Tiles_2");
	
	if lay_id != -1
	{
		var map_id = layer_tilemap_get_id(lay_id);
		var data = tilemap_get_at_pixel(map_id, x, y);
		var data2 = tilemap_get_at_pixel(map_id, x+33, y);
		var data3 = tilemap_get_at_pixel(map_id, x, y+33);
		var data4 = tilemap_get_at_pixel(map_id, x+33, y+33);
		
		if data != -1
			tilemap_set_at_pixel(map_id, tile_set_empty(data), x, y);
		if data2 != -1
			tilemap_set_at_pixel(map_id, tile_set_empty(data2), x+33, y);
		if data3 != -1
			tilemap_set_at_pixel(map_id, tile_set_empty(data3), x, y+33);
		if data4 != -1
			tilemap_set_at_pixel(map_id, tile_set_empty(data4), x+33, y+33);
		
		if data != 0
		{
			with instance_create(x + 32,y + 32,obj_secretdebris)
			{
				tile_dataid = data
				tile_dataset = tilemap_get_tileset(map_id)
				sprite_index = spr_secretmetaldebris
			}
		}
		else if lay_id2 == -1
			instance_create(x+ 32,y+32,obj_metaldebris)
		
		if data2 != 0
		{
			with instance_create(x + 32,y + 32,obj_secretdebris)
			{
				tile_dataid = data2
				tile_dataset = tilemap_get_tileset(map_id)
				sprite_index = spr_secretmetaldebris
			}
		}
		else if lay_id2 == -1
			instance_create(x+ 32,y+32,obj_metaldebris)
	
		if data3 != 0
		{
			with instance_create(x + 32,y + 32,obj_secretdebris)
			{
				tile_dataid = data3
				tile_dataset = tilemap_get_tileset(map_id)
				sprite_index = spr_secretmetaldebris
			}
		}
		else if lay_id2 == -1
			instance_create(x+ 32,y+32,obj_metaldebris)
	
		if data4 != 0
		{
			with instance_create(x + 32,y + 32,obj_secretdebris)
			{
				tile_dataid = data4
				tile_dataset = tilemap_get_tileset(map_id)
				sprite_index = spr_secretmetaldebris
			}
		}
		else if lay_id2 == -1
			instance_create(x+ 32,y+32,obj_metaldebris)
	}
	if lay_id2 != -1
	{
		var map_id = layer_tilemap_get_id(lay_id2);
		var data_ = tilemap_get_at_pixel(map_id, x, y);
		var data2_ = tilemap_get_at_pixel(map_id, x+33, y);
		var data3_ = tilemap_get_at_pixel(map_id, x, y+33);
		var data4_ = tilemap_get_at_pixel(map_id, x+33, y+33);
		
		if data_ != -1
			tilemap_set_at_pixel(map_id, tile_set_empty(data), x, y);
		if data2_ != -1
			tilemap_set_at_pixel(map_id, tile_set_empty(data2), x+33, y);
		if data3_ != -1
			tilemap_set_at_pixel(map_id, tile_set_empty(data3), x, y+33);
		if data4_ != -1
			tilemap_set_at_pixel(map_id, tile_set_empty(data4), x+33, y+33);
		
		if data_ != 0
		{
			with instance_create(x + 32,y + 32,obj_secretdebris)
			{
				tile_dataid = data_
				tile_dataset = tilemap_get_tileset(map_id)
				sprite_index = spr_secretmetaldebris
			}
		}
		else if data == -1
			instance_create(x+ 32,y+32,obj_metaldebris)
		
		if data2_ != 0
		{
			with instance_create(x + 32,y + 32,obj_secretdebris)
			{
				tile_dataid = data2_
				tile_dataset = tilemap_get_tileset(map_id)
				sprite_index = spr_secretmetaldebris
			}
		}
		else if data2 == -1
			instance_create(x+ 32,y+32,obj_metaldebris)
	
		if data3_ != 0
		{
			with instance_create(x + 32,y + 32,obj_secretdebris)
			{
				tile_dataid = data3_
				tile_dataset = tilemap_get_tileset(map_id)
				sprite_index = spr_secretmetaldebris
			}
		}
		else if data3 == -1
			instance_create(x+ 32,y+32,obj_metaldebris)
	
		if data4_ != 0
		{
			with instance_create(x + 32,y + 32,obj_secretdebris)
			{
				tile_dataid = data4_
				tile_dataset = tilemap_get_tileset(map_id)
				sprite_index = spr_secretmetaldebris
			}
		}
		else if data4 == -1
			instance_create(x+ 32,y+32,obj_metaldebris)
	}
}

depth =1