target_ = oPlayer;

width_ = camera_get_view_width(view_camera[global.camera]);
height_ = camera_get_view_height(view_camera[global.camera]);

x = target_.x;
y = target_.y;

global.camlock = true;

shake_magnitude = 0;
shake_remain = 0;
shake_length = 0;