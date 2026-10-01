var debug_string = "";

if global.debug {
	if global.debug_preferences.mouse_coordinates {
		debug_string = string_append(debug_string, "MX = " + string(mouse_x) + "\nMY = " + string(mouse_y));
	}
}

draw_set_font(fnt_default);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_text(12, 12, debug_string);

draw_set_color(c_white);