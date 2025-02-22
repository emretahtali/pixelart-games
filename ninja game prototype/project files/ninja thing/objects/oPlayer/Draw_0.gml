//draw_self();
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
//draw_set_color(make_color_rgb(187, 37, 55));
draw_set_color(c_white);
draw_set_font(fBitCell);

//if ((gamepad_axis_value(global.connected_gamepad, gp_axislh) != 0) || (gamepad_axis_value(global.connected_gamepad, gp_axislv) != 0)) draw_line_width(x, y, x + lengthdir_x(128, global.gamepad_direction), y + lengthdir_y(128, global.gamepad_direction), 5);

#region dash
if (player_dashed)
{
	if (player_dashed_timer > 0)
	{
		//draw_line_width(pre_dashX, pre_dashY, dashX, dashY, 3);
		
		//draw_line_width(pre_dashX - lengthdir_x(64, dashdir), pre_dashY - lengthdir_y(64, dashdir), dashX + lengthdir_x(64, dashdir), dashY + lengthdir_y(64, dashdir), 5);
		
		////////////////////////////////////////
/*		var xxx = pre_dashX + lengthdir_x(10, dashdir - 90);
		var yyy = pre_dashY + lengthdir_y(10, dashdir - 90);
		
		var xxxx = xxx + (dashX - pre_dashX);
		var yyyy = yyy + (dashY - pre_dashY);
		
		draw_line_width(xxx, yyy, xxxx, yyyy, 3);
		
		////////////////////////////////////////
		var xxx = pre_dashX + lengthdir_x(10, dashdir + 90);
		var yyy = pre_dashY + lengthdir_y(10, dashdir + 90);
		
		var xxxx = xxx + (dashX - pre_dashX);
		var yyyy = yyy + (dashY - pre_dashY);
		
		draw_line_width(xxx, yyy, xxxx, yyyy, 3);*/
		
		for (var i = 1; i < dashlength div 20 + min(2, dashlength div 32); i ++)
		{
			draw_sprite(sPlayerIdle, 0, pre_dashX + lengthdir_x(i * (dashlength / (dashlength div 20)), dashdir), pre_dashY + lengthdir_y(i * (dashlength / (dashlength div 20)), dashdir));
		}
		
		player_dashed_timer --;
	}
	else
	{
		player_dashed_timer = 5;
		player_dashed = false;
	}
	
	/*if (player_dashed_timer == 9)
	{
		for (var i = 1; i < dashlength div 20 + min(2, dashlength div 32); i ++)
		{
			draw_sprite(sPlayerIdle, 0, pre_dashX + lengthdir_x(i * (dashlength / (dashlength div 20)), dashdir), pre_dashY + lengthdir_y(i * (dashlength / (dashlength div 20)), dashdir));
		}
	}*/
}
#endregion

if (global.debugmode)
{
	var xxx = lengthdir_x(10, global.gamepad_realdirection - 90);
	var yyy = lengthdir_y(10, global.gamepad_realdirection - 90);
		
	var xxxx = lengthdir_x(dashsp, global.gamepad_realdirection);
	var yyyy = lengthdir_y(dashsp, global.gamepad_realdirection);
		
	draw_line_width(x + xxx, y + yyy, x + xxx + xxxx, y + yyy + yyyy, 1);
		
	draw_line_width(x - xxx, y - yyy, x - xxx + xxxx, y - yyy + yyyy, 1);
}

//draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);