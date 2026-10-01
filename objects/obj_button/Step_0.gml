if (debug_only) && !(global.debug) {
	visible = false;
} else {
	visible = true;
}

if !(visible) || !(layer_get_visible(layer)) {
	image_index = 0;
	exit;
}

if !(clickable) {
	image_index = 2;
	exit;
}

if position_meeting(mouse_x, mouse_y, id) {
	window_set_cursor(mouse_hover);
	image_index = 1;
	if mouse_check_button_pressed(mb_left) {
		script_execute(click_script);
		if toggle {
			toggle_state = !(toggle_state);
		}
	}
} else {
	if !(position_meeting(mouse_x, mouse_y, obj_button)) {
		window_set_cursor(cr_default);
	}
	image_index = 0;
}

if toggle {
	image_index = toggle_state;
}