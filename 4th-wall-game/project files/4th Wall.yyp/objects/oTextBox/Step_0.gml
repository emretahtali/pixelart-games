if (global.textbox)
{
	line_count = array_length_1d(line);
	if (c < line_count - 1) ln_ = line[c];
	else if (line_count == 1) ln_ = line[c];
	if (firstline)
	{
		text = StringNextLine(47, ReadFileLine(global.language, ln_, "Language"));
		
		if (ReadFileLine(global.language, ln_ + 1, "Language") == "_ch_")
		{
			global.textbox_choice_mode = true;
			
			text += " ●  ";
			linecounter = ln_+ 2;
			choice_count = linecounter;
			while (1)
			{
				if (ReadFileLine(global.language, linecounter, "Language") != "_ch_")
				{
					text = text + "\n" + " ●  ";
					text += ReadFileLine(global.language, linecounter, "Language");
					linecounter ++;
				}
				else
				{
					choice_count = linecounter - choice_count;
					break;
				}
			}
		}
		firstline = false;
	}
	length = string_length(text);
	letters += spd;
	text_current = string_copy(text, 1, floor(letters));
	
	if (global.textbox_choice_mode)
	{
		if (keyboard_check_pressed(global.upkey))
		{
			if (choice_current > 1) choice_current --;
			else choice_current = choice_count;
		}
		if (keyboard_check_pressed(global.downkey))
		{
			if (choice_current < choice_count) choice_current ++;
			else choice_current = 1;
		}
	}
}
else
{
	line = 0;
	avatar = 0;
	face = 0;
	line[0] = 0;
	avatar[0] = 0;
	face[0] = 0;
	c = 0;
	letters = 0;
	text = "";
	length = string_length(text);
	text_current = "";
	w = 0;
	firstline = true;
	
	if (delayed_line[0] != 0)
	{
		global.textbox = true;
		array_copy(line, 0, delayed_line, 0, array_length_1d(delayed_line));
		array_copy(avatar, 0, delayed_avatar, 0, array_length_1d(delayed_avatar));
		array_copy(face, 0, delayed_face, 0, array_length_1d(delayed_face));
	}
	delayed_line = 0;
	delayed_avatar = 0;
	delayed_face = 0;
	delayed_line[0] = 0;
	delayed_avatar[0] = 0;
	delayed_face[0] = 0;
}

draw_set_font(fBitCell);
w = string_width(text_current);

//SIRADAKİ YAZI
if (global.key_jump) && (global.textbox)
{
	if (letters > length)
	{	
		text = "";
		letters = 0;
		text_current = "";
		
		if (!global.textbox_choice_mode)
		{
			choice_count = 0;
			choice_current = 1;
			linecounter = 0;
			
			if (c < line_count - 1)
			{
				c++;
				if (c < line_count) ln_ = line[c];
				text = StringNextLine(47, ReadFileLine(global.language, ln_, "Language"));
			
				if (ReadFileLine(global.language, ln_ + 1, "Language") == "_ch_")
				{
					global.textbox_choice_mode = true;
				
					text += " ●  ";
					linecounter = ln_+ 2;
					choice_count = linecounter;
					while (1)
					{
						if (ReadFileLine(global.language, linecounter, "Language") != "_ch_")
						{
							text = text + "\n" + " ●  ";
							text += ReadFileLine(global.language, linecounter, "Language");
							linecounter ++;
						}
						else
						{
							choice_count = linecounter - choice_count;
							break;
						}
					}
				}								
				text = StringNextLine(47, text);
				length = string_length(text);
			}
			else
			{
				global.textbox = false;
			}
		}
		else
		{
			oChoices.line = (linecounter - 1) - (choice_count - choice_current)
			global.textbox_choice_mode = false;
			global.textbox = false;
			
			choice_count = 0;
			choice_current = 1;
		}
	}
	else 
	{
		letters = length;
	}
}