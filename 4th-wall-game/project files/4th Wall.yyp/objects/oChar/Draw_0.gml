draw_set_halign(fa_center);
draw_set_valign(fa_center);

#region Kapı Kilitli Simgesi

if (drawLockedSign)
{
	if (LockedSignTime < 50) 
	{
		draw_sprite_ext(sLockedSign, floor(LockedSignTime / 10), door_saved_x, door_saved_y - 16, 1, 1, 0, c_white, 1);
		LockedSignTime ++;
	}
	else 
	{
		LockedSignTime = 0;
		drawLockedSign = false;
	}
}

#endregion

draw_self();