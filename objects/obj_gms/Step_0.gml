// no internet
if (!gms_info_isloggedin() or !os_is_network_connected())
//&& ((instance_exists(obj_player1) && obj_player1.state != states.titlescreen) or !instance_exists(obj_player1))
&& room != Realtitlescreen && room != characterselect
{
	instance_destroy(obj_fadeout);
	instance_destroy(obj_pause);
	instance_destroy(obj_pausefadeout);
	instance_activate_all();
	
	gms_logout();
	alarm[4] = 1;
	
	with obj_player1
		alarm[11] = 60;
	exit;
}

// logout if title screen
if gms_info_isloggedin() && room == Realtitlescreen
{
	gms_logout();
	instance_destroy();
}

// gots
if (!instance_exists(obj_pause) or !obj_pause.pause) && global.gottp[0] // tpother
{
	with obj_player
		alarm[11] = 60;
	global.gottp[0] = false;
	
	if global.gottp[3] < 0
	{
		// tp to jacko editor room
		__user = noone;
		if instance_exists(obj_onlinemenu)
			var onl = obj_onlinemenu;
		else
			onl = instance_create(0, 0, obj_onlinemenu);
			
		with onl
		{
			menu = -1;
			scr_requestlevel_alt(-global.gottp[3]);
			requestype = reqtypes.tp_level;
			paging_type = 3;
		}
	}
	else
	{
		// tp normally
		global.gottp[0] = true;
		with obj_player1
		{
			scr_playerreset();
			x = global.gottp[1];
			y = global.gottp[2];
			targetDoor = "none";
			
			room_goto_new(global.gottp[3]);
			global.gottp[0] = false;
		}
	}
}
if global.__gotmessage[0] // global message
{
	global.__gotmessage[0] = false;

	scr_soundeffect(sfx_Nspin);
	showmessage = true;
	alarm[2] = room_speed * 5;
}
depth = -9999;

if debug
{
	if keyboard_check(vk_control) && keyboard_check_pressed(vk_f1)
	{
		var ver = get_integer("Input version number", gameversion);
		if ver != undefined && ver > 0
		{
			gameversion = ver;
			gms_ini_game_write("game", "version", ver);
		}
	}
}