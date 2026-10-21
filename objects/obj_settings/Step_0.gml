if room == rm_stadium {
	if !(setup) {
		setup = true;
		
		set_menu_visibility(true);
		//debug_message(object_index, id, layer_get_visible("UI"));
		set_settings_visibility(false);
		//debug_message(object_index, id, layer_get_visible("SettingsUI"));
	}
	
	if !(opening) && !(saving) && !(resetting) && !(exporting) {
		if keyboard_check(vk_control) && keyboard_check(ord("O")) {
			opening = true;
		}
	
		if keyboard_check(vk_control) && keyboard_check(ord("S")) {
			saving = true;
		}
	
		if keyboard_check(vk_control) && keyboard_check(ord("N")) {
			resetting = true;
		}
	
		if keyboard_check(vk_control) && keyboard_check(ord("E")) {
			exporting = true;
		}
	} else if saving {
		var inst = instance_create_layer(0, 0, "ChartManager", obj_chart_manager);
		inst.mode = chart_manager_modes.export;
	
		saving = false;
	} else if opening {
		//delete_marchers();
		if instance_exists(obj_conductor) {
			if obj_conductor.music != undefined {
				if audio_is_playing(obj_conductor.music) {
					audio_pause_sound(obj_conductor.music);
				}
			}
		}
	
		//reset_show_info();
		var inst = instance_create_layer(0, 0, "ChartManager", obj_chart_manager);
		inst.mode = chart_manager_modes.import;
		inst.open_file = true;
	
		opening = false;
	} else if exporting {
		obj_charts.charts_exported = false;
		exporting = false;
	} else if resetting {
		script_execute(scr_button_menu_blankfield);
	
		resetting = false;
	}

	if keyboard_check_pressed(vk_escape) {
		if !(layer_get_visible("SettingsMenu1")) {
			set_menu_visibility(!(layer_get_visible("UI")));
		} else {
			set_settings_visibility(!(layer_get_visible("SettingsUI")));
		}
	}

	if instance_exists(obj_conductor) {
		if obj_conductor.music != undefined {
			if audio_is_playing(obj_conductor.music) {
				if layer_get_visible("MenuBackground") || layer_get_visible("SettingsMenu1") {
					if (global.preferences.pause_in_menu) {
						audio_pause_sound(obj_conductor.music);
					} else {
						audio_resume_sound(obj_conductor.music);
					}
				} else {
					audio_resume_sound(obj_conductor.music);
				}
			}
		}
	}

	var field_sprites = [
		spr_chart_hs,
		spr_chart_ncaa
	]

	var bg = layer_background_get_id("Background");
	layer_background_sprite(bg, field_sprites[hash_type]);
} else if room == rm_soundtest {
	window_set_caption("Sound Check" + global.program_title);
}

if global.debug {
	global.program_title = " - Brookie's Chart Visualizer (DEBUG)";
} else {
	global.program_title = " - Brookie's Chart Visualizer";
}

ini_open("preferences.ini");
ini_write_real("PREFERENCES", "pause_in_menu", global.preferences.pause_in_menu);
ini_write_real("PREFERENCES", "color_marchers", global.preferences.color_marchers);
ini_write_real("PREFERENCES", "label_marchers", global.preferences.label_marchers);
ini_write_real("PREFERENCES", "play_music", global.preferences.play_music);

ini_write_real("DEBUG", "mouse_coordinates", global.debug_preferences.mouse_coordinates);
ini_write_real("DEBUG", "mouse_position", global.debug_preferences.mouse_position);
ini_close();