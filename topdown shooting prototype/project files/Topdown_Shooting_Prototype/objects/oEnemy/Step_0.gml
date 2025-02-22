#region Hareket ve Duvarlar

//YATAY DUVAR
if (place_meeting(x + hsp, y, oWall))
{
	while (!place_meeting(x + sign(hsp), y, oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//DİKEY DUVAR
if (place_meeting(x, y + vsp, oWall))
{
	while (!place_meeting(x, y + sign(vsp), oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

#endregion

//if (!instance_exists(head)) instance_destroy();

if (state == "normal")
{
	search_counter = 0;
	
	switch (enemytype)
	{
		case "stand": default:
		{
			if (head.player_on_sight) state = "search";
			break;
		}
		case "patrol":
		{
			if (path_index == -1) && (path_lock)
			{
				walksp = 2.5;
				path_start(path, walksp, path_action_continue, 1);
				if (enemy_last_path_pos != -1) path_position = enemy_last_path_pos;
				path_lock = false;
				head.image_speed = .5;
			}
			else if (head.player_on_sight)
			{
				walksp = 4;
				head.image_speed = 1;
				path_end();
				path_lock = true;
				state = "search";
			}
			break;
		}
	}
}
else if (state == "search")
{
	if (head.player_on_sight)
	{
		if (search_counter == 0)
		{
			enemy_lastX = x;
			enemy_lastY = y;
			if (path != -1) enemy_last_path_pos = path_position;
		}
		
		player_lastseenX = oPlayer.x;
		player_lastseenY = oPlayer.y;
		search_timer = 30;
		pathfinder_wait_timer = 180;
		path_end();
		search_lock = true;
		return_pos_lock = false;
		search_counter ++;
		path_continue_lock = true;
	}
	else
	{
		if (!search_lock) search_timer = 30;
		else
		{
			if (search_timer == 0)
			{	
				if (mp_grid_path(global.pathfinder_grid, path_finder, x, y, player_lastseenX, player_lastseenY, true))
				{
					path_start(path_finder, walksp, path_action_stop, true);
					pathfinder_wait_timer = 180;
				}
			}
			else search_timer --;
		}
		
		if ((x == player_lastseenX) && (y == player_lastseenY)) || (return_pos_lock)
		{
			search_lock = false;
			return_pos_lock = true;
			if (pathfinder_wait_timer == 0)
			{
				if (mp_grid_path(global.pathfinder_grid, path_return, x, y, enemy_lastX, enemy_lastY, true))
				{
					path_start(path_return, walksp, path_action_stop, true);
				}
			}
			else pathfinder_wait_timer --;
		}
		
		if (x == enemy_lastX) && (y == enemy_lastY)
		{
			return_pos_lock = false;
			if (path != -1) && (path_continue_lock)
			{
				path_continue_lock = false;
				//path_start(path, walksp, path_action_continue, true);
				//path_position = enemy_last_path_pos;
				state = "normal";
			}
		}
	}
}

//Arayış Pozisyonunu Tabloya Oturtmacalar
if (!mp_grid_path(global.pathfinder_grid, path_finder, x, y, player_lastseenX, player_lastseenY, true))
{
	if (mp_grid_path(global.pathfinder_grid, path_finder, x, y, player_lastseenX - 2, player_lastseenY, true))
	{
		player_lastseenX = player_lastseenX - 2;
	}
	else if (mp_grid_path(global.pathfinder_grid, path_finder, x, y, player_lastseenX + 2, player_lastseenY, true))
	{
		player_lastseenX = player_lastseenX + 2;
	}
	if (mp_grid_path(global.pathfinder_grid, path_finder, x, y, player_lastseenX, player_lastseenY - 2, true))
	{
		player_lastseenY = player_lastseenY - 2;
	}
	else if (mp_grid_path(global.pathfinder_grid, path_finder, x, y, player_lastseenX, player_lastseenY + 2, true))
	{
		player_lastseenY = player_lastseenY + 2;
	}
}
player_lastseenX = ((player_lastseenX div 42) * 42) + 21;
player_lastseenY = ((player_lastseenY div 42) * 42) + 21;	


//Geri Dönüş Pozisyonunu Tabloya Oturtmacalar
if (!mp_grid_path(global.pathfinder_grid, path_return, x, y, enemy_lastX, enemy_lastY, true))
{
	if (mp_grid_path(global.pathfinder_grid, path_return, x, y, enemy_lastX - 2, enemy_lastY, true))
	{
		enemy_lastX = enemy_lastX - 2;
	}
	else if (mp_grid_path(global.pathfinder_grid, path_return, x, y, enemy_lastX + 2, enemy_lastY, true))
	{
		enemy_lastX = enemy_lastX + 2;
	}
	if (mp_grid_path(global.pathfinder_grid, path_return, x, y, enemy_lastX, enemy_lastY - 2, true))
	{
		enemy_lastY = enemy_lastY - 2;
	}
	else if (mp_grid_path(global.pathfinder_grid, path_return, x, y, enemy_lastX, enemy_lastY + 2, true))
	{
		enemy_lastY = enemy_lastY + 2;
	}
}
enemy_lastX = ((enemy_lastX div 42) * 42) + 21;
enemy_lastY = ((enemy_lastY div 42) * 42) + 21;	




//Speed Test
if ((last_x != x) || (last_y != y))
{
	move_dir = point_direction(last_x, last_y, x, y);
	move_dis = point_distance(last_x, last_y, x, y);
	old_x = last_x;
	old_y = last_y;
}
else move_dis = 0;
last_x = x;
last_y = y;