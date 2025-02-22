var mx = ((mouse_x div 42) * 42) + 21;
var my = ((mouse_y div 42) * 42) + 21;

//var mx = mouse_x;
//var my = mouse_y;

if (mp_grid_path(global.pathfinder_grid, path, x, y, mx, my, 1))
{
	path_start(path, 4, path_action_stop, 0);
}