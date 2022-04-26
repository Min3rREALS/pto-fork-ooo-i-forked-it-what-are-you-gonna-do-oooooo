if ds_list_find_index(global.saveroom, id) == -1
{
	var objectlist = ds_list_create();
	var num = instance_place_list(x, y, object, objectlist, false);
	
	for(var i = 0; i < num; i++)
	{
		var obj = objectlist[| i];
		if obj.object_index != obj_collectescape or global.panic
			ds_list_add(deactivatedlist, obj.id);
		if inst_relation(obj, obj_baddie)
		{
			obj.boundbox = false;
			obj.hitboxcreate = false;
		}
		instance_deactivate_object(obj);
	}
	ds_list_destroy(objectlist);
}
else
	instance_destroy();

