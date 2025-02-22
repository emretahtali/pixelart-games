draw_set_font(font0);
/*draw_set_alpha(1);
if (global.key_shoot) draw_text(300, 100, "TRUE");
else draw_text(300, 100, "FALSE");


/*draw_set_color(c_red);

draw_text(180, 30, x_ + 1);
draw_text(210, 30, y_ + 1);
draw_text(240, 30, room);
draw_text(270, 30, ds_grid_get(rmList, 2, ds_grid_value_y(rmList, 2, 0, 2, ds_grid_height(rmList) - 1, room)));
draw_text(300, 30, h + 1);
draw_text(330, 30, ds_grid_value_y(rmList, 2, 0, 2, ds_grid_height(rmList) - 1, room) + 1);

draw_text(30, 30, ds_grid_get(rmList, 0, 0) + 1);
draw_text(60, 30, ds_grid_get(rmList, 1, 0) + 1);
draw_text(90, 30, ds_grid_get(rmList, 2, 0));
draw_text(30, 50, ds_grid_get(rmList, 0, 1) + 1);
draw_text(60, 50, ds_grid_get(rmList, 1, 1) + 1);
draw_text(90, 50, ds_grid_get(rmList, 2, 1));
draw_text(30, 70, ds_grid_get(rmList, 0, 2) + 1);
draw_text(60, 70, ds_grid_get(rmList, 1, 2) + 1);
draw_text(90, 70, ds_grid_get(rmList, 2, 2));
draw_text(30, 90, ds_grid_get(rmList, 0, 3) + 1);
draw_text(60, 90, ds_grid_get(rmList, 1, 3) + 1);
draw_text(90, 90, ds_grid_get(rmList, 2, 3));
draw_text(30, 110, ds_grid_get(rmList, 0, 4) + 1);
draw_text(60, 110, ds_grid_get(rmList, 1, 4) + 1);
draw_text(90, 110, ds_grid_get(rmList, 2, 4));
draw_text(30, 130, ds_grid_get(rmList, 0, 5) + 1);
draw_text(60, 130, ds_grid_get(rmList, 1, 5) + 1);
draw_text(90, 130, ds_grid_get(rmList, 2, 5));
draw_text(30, 150, ds_grid_get(rmList, 0, 6) + 1);
draw_text(60, 150, ds_grid_get(rmList, 1, 6) + 1);
draw_text(90, 150, ds_grid_get(rmList, 2, 6));
draw_text(30, 170, ds_grid_get(rmList, 0, 7) + 1);
draw_text(60, 170, ds_grid_get(rmList, 1, 7) + 1);
draw_text(90, 170, ds_grid_get(rmList, 2, 7));
draw_text(30, 190, ds_grid_get(rmList, 0, 8) + 1);
draw_text(60, 190, ds_grid_get(rmList, 1, 8) + 1);
draw_text(90, 190, ds_grid_get(rmList, 2, 8));
draw_text(30, 210, ds_grid_get(rmList, 0, 9) + 1);
draw_text(60, 210, ds_grid_get(rmList, 1, 9) + 1);
draw_text(90, 210, ds_grid_get(rmList, 2, 9));