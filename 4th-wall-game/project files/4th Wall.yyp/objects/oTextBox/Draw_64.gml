draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color($dff6f5);
draw_set_alpha(1);

if (global.textbox) && (c < line_count)
{
	draw_sprite_ext(sTextbox, 0, display_get_gui_width() / 2, display_get_gui_height() / 2, 3, 3, 0, c_white, 1);
	
	for (var i = 0; i < choice_current; i++) text_current = string_replace(text_current, "●", " ");
	text_current = string_replace(text_current, "●", ">");
	for (var i = 0; i < choice_count - choice_current; i++) text_current = string_replace(text_current, "●", " ");
	
	if  (avatar[c] != 0)
	{
		draw_sprite_ext(avatar[c], face[c], 25, 380, 4.5, 4.5, 0, c_white, 1);

		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_font(fBitCell);
		draw_text(190, 410, text_current);
	}
	else
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_font(fBitCell);
		draw_text(70, 410, text_current);
	}
}