if (rot)
{
	if (image_angle < 90) image_angle += i;
	else rot = 0;
	if (image_angle <= 45) i+= rotsp;
	else i-= rotsp;
}
else
{
	if (image_angle > 0) image_angle -= i;
	else rot = 1;
	if (image_angle >= 45) i+= rotsp;
	else i-= rotsp;
}