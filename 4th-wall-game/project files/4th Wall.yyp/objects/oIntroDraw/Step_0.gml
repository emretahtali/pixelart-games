if (j) && (!endIntro) endIntro = true;

if (endIntro) && (keyboard_check_pressed(vk_anykey)) RoomGoto(r1, 1);

if (keyboard_check(vk_shift)) skipIntro ++;
else skipIntro = 0;

if (skipIntro > 60) && (!skipped)
{
	timer = false;
	text = "";
	text_current = "";
	spcAllowed = false;
	alarm[2] = 5;
	skipped = true;
}

if (timer)
{
	letters += spd;
	text_current = string_copy(text, 1, floor(letters));
}

draw_set_font(fBitCell);
w = string_width(text_current);

//SIRADAKİ YAZI
if ((global.key_jump) || (keyboard_check_pressed(vk_enter))) && (timer) && (spcAllowed)
{	
	if (letters > length)
	{	
		text = "";
		letters = 0;
		text_current = "";
		
		if (c < 9)
		{
			text = ReadFileLine(global.language, c, "Language");
			length = string_length(text);
			alarm[1] = 0;
			 c++;
		}
		else
		{
			alarm[2] = 5;
			spcAllowed = false;
		}
	}
	else 
	{
		letters = length;
	}
}