head = instance_create_layer(x,  y, "Player", oPlayerHead);

hsp = 0;
vsp = 0;
walksp = 4;
last_x = x;
last_y = y;
move_dir = 0;
move_dis = 0;
old_x = x;
old_y = y;

#region Son Kapıya Göre Spawn Olma Pozisyonu
switch (global.last_door_dir)
{
	case "up":
	{
		x = room_width / 2;
		y = room_height - 5;
		break;
	}
	case "down":
	{
		x = room_width / 2;
		y = 5;
		break;
	}
	case "right":
	{
		x = 5;
		y = room_height / 2;
		break;
	}
	case "left":
	{
		x = room_width - 5;
		y = room_height / 2;
		break;
	}
}
#endregion