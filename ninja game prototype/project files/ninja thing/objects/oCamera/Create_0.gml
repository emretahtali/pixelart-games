width_ = camera_get_view_width(view_camera[0]);
height_ = camera_get_view_height(view_camera[0]);

def_width = width_;
def_height = height_;

cam_sp = .1;

target = oPlayer;

x = target.x;
y = target.y;

y_pin = y - height_ * 5 / 16;