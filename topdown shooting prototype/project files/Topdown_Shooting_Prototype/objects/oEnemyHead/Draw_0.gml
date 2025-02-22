if (debug)
{
	/*
	draw_set_color(c_blue);
	draw_line(gun_x, gun_y, look_x, look_y);

	draw_set_color(c_red);
	draw_line(gun_x, gun_y, oPlayer.x, oPlayer.y);

	draw_set_color(c_green);
	draw_line(look_x, look_y, oPlayer.x, oPlayer.y);
	*/

	draw_set_color(c_blue);
	draw_set_alpha(0.3)
	draw_triangle(x, y, x + lengthdir_x(sight_dis, image_angle + 120), y + lengthdir_y(sight_dis, image_angle + 120), x + lengthdir_x(sight_dis, image_angle + 60), y + lengthdir_y(sight_dis, image_angle + 60), 0);
	draw_triangle(x + lengthdir_x(sight_dis * 1, image_angle + 90), y + lengthdir_y(sight_dis * 1, image_angle + 90), x + lengthdir_x(sight_dis, image_angle + 120), y + lengthdir_y(sight_dis, image_angle + 120), x + lengthdir_x(sight_dis, image_angle + 60), y + lengthdir_y(sight_dis, image_angle + 60), 0);
	draw_set_alpha(1);

	//draw_line(x, y, x + lengthdir_x(sight_dis, image_angle + 150), y + lengthdir_y(sight_dis, image_angle + 150));
	//draw_line(x, y, x + lengthdir_x(sight_dis, image_angle + 30), y + lengthdir_y(sight_dis, image_angle + 30));

	draw_set_color(c_red);
	draw_rectangle(oPlayerHead.x - (oPlayerHead.sprite_width / 4), oPlayerHead.y - (oPlayerHead.sprite_height / 3), oPlayerHead.x + (oPlayerHead.sprite_width / 4), oPlayerHead.y + (oPlayerHead.sprite_height / 3), 1);

	draw_set_color(c_aqua);
	draw_line(gun_x, gun_y, oPlayerHead.x, oPlayerHead.y);

	/*draw_set_color(c_red);
	draw_text(100, 1000, image_angle);
	draw_text(100, 1000, point_direction(x, y, look_x, look_y) - 90);
	*/
}

draw_self();