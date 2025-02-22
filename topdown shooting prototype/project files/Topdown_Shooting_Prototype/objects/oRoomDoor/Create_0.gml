//Hedef Oda Seçimi
if (x == room_width / 2) 
{
	if (y == 0) 
	{
		target = "up"; 
		y -= 10;
	}
	else 
	{
		target = "down";
		y += 10;
	}
}
else if (x == 0) 
{
	target = "left";
	x -= 10;
}
else if (x == room_width) 
{
	target = "right";
	x += 10;
}