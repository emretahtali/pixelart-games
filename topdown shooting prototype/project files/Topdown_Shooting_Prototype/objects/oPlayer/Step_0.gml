global.key_left = keyboard_check(ord("A"));
global.key_right = keyboard_check(ord("D"));
global.key_forward = keyboard_check(ord("W"));
global.key_backward = keyboard_check(ord("S"));
global.key_shift = keyboard_check(vk_shift);

#region Hareket ve Duvarlar

if (global.key_shift) walksp = 1.5;
else walksp = 4;

//YATAY HAREKET
var yatay = global.key_right - global.key_left;
hsp = yatay * walksp;

//YATAY DUVAR
if (place_meeting(x + hsp, y, oWall))
{
	while (!place_meeting(x + sign(hsp), y, oWall)) x = x + sign(hsp);
	hsp = 0;
}
x = x + hsp;

//DİKEY HAREKET
var dikey = global.key_backward - global.key_forward;
vsp = dikey * walksp;

//DİKEY DUVAR
if (place_meeting(x, y + vsp, oWall))
{
	while (!place_meeting(x, y + sign(vsp), oWall)) y = y + sign(vsp);
	vsp = 0;
}
y = y + vsp;

#endregion

#region Oda Değiştirme

var door_id = instance_position(x, y, oRoomDoor);
if (door_id != noone)
{
	global.last_door_dir = door_id.target;
	switch (door_id.target)
	{
		case "up":
		{
			with (oRandomLevel)
			{
				for (var i = 0; i < rmCount; i++)
				{
					if ((ds_grid_get(rmList, 0, i) == x_) && (ds_grid_get(rmList, 1, i) == y_ - 1))
					{
						room_goto(ds_grid_get(rmList, 2, i));
					}
				}
			}
			break;
		}
		
		case "down":
		{
			with (oRandomLevel)
			{
				for (var i = 0; i < rmCount; i++)
				{
					if ((ds_grid_get(rmList, 0, i) == x_) && (ds_grid_get(rmList, 1, i) == y_ + 1))
					{
						room_goto(ds_grid_get(rmList, 2, i));
					}
				}
			}
			break;
		}
		
		case "right":
		{
			with (oRandomLevel)
			{
				for (var i = 0; i < rmCount; i++)
				{
					if ((ds_grid_get(rmList, 0, i) == x_ + 1) && (ds_grid_get(rmList, 1, i) == y_))
					{
						room_goto(ds_grid_get(rmList, 2, i));
					}
				}
			}
			break;
		}
		
		case "left":
		{
			with (oRandomLevel)
			{
				for (var i = 0; i < rmCount; i++)
				{
					if ((ds_grid_get(rmList, 0, i) == x_ - 1) && (ds_grid_get(rmList, 1, i) == y_))
					{
						room_goto(ds_grid_get(rmList, 2, i));
					}
				}
			}
			break;
		}
	}
}

#endregion

if ((last_x != x) || (last_y != y))
{
	move_dir = point_direction(last_x, last_y, x, y);
	move_dis = point_distance(last_x, last_y, x, y);
	old_x = last_x;
	old_y = last_y;
}
last_x = x;
last_y = y;