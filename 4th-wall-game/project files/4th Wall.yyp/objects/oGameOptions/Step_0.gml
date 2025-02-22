display_set_gui_size(768, 576);

#region Renkli Boşluklar
if (colorBars)
{
	window_set_color(make_color_hsv(i, j, e));

	if (i < 255) i ++;
	else i = 0;

	if (jlock)
	{
		if (j < 254) j += 2;
		else jlock = false;
	}
	else
	{
		if (j > 2) j -= 2;
		else jlock = true;
	}

	if (elock)
	{
		if (e < 253) e += irandom_range(0,3);
		else elock = false;
	}
	else
	{
		if (e > 3) e -= irandom_range(0,3);
		else elock = true;
	}
}
else if (a == 0) window_set_color(c_black); a ++;
#endregion

//KLAVYE GİRİŞLERİ
global.rightkey = (ord("D"));
global.leftkey = (ord("A"));
global.upkey = (ord("W"));
global.downkey = (ord("S"));
global.jumpkey = (vk_space);

global.key_right = keyboard_check(vk_right || ord("D"));
global.key_left = keyboard_check(vk_left || ord("A"));
global.key_up = keyboard_check(vk_up || ord("W"));
global.key_down = keyboard_check(vk_down || ord("S"));
global.key_jump = keyboard_check_pressed(vk_space);