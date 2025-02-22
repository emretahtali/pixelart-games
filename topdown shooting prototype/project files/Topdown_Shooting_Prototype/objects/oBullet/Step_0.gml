switch (type)
{
	case 1: default: image_index = 0; break;
	case 2: image_index = 1; break;
}

x += lengthdir_x(spd, dir + 90);
y += lengthdir_y(spd, dir + 90);

if (place_meeting(x, y, oWall)) instance_destroy();

shot_list = ds_list_create();
var shot_count = instance_place_list(x, y, all, shot_list, false);
repeat(shot_count)
{
	if (!ds_list_empty(shot_list)) var shot = ds_list_find_value(shot_list, 0);
	if ((instance_exists(shooter)) && (variable_instance_exists(shot, "hp")) && (shot.id != shooter.id))
	{
	shot.hp --;
	instance_destroy();
	}
	ds_list_delete(shot_list, 0);
}
ds_list_destroy(shot_list);