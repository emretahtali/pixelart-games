draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_alpha(1);

//RESİM
if (film) draw_sprite(sIntroFilm, i, room_width/2, room_height/2.65);

//YAZI
draw_set_color($dff6f5);
draw_set_font(fBitCell);
draw_set_valign(fa_top);

draw_text(room_width/2, room_height*7.5/10, text_current);