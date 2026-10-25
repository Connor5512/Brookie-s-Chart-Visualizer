if mode == chart_manager_modes.export {
	var name;
	if instance_exists(obj_conductor) {
		var temp_string = get_save_filename("Brookie Visual Files (*.chart)|*.chart", obj_conductor.target_file);
		if temp_string == "" {
			instance_destroy();
			exit;
		}
		name = temp_string// + ".chart";
		//var num = 0;
		//while true {
		//	if file_exists(name) {
		//		num += 1;
		//		if instance_exists(obj_conductor) {
		//			name = obj_conductor.song + " (" + string(num) + ")" + ".chart";
		//		} else {
		//			name = "song" + " (" + string(num) + ")" + ".chart";
		//		}
		//	} else {
		//		break;
		//	}
		//}
	} else {
		name = get_save_filename("Brookie Visual Files (*.chart)|*.chart", "blank.chart");
	}
	
	if name == "" {
		debug_message(object_index, id, "File export canceled.", log_types.warn);
		instance_destroy();
		exit;
	}
	
	var chart_objects = [];
	with (obj_charts) {
	    array_push(chart_objects, id); 
	}

	var _map = ds_map_create();
	for (var i = 0; i < array_length(chart_objects); i++) {
		write_instance_to_ds_map(chart_objects[i], _map);
		var types = [
			"band",
			"colorguard",
			"majorette",
			"front_ensemble"
		]
		debug_message(object_index, id, "Written " + types[chart_objects[i].type] + " marcher (" + chart_objects[i].label + ") " + string(i+1));
	}
	
	ds_map_add(_map, "field_hashes", obj_settings.hash_type);

	var file = file_text_open_write(name);
	file_text_write_string(file, json_encode(_map, true));
	file_text_close(file);
	
	create_message("File \"" + name + "\" saved!");
	debug_message(object_index, id, "File saved to path " + string(name));
} else if mode == chart_manager_modes.import {
	var chart_path, show_path;
	var old_caption = window_get_caption();
	if open_file {
		chart_path = get_open_filename("Brookie Visual Files (*.chart, *.show)|*.chart;*.show", "");
		if chart_path == "" {
			instance_destroy();
			//window_set_caption("Blank Field" + global.program_title);
			create_message("File import canceled.");
			debug_message(object_index, id, "File import canceled.", log_types.warn);
			if instance_exists(obj_conductor) {
					if obj_conductor.music != undefined {
						if audio_is_playing(obj_conductor.music) {
							audio_resume_sound(obj_conductor.music);
						}
					}
				}
			exit;
		}
		window_set_caption(filename_name(chart_path) + "" + global.program_title);
	} else {
		if file_exists(import_target) {
			file_text_open_read(import_target);
			chart_path = import_target;
		} else {
			instance_destroy();
			create_message("File import failed.");
			debug_message(object_index, id, "File import failed; Target file does not exist.", log_types.warn);
			exit;
		}
	}
		
	if string_lower(filename_ext(chart_path)) == ".show" {
		file_mode = file_modes.show;
	} else if string_lower(filename_ext(chart_path)) == ".chart" {
		file_mode = file_modes.chart;
	} else {
		debug_message(object_index, id, "Invalid file extension. File cannot be imported.", log_types.error);
	}
	
	//importing singular charts
	if file_mode == file_modes.chart {
		//importing the song
		var audio_path, properties_path;
		if open_file {
			audio_path = get_open_filename("OGG Files (*.ogg)|*.ogg", "");
			if audio_path == "" {
				instance_destroy();
				window_set_caption(old_caption);
				create_message("File import canceled.");
				debug_message(object_index, id, "File import canceled.", log_types.warn);
				if instance_exists(obj_conductor) {
					if obj_conductor.music != undefined {
						if audio_is_playing(obj_conductor.music) {
							audio_resume_sound(obj_conductor.music);
						}
					}
				}
				exit;
			}
		} else {
			audio_path = song_import;
		}
	
		if open_file {
			properties_path = get_open_filename("JSON Files (*.json)|*.json", "");
			if properties_path == "" {
				instance_destroy();
				window_set_caption(old_caption);
				create_message("File import canceled.");
				debug_message(object_index, id, "File import canceled.", log_types.warn);
				if instance_exists(obj_conductor) {
					if obj_conductor.music != undefined {
						if audio_is_playing(obj_conductor.music) {
							audio_resume_sound(obj_conductor.music);
						}
					}
				}
				exit;
			}
		} else {
			properties_path = song_properties;
		}
		
		load_charts(chart_path, audio_path, properties_path);
	} else if file_mode == file_modes.show {
		//initialize show
		if global.show.path != chart_path {
			directory_destroy("cache/show/");
			debug_message(object_index, id, "Unzipping *.show file...");
			zip_unzip(chart_path, "cache/show/");
	
			var show_properties = load_json("cache/show/properties.json");
		
			global.show = {
				path: chart_path,
				name: show_properties.name,
				songs: show_properties.songs,
				current_song: 0
			}
			
			window_set_caption("\"" + global.show.name + "\"" + global.program_title);
		}
		create_message("Loaded \"" + global.show.name + "\".")
		debug_message(object_index, id, "Show loaded: \"" + global.show.name + "\"");
		setup_show();
	}
}

instance_destroy();