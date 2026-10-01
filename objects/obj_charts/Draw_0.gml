draw_set_colour(c_black);

var chart_objects = [];
with (obj_charts) {
	array_push(chart_objects, id);
}
draw_set_alpha(3/array_length(chart_objects));
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _y = 1394
draw_text(173, _y, chart + 1);
draw_text(339, _y, charts[chart+1].counts);

if instance_exists(obj_conductor) {
	var measures = string(add_array_struct_variable(charts, chart, "counts")/obj_conductor.time_signature_count) + " - " + string(add_array_struct_variable(charts, chart+1, "counts")/obj_conductor.time_signature_count);
	draw_text(542, _y, measures);
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);

draw_set_alpha(1)
//if !(colors) {
	if labels && symbol != "X" {
		draw_text(x + sprite_height - 8, y - sprite_height + 3, label);
	}
//} else {
//	draw_set_halign(fa_center);
//	draw_set_valign(fa_middle);
//	draw_set_color(c_gray);
	//draw_text(x, y, symbol)
//}
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);