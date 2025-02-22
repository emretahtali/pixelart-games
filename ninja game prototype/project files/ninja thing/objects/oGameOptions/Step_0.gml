//controls
if (keyboard_check(vk_control))
{
	if (keyboard_check_pressed(ord("F"))) window_set_fullscreen(!window_get_fullscreen());
	if (keyboard_check_pressed(ord("G"))) game_restart();
	if (keyboard_check_pressed(ord("R"))) room_restart();
	if (keyboard_check_pressed(ord("P"))) room_speed = 62 - room_speed;
	//if (keyboard_check_pressed(ord("D"))) global.debugmode = !global.debugmode;
}

if (keyboard_check_pressed(vk_escape)) game_end();

//gamepad connecting
for (var i = 0; i < 12; i ++)
{
	if (gamepad_is_connected(i))
	{
		global.connected_gamepad = i;
		break;
	}
}

//walls disabling
for (var i = 0; i < ds_list_size(wall_list); i++)
{
	var _wall = wall_list[|i];
	
	if (!point_in_rectangle(_wall.x, _wall.y,
	oCamera.x - oCamera.width_ / 2 - oWall.sprite_width * 3,
	oCamera.y - oCamera.height_ / 2 - oWall.sprite_height * 3,
	oCamera.x + oCamera.width_ / 2 + oWall.sprite_width * 3,
	oCamera.y + oCamera.height_ / 2 + oWall.sprite_height * 3))
	{
		instance_deactivate_object(_wall);
	}
	else instance_activate_object(_wall);
}

/* (var i = 0; i < ds_list_size(deactivated_wall_list); i++)
{
	if ()
}
/*
