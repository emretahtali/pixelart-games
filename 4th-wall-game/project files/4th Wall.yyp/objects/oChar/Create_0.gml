vsp = 0;
hsp = 0;
walksp = 2;
grv = 0.3;

canjump = 0;
canmove = true;

jumpbuffer = false;

drawLockedSign = 0;
LockedSignTime = 0;

door_saved_x = -1;
door_saved_y = -1;
//door_saved_img_index = 0;

if (global.spawnX_ != 0)
{
	x = global.spawnX_;
	y = global.spawnY_;
	image_xscale = global.lookdir_;
}