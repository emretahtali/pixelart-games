//KLAVYE
global.key_left = keyboard_check(ord("A"));
global.key_right = keyboard_check(ord("D"));
global.key_forward = keyboard_check(ord("W"));
global.key_backward = keyboard_check(ord("S"));
global.key_shift = keyboard_check(vk_shift);
global.key_interact = keyboard_check_pressed(ord("E"));
global.key_shoot = keyboard_check(ord("Q")) || mouse_check_button(mb_left);

if (keyboard_check(vk_control))
{
	if (keyboard_check_pressed(ord("F"))) window_set_fullscreen(!window_get_fullscreen());
	if (keyboard_check_pressed(ord("G"))) game_restart();
	if (keyboard_check_pressed(ord("R"))) room_restart();
	if (keyboard_check_pressed(ord("P"))) room_speed = 62 - room_speed;
}
if (keyboard_check_pressed(vk_escape)) game_end();

if (!instance_exists(oPlayerHead)) room_restart();