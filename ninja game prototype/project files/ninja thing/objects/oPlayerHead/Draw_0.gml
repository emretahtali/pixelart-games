shader_set(shAngle);
draw_self();
shader_reset();

draw_set_alpha(1);

draw_set_color(c_white);
draw_set_font(fBitCell);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
//draw_rectangle(oPlayer.bbox_left, oPlayer.bbox_top, oPlayer.bbox_right, oPlayer.bbox_bottom, true);