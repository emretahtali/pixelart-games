switch(mode)
{
	case 0:
	{
		i = 0;
		j = 0;
		up = true;
		draw_set_color(c_white);
		draw_set_alpha(1);
		rm = room;
		rmcheck = true;
		break;
	}
	case 1:
	{
		draw_set_color(c_black);
		
		if (i < 20) && (up)
		{
			draw_set_alpha(i / 20);
			draw_rectangle(0, 0, w, h, false);
			i ++;
		}
		else
		{
			if (rmcheck)
			{
				room_goto(rm);
				rmcheck = false;
			}
			up = false;
			draw_set_alpha(i / 20);
			draw_rectangle(0, 0, w, h, false);
			if (i > 0) i --;
			else mode = 0;
		}
		draw_set_alpha(1);
		break;
	}
	case 2:
	{
		if (j < 44) 
		{
			draw_sprite_ext(sTransBlue, j * 4, w / 3, h / 3, 12, 12, 0, c_white, 1);
			j ++;
		}
		else 
		{
			mode = 0;
		}
		if (rmcheck) && (j == 22)
		{
			room_goto(rm);
			rmcheck = false;
		}
		break;
	}
} 