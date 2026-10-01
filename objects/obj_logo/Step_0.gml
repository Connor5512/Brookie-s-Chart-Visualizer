if mouse_check_button_pressed(mb_left) {
	if position_meeting(mouse_x, mouse_y, id) && ((visible) && (layer_get_visible(layer))) {
		clicked_times++;
	} else {
		clicked_times = 0;
	}
	
	//create_message(clicked_times)
}

if !(visible) || !(layer_get_visible(layer)) {
	clicked_times = 0;
}

if !(global.debug) {
	if clicked_times == 12 {
		global.debug = true;
		create_message("Debug mode enabled!")
		window_set_caption(window_get_caption() + " (DEBUG)")
		
		clicked_times = 0;
	}
} else {
	if clicked_times == 1 {
		global.debug = false;
		create_message("Debug mode disabled!")
		window_set_caption(string_replace(window_get_caption(), " (DEBUG)", ""));
		
		clicked_times = 0;
	}
}

image_index = global.debug;