draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

for (var i = 0; i < oPlayerHead.hp; i++)
{
	draw_sprite(sHealthBar, 0, cam_x + 120 + (i * 12), cam_y + 20);
}
/*
if (instance_exists(oEnemy)) for (var i = 0; i < oEnemyHead.hp; i++)
{
	draw_sprite(sHealthBar, 0, cam_x + 120 + (i * 12), cam_y + 40);
}