image_speed = 0.5
depth = -10

if audio_is_playing(sfx_explosion)
	audio_stop_sound(sfx_explosion)
scr_soundeffect(sfx_explosion)

hurtplayer = false;
sync = false;

var b = instance_nearest(x, y, obj_dynamite);
if distance_to_object(b) <= 100
{
	with b
		countdown = min(countdown, 10);
}

var b = instance_nearest(x, y, obj_playerbomb);
if distance_to_object(b) <= 100
{
	with b
		countdown = min(countdown, 10);
}

