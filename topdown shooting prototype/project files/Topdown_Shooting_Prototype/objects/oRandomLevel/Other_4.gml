x_ = ds_grid_get(rmList, 0, ds_grid_value_y(rmList, 2, 0, 2, ds_grid_height(rmList) - 1, room));
y_ = ds_grid_get(rmList, 1, ds_grid_value_y(rmList, 2, 0, 2, ds_grid_height(rmList) - 1, room));
/*
if (room > 0)
{
	if (y_ != 0)
	{
		if (ds_grid_get(map, x_, y_ - 1) == 2)
		{
			var door_pos_id = instance_position(room_width / 2, 0, oKutu);
			if (door_pos_id != noone)
			{
				instance_create_layer(door_pos_id.x, door_pos_id.y, "Trigger", oRoomDoor);
				instance_destroy(door_pos_id);
				door_pos_id = noone;
				
			}
		}
	}
	
	if (y_ != wh - 1)
	{
		if (ds_grid_get(map, x_, y_ +1) == 2)
		{
			var door_pos_id = instance_position(room_width / 2, room_height, oKutu);
			if (door_pos_id != noone)
			{
				instance_create_layer(door_pos_id.x, door_pos_id.y, "Trigger", oRoomDoor);
				instance_destroy(door_pos_id);
				door_pos_id = noone;
			}
		}
	}
	
	if (x_ != wh - 1)
	{
		if (ds_grid_get(map, x_ + 1, y_) == 2)
		{
			var door_pos_id = instance_position(room_width, room_height / 2, oKutu);
			if (door_pos_id != noone)
			{
				instance_create_layer(door_pos_id.x, door_pos_id.y, "Trigger", oRoomDoor);
				instance_destroy(door_pos_id);
				door_pos_id = noone;
			}
		}
	}
	
	if (x_ != 0)
	{
		if (ds_grid_get(map, x_ - 1, y_) == 2)
		{
			var door_pos_id = instance_position(0, room_height / 2, oKutu);
			if (door_pos_id != noone)
			{
				instance_create_layer(door_pos_id.x, door_pos_id.y, "Trigger", oRoomDoor);
				instance_destroy(door_pos_id);
				door_pos_id = noone;
			}
		}
	}
	
}*/