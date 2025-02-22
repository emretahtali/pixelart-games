if (global.camlock) && ((keyboard_check_pressed(vk_anykey)) || (mouse_check_button_pressed(mb_any))) global.camlock = false;

center_x = target_.x + ((mouse_x - target_.x) / 5);
center_y = target_.y + ((mouse_y - target_.y) / 5);

if (global.camlock)
{
	x = target_.x;
	y = target_.y;
}
else 
{
	x = lerp(x, center_x, 0.4);
	y = lerp(y, center_y, 0.4);
}

x = clamp(x, width_ / 2, room_width - width_ / 2);
y = clamp(y, height_ / 2, room_height - height_ / 2);

//Screen Shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));

//Setting the cam
camera_set_view_pos(view_camera[0], x - width_ / 2, y - height_ / 2);