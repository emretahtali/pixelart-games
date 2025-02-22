#region keyboard and gamepad input
var key_right = keyboard_check(ord("D")) || gamepad_button_check(global.connected_gamepad, gp_padr) || (gamepad_axis_value(global.connected_gamepad, gp_axislh) > .1)// || keyboard_check(vk_right);
var key_left = keyboard_check(ord("A")) || gamepad_button_check(global.connected_gamepad, gp_padl) || (gamepad_axis_value(global.connected_gamepad, gp_axislh) < -.1) //|| keyboard_check(vk_left);
var key_jump = keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(global.connected_gamepad, gp_face4)// || keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_space);
var key_dash = keyboard_check_pressed(ord("J")) || gamepad_button_check_pressed(global.connected_gamepad, gp_face3) || keyboard_check_pressed(ord("Z"));

#region gamepad direction
var angle_ = point_direction(0, 0, gamepad_axis_value(global.connected_gamepad, gp_axislh), gamepad_axis_value(global.connected_gamepad, gp_axislv));

var angle_targ = min(abs(angle_ - angle_i), abs((angle_ + 360) - angle_i), abs((angle_ - 360) - angle_i));

if (angle_targ == abs(angle_ - angle_i)) angle_target = angle_;
else if (angle_targ == abs((angle_ + 360) - angle_i)) angle_target = angle_ + 360;
else if (angle_targ == abs((angle_ - 360) - angle_i)) angle_target = angle_ - 360;

angle_i = (lerp(angle_i, angle_target, lerp_) mod 360 < 0) ? lerp(angle_i, angle_target, lerp_) mod 360 + 360 : lerp(angle_i, angle_target, lerp_) mod 360;
global.gamepad_direction = angle_i;
global.gamepad_realdirection = angle_;

#endregion

#endregion

//movement calculation
hsp = lerp(hsp, (key_right - key_left) * walksp, .6);

#region jump
if (key_jump)
{
	if (canjump > 0)
	{
		vsp = -jumpsp;
		canjump = 0;
	}
	else if (collision_line(x, y, x, y + jumpbufferdis, oWall, false, true))
	{
		jumpbuffer = 60;
	}
}

vsp += grv;

#endregion

#region dash
if (key_dash) && (candash) && ((gamepad_axis_value(global.connected_gamepad, gp_axislh) != 0) || (gamepad_axis_value(global.connected_gamepad, gp_axislv) != 0))
{
	var dash_ = 0;
	
	var dashxx_ = lengthdir_x(dashsp - dash_, global.gamepad_realdirection);
	var dashyy_ = lengthdir_y(dashsp - dash_, global.gamepad_realdirection);
	
	var dashxxx_ = lengthdir_x(10, global.gamepad_realdirection - 90);
	var dashyyy_ = lengthdir_y(10, global.gamepad_realdirection - 90);
	
	while (collision_line(x + dashxxx_, y + dashyyy_, x + dashxxx_ + dashxx_, y + dashyyy_ + dashyy_, oWall, false, true)) || (collision_line(x - dashxxx_, y - dashyyy_, x - dashxxx_ + dashxx_, y - dashyyy_ + dashyy_, oWall, false, true))
	{
		dash_ ++;
		
		var dashxx_ = lengthdir_x(dashsp - dash_, global.gamepad_realdirection);
		var dashyy_ = lengthdir_y(dashsp - dash_, global.gamepad_realdirection);
		
		if (dash_ > 91) break;
	}
	
	dashxx_ = lengthdir_x(dashsp - dash_ - min(16, dashsp - dash_), global.gamepad_realdirection);
	dashyy_ = lengthdir_y(dashsp - dash_ - min(16, dashsp - dash_), global.gamepad_realdirection);
	show_debug_message(dashsp - dash_ - min(16, dashsp - dash_));
	
	candash = false;
	player_dashed = true;
	pre_dashX = x;
	pre_dashY = y;
	dashX = x + dashxx_;
	dashY = y + dashyy_;
	dashdir = global.gamepad_realdirection;
	dashlength = dashsp - dash_ - min(16, dashsp - dash_);
	
	dashfric = dashfricmax;
	
	x += dashxx_;
	y += dashyy_;
}

if (dashfric > 0)
{
	if (dashfric == dashfricmax)
	{
		var dashfricY = lengthdir_y(dashfric, dashdir);
		vsp = dashfricY;
	}
	
	var dashfricX = lengthdir_x(dashfric, dashdir);
	hsp += dashfricX;
	
	dashfric -= dashfricsp;	
}

#endregion

#region walls
if (place_meeting(x + hsp, y, oWall))
{
	while (!place_meeting(x + sign(hsp), y, oWall)) x += sign(hsp);
	hsp = 0;
}
x += hsp;

if (place_meeting(x, y + vsp, oWall))
{
	while (!place_meeting(x, y + sign(vsp), oWall)) y += sign(vsp);
	vsp = 0;
}
y += vsp;

#endregion

#region animations
//sprite_collision_mask(id, false, 2, 8, 12, 23, 31, bboxkind_rectangular, 0);

/*if (sign(hsp) != 0) image_xscale = sign(hsp);

image_xscale = (1 - ((abs(vsp) / 5) * .3)) * sign(image_xscale);*/

var _walllist = ds_list_create();
var _num = instance_place_list(x, y + 1, oWall, _walllist, false);
if (_num > 0)
{
	if (hsp != 0)
	{
		sprite_index = sPlayerRun;
		idle_anim_reset = false;
		
		image_speed = abs(hsp) / walksp;
		
		if (image_speed != 0) image_speed = clamp(image_speed, .8, 1);
	}
	else
	{
		image_speed = 1;
		
		sprite_index = sPlayerIdle;
		if (!idle_anim_reset)
		{
			idle_anim_reset = true;
			image_index = 1;
		}
	}
	
	canjump = 5;
	candash = true;
	on_ground = true;
	
	if (jumpbuffer > 0)
	{
		vsp = -jumpsp;
		jumpbuffer = 0;
	}
	
	//wall interactions
	for (var i = 0; i < _num; i ++)
	{
		with(_walllist[|i])
		{
			angle_change = ((x - other.x) / (sprite_width / 2 + other.sprite_width / 2)) * 20;
			y_change = 1;
		}
	}
}
else
{
	sprite_index = sPlayerIdle;
	image_index = 1;
	
	if (canjump > 0) canjump --;
	if (jumpbuffer > 0) jumpbuffer --;
	
	on_ground = false;
}

ds_list_destroy(_walllist);

#endregion