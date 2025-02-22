draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_alpha(1);
draw_set_color($a1b2b1);

//İNTROYU GEÇ
if (e < 240) && (!skipped)
{
	var txt_ = StringNextLine(12, ReadFileLine(global.language, 1, "Language"));
	var txt_w = string_width(StringNextLine(12, ReadFileLine(global.language, 1, "Language"))) * (3/4);
	var txt_h = string_height(StringNextLine(12, ReadFileLine(global.language, 1, "Language"))) * (3/4);
	var n = string_count("\n", txt_);
	
	if (60 < e && e < 120) 
	{
		draw_set_alpha((e - 60) / 60);
		draw_text_transformed(70 - (txt_w / 2) - 10, 70, "[", 3/4, (2*n +1) / (4/3) + 0.2, 0);
		draw_text_transformed(70, 70, StringNextLine(12, ReadFileLine(global.language, 1, "Language")), 3/4, 3/4, 0);
		draw_text_transformed(68 + (txt_w / 2) + 10, 70, "]", 3/4, (2*n +1) / (4/3) + 0.2, 0);
	}
	else if (120 <= e && e < 180)
	{
		draw_text_transformed(70 - (txt_w / 2) - 10, 70, "[", 3/4, (2*n +1) / (4/3) + 0.2, 0);
		draw_text_transformed(70, 70, StringNextLine(12, ReadFileLine(global.language, 1, "Language")), 3/4, 3/4, 0);
		draw_text_transformed(68 + (txt_w / 2) + 10, 70, "]", 3/4, (2*n +1) / (4/3) + 0.2, 0);
	}
	else if (180 <= e && e < 240)
	{
		draw_set_alpha((60 - (e - 180)) / 60);
		draw_text_transformed(70 - (txt_w / 2) - 10, 70, "[", 3/4, (2*n +1) / (4/3) + 0.2, 0);
		draw_text_transformed(70, 70, StringNextLine(12, ReadFileLine(global.language, 1, "Language")), 3/4, 3/4, 0);
		draw_text_transformed(68 + (txt_w / 2) + 10, 70, "]", 3/4, (2*n +1) / (4/3) + 0.2, 0);
	}
	
	e ++;
}

//BAŞLIK
draw_set_alpha(1);
draw_set_color($dff6f5)
if (title) 
{
	draw_text_transformed(display_get_gui_width() / 2, display_get_gui_height() / 16 * 5, "4th Wall", 7, 7, 5);

	if (j) draw_text_transformed(display_get_gui_width() / 2, display_get_gui_height() / 16 * 9, ReadFileLine(global.language, 9, "Language"), 1, 1, 5);
}