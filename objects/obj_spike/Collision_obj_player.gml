var rn = room_get_name(room);
if string_startswith(rn, "oldmansion_") or string_startswith(rn, "etb_") or string_startswith(rn, "ancient_")
{
	with other
	{
		if scr_transfobump()
			exit;
	}
}
scr_hurtplayer(other);