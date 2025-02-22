if (!global.debugmode)
{
	camera_set_view_size(view_camera[0],  def_width * (11 / 10), def_height * (11 / 10));
}
else camera_set_view_size(view_camera[0],  def_width, def_height);

width_ = camera_get_view_width(view_camera[0]);
height_ = camera_get_view_height(view_camera[0]);

x = lerp(x, target.x, cam_sp);
//y = lerp(y, target.y, cam_sp);
y = y_pin;

x = clamp(x, width_ / 2, room_width - (width_ / 2));
y = clamp(y, height_ / 2, room_height - (height_ / 2));

camera_set_view_pos(view_camera[0], x - width_ / 2, y - height_ / 2);