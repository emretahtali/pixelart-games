if (view_enabled) && (instance_exists(target_))
{
	width_ = camera_get_view_width(view_camera[0]);
	height_ = camera_get_view_height(view_camera[0]);

	x = target_.x;
	y = target_.y;
}