draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);

if variable_instance_exists(id, "butn_text") {
	draw_set_font(fnt_headers);
	draw_set_color(c_black);
	draw_text_ext_transformed(x + 26, y + 22, butn_text, 9999, 9999, 1.374748, 1.374748, 0);
	draw_set_color(c_white);
}

if info_text != "" {
	icon = spr_info;
}

draw_sprite_ext(icon, 0, x + (sprite_width/2), y + (sprite_height/2), 0.1707304, 0.1707304, 0, c_white, 1);