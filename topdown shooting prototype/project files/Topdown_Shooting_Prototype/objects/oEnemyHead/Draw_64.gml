/*#region enemy off-screen

	if (point_in_circle(oPlayer.x, oPlayer.y, x, y, 500)) && (!point_in_rectangle(x, y, oCamera.x - oCamera.width_ / 2, oCamera.y - oCamera.height_ / 2, oCamera.x + oCamera.width_ / 2, oCamera.y + oCamera.height_ / 2))
	{
		draw_set_halign(fa_middle);
		draw_set_valign(fa_center);
		draw_set_color(c_white);
		draw_text(30, 30, "true");
		
		var enemy_out_of_cameraX = clamp(oCamera.width_ / 2 - (oCamera.x - x), 16, oCamera.width_ - 16);
		var enemy_out_of_cameraY = clamp(oCamera.height_ / 2 - (oCamera.y - y), 16, oCamera.height_ - 16);
		
		draw_text(30, 120, enemy_out_of_cameraX);
		draw_text(30, 210, enemy_out_of_cameraY);
		
		draw_rectangle(enemy_out_of_cameraX - 6, enemy_out_of_cameraY - 6, enemy_out_of_cameraX + 6, enemy_out_of_cameraY + 6, false);
	}

#endregion

draw_set_font(font0);
draw_set_color(c_red);

/* ENEMY AI STUFF
draw_text(30, 30, oEnemy.path_index);
draw_text(30, 90, oEnemy.pathfinder_wait_timer);
draw_text(30, 150, oEnemy.enemy_lastX);
draw_text(30, 210, oEnemy.enemy_lastY);
draw_text(30, 270, oEnemy.x);
draw_text(30, 330, oEnemy.y);
draw_text(360, 150, oEnemy.player_lastseenX);
draw_text(360, 210, oEnemy.player_lastseenY);
draw_text(360, 270, oPlayer.x);
draw_text(360, 330, oPlayer.y);
draw_text(30, 390, oEnemy.return_pos_lock);
draw_text(30, 450, path_get_number(oEnemy.path_finder));
draw_text(30, 510, path_get_number(oEnemy.path_return));
draw_text(30, 570, oEnemy.search_lock);
draw_text(30, 630, oEnemy.search_timer);
draw_text(30, 690, oEnemy.path);
*/


/*draw_set_font(font0);
draw_set_color(c_red);
draw_text(30, 30, mp_grid_path(global.pathfinder_grid, oEnemy.path_finder, oEnemy.x, oEnemy.y, oEnemy.player_lastseenX, oEnemy.player_lastseenY, 1));
draw_text(30, 90, oEnemy.path_lock);
draw_text(30, 150, oEnemy.player_lastseenX);
draw_text(30, 210, oEnemy.player_lastseenY);
draw_text(30, 270, path_get_point_x(oEnemy.path_finder, path_get_number(oEnemy.path_finder) - 1)); 
draw_text(30, 330, path_get_point_y(oEnemy.path_finder, path_get_number(oEnemy.path_finder) - 1)); 
draw_text(30, 390, oEnemy.x);
draw_text(30, 450, oEnemy.y);
draw_text(30, 510, oEnemy.path_index);
draw_text(30, 570, oPlayer.x);
draw_text(30, 630, oPlayer.y);
/*draw_set_color(c_blue);
draw_text(250, 50, point_distance(gun_x, gun_y, look_x, look_y));

draw_set_color(c_red);
draw_text(250, 150, point_distance(gun_x, gun_y, oPlayer.x, oPlayer.y));

draw_set_color(c_green);
draw_text(250, 250, point_distance(look_x, look_y, oPlayer.x, oPlayer.y));

draw_set_color(c_black);
draw_text(250, 350, oPlayer.move_dis);
draw_text(250, 450, 15);

draw_text(250, 50, oPlayerHead.hp);
draw_text(250, 150,  oEnemyHead.hp); */

/*
draw_set_color(c_red);
draw_text(150, 150, image_angle);
draw_text(150, 250, point_direction(x, y, look_x, look_y) - 90);
draw_text(150, 350, point_direction(x, y, look_x, look_y));
*/

/*
draw_set_color(c_red);
with(ds_list_find_value(sight_wall_check_list, 0)) draw_text(150, 150, object_get_name(object_index));
draw_text(150, 250, ds_list_find_value(sight_wall_check_list, 0));
draw_text(150, 350, wall_check_obj);
*/
