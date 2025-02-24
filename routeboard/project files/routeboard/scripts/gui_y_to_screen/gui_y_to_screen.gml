/// @function gui_x_to_screen(coord);
/// @param {real} coord the coordinate to be converted

function gui_y_to_screen(coord)
{
	return camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) * (coord / display_get_gui_height()));
}