var cell_width = 42;
var cell_height = 42;

var hcells = room_width div cell_width;
var vcells = room_height div cell_height;

global.pathfinder_grid = mp_grid_create(0, 0, hcells, vcells, cell_width, cell_height);
mp_grid_add_instances(global.pathfinder_grid, oWall, true);