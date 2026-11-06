if variable_global_exists("button_init") {
	if button == "Pause in menu" {
		global.preferences.pause_in_menu = !(global.preferences.pause_in_menu);
	} else if button == "Marcher colors" {
		global.preferences.color_marchers = !(global.preferences.color_marchers);
	} else if button == "Marcher labels" {
		global.preferences.label_marchers = !(global.preferences.label_marchers);
	} else if button == "Metronome" {
		global.preferences.play_music = !(global.preferences.play_music);
	} else if button == "Mouse coordinates" {
		global.debug_preferences.mouse_coordinates = !(global.debug_preferences.mouse_coordinates);
	} else if button == "Mouse position" {
		global.debug_preferences.mouse_position = !(global.debug_preferences.mouse_position);
	} else if button == "uniform" {
		var toggle_order = [
			uniforms.normal,
			uniforms._2025,
			uniforms.summer,
			uniforms.raincoat,
		]
		
		var uniform_names = [
			"normal",
			"2025",
			"summer",
			"raincoats"
		]
		
		var i = (array_get_index(toggle_order, global.preferences.uniform) + 1) mod array_length(toggle_order);
		global.preferences.uniform = i;
		butn_text = "Uniform: " + uniform_names[global.preferences.uniform];
	}
}