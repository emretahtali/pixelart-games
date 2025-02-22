body_id = 0;
gun_current = 0;
gun_timer = 0;
look_x = oPlayer.x;
look_y = oPlayer.y;
shoot_dir = 0;
predictMovement = false;
sight_dis = 250;
wall_check_obj = 0;
player_on_sight = false;
debug = 0;

enemytype = "stand";
path = 0;

hp = 5;

gun_x = x + lengthdir_x(30, image_angle + 65);
gun_y = y + lengthdir_y(30, image_angle + 65);

divby_x = 0;
divby_y = 0;