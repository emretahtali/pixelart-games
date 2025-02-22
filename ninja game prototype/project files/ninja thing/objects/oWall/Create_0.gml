image_angle = choose(90, 180, 270, 360);

const_angle_change = irandom_range(-10, 10);
angle_change = 0;

xscale = choose(-1, 1);
yscale = choose(-1, 1);

y_change = 0;

/*
switch(image_angle)
{
	case 90: y += sprite_height; break;
	case 180:
	{
		y += sprite_height;
		x += sprite_width;
		break;
	}
	case 270: x += sprite_width; break;
}*/