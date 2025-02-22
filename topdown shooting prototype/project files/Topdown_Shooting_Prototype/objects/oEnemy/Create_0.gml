head = instance_create_layer(x, y, "Player", oEnemyHead);
head.body_id = id;
head.image_angle = image_angle;

head.enemytype = enemytype;
head.path = path;
path_lock = true;
onPath = false;
search_lock = true;
search_counter = 0;
path_finder = path_add();
path_return = path_add();
//path_set_precision(path_finder, 8);

path_continue_lock = true;

enemy_lastX = 0;
enemy_lastY = 0;
enemy_last_path_pos = -1;

pathfinder_wait_timer = 180;
return_pos_lock = false;

search_timer = 30;
last_x = x;
last_y = y;
move_dir = 0;
move_dis = 0;
old_x = x;
old_y = y;

hsp = 0;
vsp = 0;
walksp = 4;

//states: normal, search
state = "normal";

player_lastseenX  = 0;
player_lastseenY  = 0;