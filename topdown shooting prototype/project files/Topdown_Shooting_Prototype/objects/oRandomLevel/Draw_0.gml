//draw_set_alpha(0.5);

var cam_x= camera_get_view_x(view_camera[global.camera]);
var cam_y = camera_get_view_y(view_camera[global.camera]);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var grid = 10

for (var i = 1; i < array_length(xpos); i++)
{
	draw_set_color($CC00BE);
	draw_rectangle(cam_x + 10 + (xpos[i] * grid), cam_y + 10 + (ypos[i] * grid), cam_x + 10 + ((xpos[i] + 1) * grid - 2), cam_y + 10 + ((ypos[i] + 1) * grid - 2), 0);
	draw_set_color(c_black);
	draw_rectangle(cam_x + 10 + (xpos[i] * grid - 1), cam_y + 10 + (ypos[i] * grid - 1), cam_x + 10 + ((xpos[i] + 1) * grid - 2), cam_y + 10 + ((ypos[i] + 1) * grid - 2), 1);
}

draw_set_color(c_black);
draw_circle(cam_x + 10 + (x_ * grid + (grid / 2) - 1.5), cam_y + 10 + (y_ * grid + (grid / 2) - 1.5), 1.7, 0);
draw_set_alpha(1);