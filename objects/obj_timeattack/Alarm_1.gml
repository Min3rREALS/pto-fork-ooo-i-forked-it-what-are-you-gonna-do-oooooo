if global.timeattack
{
	if !stop && !obj_pause.pause
	{
		global.taseconds += 1
		if global.taseconds >= 60
		{
			global.taseconds -= 60
			global.taminutes += 1
		}
	}
	alarm[1] = 60
}