//KLAVYE GİRİŞLERİ
global.key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
global.key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
global.key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
global.key_jump = keyboard_check_pressed(vk_space);

//HAREKET HESAPLAMA
move = global.key_right - global.key_left;
hsp = move * walksp;
vsp += grv;

if (global.textbox) || (!oRoomActions.r1unfr) canmove = false;
else canmove = true;

//ZIPLA
if (global.key_jump) && (canmove)
{
	if (canjump)
	{
		vsp = -5;
		canjump = false;
	}
	else if (place_meeting(x, y + 16, oWall)) jumpbuffer = true;
}

//YATAY KATILIK
if (hsp != 0)
{
	if (place_meeting(x+hsp, y, oWall))
	{
		while (!place_meeting(x+sign(hsp), y, oWall))
		{
			x += sign(hsp);
		}
		hsp = 0;
	}
	if (canmove) x += hsp;
}

//DİKEY KATILIK
if (vsp != 0)
{
	if (place_meeting(x, y+vsp, oWall))
	{
		while(!place_meeting(x, y+sign(vsp), oWall))
		{
			y += sign(vsp);
		}
		vsp = 0;
	}
	y += vsp;
}


//ANİMASYON
if (!place_meeting(x, y+1, oWall))
{
	canjump = false;
	sprite_index = sCharJump;
	image_speed = 0;
	if(sign(vsp) > 0) image_index = 1;
	else image_index = 0;
}
else 
{
	canjump = true;
	if (!global.key_jump)
	{
		if (hsp == 0) || (!canmove) sprite_index = sChar;
		else sprite_index = sCharRun; image_speed = 1;
	}

	if (jumpbuffer)
	{
		vsp = -5;
		canjump = false;
		jumpbuffer = false;
	}
}

//BAKIŞ YÖNÜ
if(hsp != 0) && (canmove) image_xscale = sign(hsp);

//KAPI
doorID = instance_place(x,y,oDoor);
if  (doorID != noone) && ((keyboard_check_pressed(ord("W"))) || (keyboard_check_pressed(vk_up)))
{
	if (!doorID.locked)
	{
		global.spawnX_ = doorID.spawnX;
		global.spawnY_ = doorID.spawnY;
		if (doorID.lookdir != 0) global.lookdir_ = doorID.lookdir;
		else global.lookdir_ = image_xscale;
		
		RoomGoto(doorID.target_rm, 1);
	}
	else
	{
		drawLockedSign = true;
		
		if (doorID.image_index == 0)
		{
			door_saved_x = doorID.x;
			door_saved_y = doorID.y;
		}
		else
		{
			door_saved_x = doorID.x - 5 * doorID.image_xscale;
			door_saved_y = doorID.y + 3;
		}
	}
	ScreenShake(3, 20);
}

//Etkileşim
if instance_exists(oInteraction) && (!global.textbox) && ((keyboard_check_pressed(ord("W"))) || (keyboard_check_pressed(vk_up)))
{
	var interacted_id = instance_position(x, y, oInteraction);
	with(interacted_id)
	{
		ScreenShake(3, 20);
		NewTextBox(line[0], avatar[0], face[0]);
		if (array_length(line) > 1)
		{
			for (var i = 1; i < array_length(line); i++)
			{
				AddToTextBox(line[i], avatar[i], face[i]);
			}
		}
	}
}