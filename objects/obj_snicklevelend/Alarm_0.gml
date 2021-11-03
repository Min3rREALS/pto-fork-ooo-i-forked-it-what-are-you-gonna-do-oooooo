if instance_exists(obj_onlinemenu)
{
	global.pizzacoin = global.pizzacoinstart;
	
	scr_playerreset();
	obj_player1.targetDoor = "B";
	obj_player1.state = states.titlescreen;
	
	obj_onlinemenu.menu = menutypes.leveldetails;
	room_goto(editor_entrance);
}
else
{
	global.pizzacoinstart = global.pizzacoin;
	if global.timeattack
	{
		var namestring = scr_levelname();
		
		ini_open("saveData" + string(global.saveslot) + ".ini");
		if ((ini_read_real("TAmin", namestring, -1) * 60) + ini_read_real("TAsec", namestring, -1) > (global.taminutes * 60) + global.taseconds)
		or ini_read_real("TAmin", namestring, -1) == -1
		{
			ini_write_string("TAsec", namestring, global.taseconds);
			ini_write_string("TAmin", namestring, global.taminutes);
			
			var char = "S";
			if global.gameplay != 0
				char += "-NEW";
			ini_write_string("TAchar", namestring, char);
		}
		ini_close();
	}

	scr_playerreset()
	obj_player1.state = states.normal
	obj_player1.targetDoor = "A"
	room_goto(hub_room1);
}