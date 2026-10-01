if variable_global_exists("button_init") {
	if button = "Pause in menu" {
		global.preferences.pause_in_menu = !(global.preferences.pause_in_menu);
	} else if button = "Marcher colors" {
		global.preferences.color_marchers = !(global.preferences.color_marchers);
	} else if button = "Marcher labels" {
		global.preferences.label_marchers = !(global.preferences.label_marchers);
	} else if button = "Metronome" {
		global.preferences.play_music = !(global.preferences.play_music);
	} else if button = "Mouse coordinates" {
		global.debug_preferences.mouse_coordinates = !(global.debug_preferences.mouse_coordinates);
	}
}