y -= 1;
alpha -= 0.02;

draw_set_halign(fa_right);
draw_set_alpha(alpha);
draw_set_colour(c_black);
draw_set_font(fnt_default);
draw_text(room_width - 6, y, text);

draw_set_halign(fa_left);
draw_set_alpha(1);
draw_set_colour(c_white);

if alpha == 0 {
	instance_destroy();
}