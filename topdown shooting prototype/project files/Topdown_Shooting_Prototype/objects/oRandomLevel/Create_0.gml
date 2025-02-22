wh = 10;
startPoint = floor((wh - 1) / 2);
one = [startPoint, startPoint];
rmCount = 10;
rot = 0;
oldrot = 0;
edge = false;
h = 0;

xpos[0] = 0;
ypos[0] = 0;

map = ds_grid_create(wh, wh);
ds_grid_set_region(map, 0, 0, wh - 1, wh - 1, 0);

rmList = ds_grid_create(3, rmCount);

do
{
	ds_grid_set(map, one[0], one[1], 1);
	
	if (rot == 0)
	{
		rot = choose("up", "down", "right", "left");
		switch(rot)
		{
			case "up": one[1] --; break;
			case "down": one[1] ++; break;
			case "right": one[0] ++; break;
			case "left": one[0] --; break;
		}
	}
	else
	{
		do
		{
			oldrot = rot;
			switch(rot)
			{
				case "up":
				{
					rot = choose("up", "right", "left");
					switch(rot)
					{
						case "up": one[1] --; break;
						case "right": one[0] ++; break;
						case "left": one[0] --; break;
					}
					break;
				}
		
				case "down":
				{
					rot = choose("down", "right", "left");
					switch(rot)
					{
						case "down": one[1] ++; break;
						case "right": one[0] ++; break;
						case "left": one[0] --; break;
					}
					break;
				}
		
				case "right":
				{
					rot = choose("up", "down", "right");
					switch(rot)
					{
						case "up": one[1] --; break;
						case "down": one[1] ++; break;
						case "right": one[0] ++; break;
					}
					break;
				}
		
				case "left":
				{
					rot = choose("up", "down", "left");
					switch(rot)
					{
						case "up": one[1] --; break;
						case "down": one[1] ++; break;
						case "left": one[0] --; break;
					}
					break;
				}
			}
		
			if ((one[0] == -1) || (one[0] == wh) || one[1] == -1 || (one[1] == wh) || ((one[0] != ds_grid_value_x(map, 0, 0, wh - 1, wh - 1, 1)) && (one[1] != ds_grid_value_y(map, 0, 0, wh - 1, wh - 1, 1))))
			{
				one[0] = ds_grid_value_x(map, 0, 0, wh - 1, wh - 1, 1);
				one[1] = ds_grid_value_y(map, 0, 0, wh - 1, wh - 1, 1);
				edge = true;
				rot = oldrot;
			}
			else edge = false;
		}
		until (!edge);
	}
	ds_grid_set(map, ds_grid_value_x(map, 0, 0, wh - 1, wh - 1, 1), ds_grid_value_y(map, 0, 0, wh - 1, wh - 1, 1), 2);
}
until((ds_grid_get_sum(map, 0, 0, wh - 1, wh -1) div 2) == rmCount);


ds_grid_set(rmList, 0, 0, startPoint);
ds_grid_set(rmList, 1, 0, startPoint);
ds_grid_set(rmList, 2, 0, r0);

var a = 0;
var chRooms = array_create(0, []);
var check = false;

for (var i = 0; i < wh; i++)
{
	for (var j = 0; j < wh; j++)
	{
		if ((ds_grid_get(map, i, j) == 2) && (!((i == startPoint) && (j == startPoint))))
	   {
			a++;
			ds_grid_set(rmList, 0, a, i);
			ds_grid_set(rmList, 1, a, j);
			
			ds_grid_set(rmList, 2, a, r0);
			//do
			//{
			//	check = false;
			//	ds_grid_set(rmList, 2, a, choose(r1, r2, r3, r4, r5, r6, r7, r8, r9, r10));
			//	if (array_length(chRooms) != 0)
			//	{
			//		for (var l = 0; l < array_length(chRooms); l++)
			//		{
			//			if (ds_grid_get(rmList, 2, a) == chRooms[l]) check = true;
			//		}
			//	}
			//}
			//until !check;
			
			chRooms[array_length(chRooms)] = ds_grid_get(rmList, 2, a);
	   }
	}
}

for (var i = 0; i < wh; i++)
{
	for (var j = 0; j < wh; j++)
	{
		if (ds_grid_get(map, i, j) == 2)
	   {
		   xpos[array_length(xpos)] = i;
		   ypos[array_length(ypos)] = j;
	   }
	}
}