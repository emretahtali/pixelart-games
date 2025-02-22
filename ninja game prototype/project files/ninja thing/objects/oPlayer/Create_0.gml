hsp = 0;
vsp = 0;
walksp = 4;
grv = .25;
jumpsp = 5;
dashsp = 90;

dashfricmax = jumpsp;
dashfric = 0;
dashfricsp = .5;

global.gamepad_direction = 0;
global.gamepad_realdirection = 0;
angle_i = 0;
lerp_ = .3;

idle_anim_reset = false;

on_ground = false;
canjump = 5;
jumpbufferdis = 30;
jumpbuffer = 0;

candash = true;
player_dashed = false;
player_dashed_timer = 5;
pre_dashX = 0;
pre_dashY = 0;
dashX = 0;
dashY = 0;
dashdir = 0;
dashlength = 0;

instance_create_layer(x, y, "player", oPlayerHead);