draw_set_color(c_black);
draw_set_font(fnt_default);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
//debug_message(object_index, id, "time sig count " + string(time_signature_count));
draw_text(105, 1430,
	"Measure " +
	string(ceil(beat/(time_signature_count))) +
	"\nBeat " +
	string((floor(beat mod (time_signature_count))) + 1)
);
draw_set_color(c_white);