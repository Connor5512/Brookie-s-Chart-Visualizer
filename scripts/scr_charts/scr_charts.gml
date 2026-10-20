function delete_marchers() {
	var chart_objects = [];
	with (obj_charts) {
		array_push(chart_objects, id);
	}
	
	var temp  = array_length(chart_objects)
	for (var i = 0; i < array_length(chart_objects); i++) {
		instance_destroy(chart_objects[i]);
	}
	debug_message(object_index, id, "Destroyed " + string(temp) + " marchers");
}

function load_charts(chart_path, audio_path, properties_path, show = false) {
	setup_new_charts();
	
	//create sound
	var new_sound = audio_create_stream(audio_path);
	global.audio_name = filename_name(new_sound);
	
	//init song properties
	var music_properties = load_json(properties_path);
	
	global.music[array_length(global.music)] = {
		name: music_properties.name,
		sound: new_sound,
		tempo: music_properties.tempo,
		time_signature_count: music_properties.time_signature_count,
		time_signature_beat: music_properties.time_signature_beat
	}
	
	global.song_name = music_properties.name;
		
	song = string_replace_all(string(new_sound), "ref sound ", "");
	
	var inst = instance_create_layer(0, 0, "Band", obj_conductor);
	inst.time_signature_beat = global.music[array_length(global.music)-1].time_signature_beat;
	inst.time_signature_count = global.music[array_length(global.music)-1].time_signature_count;
	
	//Processing the charts
	delete_marchers();
	
	var buffer = buffer_load(chart_path);
	var json = buffer_read(buffer, buffer_text);
	buffer_delete(buffer);
	
	var data = json_decode(json);
	var ds_keys = ds_map_keys_to_array(data);
	//debug_message(object_index, id, ds_keys);
	
	if array_contains(ds_keys, "field_hashes") {
		obj_settings.hash_type = ds_map_find_value(data, "field_hashes");
	} else {
		debug_message(object_index, id, "Charts have no \"field_hashes\" attribute; assuming default hashes (HS)...");
	}
	
	enum field_hashes {
		HS,
		NCAA
	}
	
	for (var i = 0; i < array_length(ds_keys); i++) {
		var key = ds_keys[i];
		
		if string_ends_with(key, "_charts") {
			var chart_objects = [];
			with (obj_charts) {
			    array_push(chart_objects, id); 
			}
			
			var obj = noone;
			for (var _i = 0; _i < array_length(chart_objects); _i++) {
				if chart_objects[_i].label == string_replace_all(key, "_charts", "") {
					obj = chart_objects[_i];
				}
			}
			if obj == noone {
				obj = instance_create_layer(0, 0, "Band", obj_charts);
				obj.label = string_replace_all(key, "_charts", "")
			}
			
			var json_charts = ds_map_find_value(data, key);
			var reconstructed_charts = [];

			for (var c = 0; c < ds_list_size(json_charts); c++) {
				var chart = ds_list_find_value(json_charts, c);

				reconstructed_charts[c] = {
					counts: ds_map_find_value(chart, "counts"),
					side: ds_map_find_value(chart, "side"),
					front_back_marker: ds_map_find_value(chart, "front_back_marker"),
					front_back_steps: ds_map_find_value(chart, "front_back_steps"),
					yard_line: ds_map_find_value(chart, "yard_line"),
					outside_inside_steps: ds_map_find_value(chart, "outside_inside_steps")
				};
			}

			obj.charts = reconstructed_charts;

			//innitialize positions
			var inside_outside_multiplier;
			if obj.charts[0].side == 1 {
				inside_outside_multiplier = -1;
			} else if obj.charts[0].side == 2 || obj.charts[0].side == 0 {
				inside_outside_multiplier = 1;
			}

			obj.x = calculate_chart_coordinates(obj, 0).x;
			obj.y = calculate_chart_coordinates(obj, 0).y;
			
			debug_message(object_index, id, "Imported charts for " + obj.label);
		}
	}
	
	//go back through objects and add their attributes
	var chart_objects = [];
	with (obj_charts) {
		array_push(chart_objects, id);
	}
	
	for (var i = 0; i < array_length(chart_objects); i++) {
		var obj = chart_objects[i];
		var label = obj.label;
		
		var symbol_key = label + "_symbol";
		var type_key = label + "_type";
		var instrument_key = label + "_instrument";
		
		if ds_map_exists(data, symbol_key) {
			obj.symbol = ds_map_find_value(data, symbol_key);
		} else {
			debug_message(object_index, id, label + " has no attached \"_symbol\" attribute. Using default...", log_types.warn);
			obj.symbol = "^";
		}
		
		if ds_map_exists(data, type_key) {
			obj.type = ds_map_find_value(data, type_key);
		} else {
			debug_message(object_index, id, label + " has no attached \"_type\" attribute. Using default...", log_types.warn);
			obj.type = marchers.colorguard;
		}
		
		if ds_map_exists(data, instrument_key) {
			obj.instrument = ds_map_find_value(data, instrument_key);
		} else {
			debug_message(object_index, id, label + " has no attached \"_instrument\" attribute. Using default...", log_types.warn);
			obj.instrument = instruments.pole;
		}
		
		if obj.type == marchers.band {
			obj.sprite_index = spr_marcher_band;
			obj.layer = layer_get_id("Band");
		} else if obj.type == marchers.colorguard {
			obj.sprite_index = spr_marcher_colorguard;
			obj.layer = layer_get_id("Colorguard");
		} else if obj.type == marchers.majorette {
			obj.sprite_index = spr_marcher_majorette;
			obj.layer = layer_get_id("Majorette");
		} else if obj.type == marchers.front_ensemble {
			obj.sprite_index = spr_marcher_front_ensemble;
			obj.layer = layer_get_id("Band");
		}

		if obj.colors {
			if obj.sprite_index == spr_marcher_band {
				if obj.instrument == instruments.alto_sax {
					obj.image_index = 1; //alto saxophone
				} else if obj.instrument == instruments.baritone_horn {
					obj.image_index = 2; //baritone
				} else if obj.instrument == instruments.clarinet {
					obj.image_index = 3; //clarinet
				} else if obj.instrument == instruments.trombone {
					obj.image_index = 8; //trombone
				} else if obj.instrument == instruments.flute {
					obj.image_index = 5; //flute
				} else if obj.instrument == instruments.mellophone {
					obj.image_index = 6; //mellophone
				} else if obj.instrument == instruments.battery_percussion {
					obj.image_index = 7; //percussion
				} else if obj.instrument == instruments.tenor_sax {
					obj.image_index = 1; //tenor sax
				} else if obj.instrument == instruments.tuba {
					obj.image_index = 4; //tuba
				} else if obj.instrument == instruments.trumpet {
					obj.image_index = 9; //trumpet
				} else {
					obj.image_index = 0;
				}
			}
		} else {
			obj.image_index = 0;
		}
		
		debug_message(object_index, id, "Attributes for " + obj.label + " finalized");
	}
	
	obj_conductor.song = song
	obj_conductor.next = next
	obj_conductor.target_file = filename_name(chart_path);
	
	if show {
		obj_conductor.show = true;
		obj_charts.show = true;
	}
}

function export_coordinate_sheet(_id) {
	var _directory = "cache/chart-export";
	var filename = _directory + "/" + _id.label + "-charts.png";
	
	if !(file_exists(filename)) {
		var surface = surface_create(816, 1056);
	
		surface_set_target(surface);
	
		var w = 816;
		var h = 1056;
	
		draw_set_color(c_white);
		draw_rectangle(0, 0, w, h, false);
	
		draw_set_font(fnt_chart_details);
		draw_set_color(c_black);
		draw_set_halign(fa_left);
		draw_text(27.839999999999996, 30.72, "Performer:     Symbol: " + _id.symbol + "    Label: " + _id.label + "    ID:");
		
		if (_id.show) {
			_id.song_name = global.song_name;
		} else {
			_id.song_name = string(obj_conductor.song);
		}
		
		draw_set_halign(fa_right);
		draw_text(789.1200000000001, 30.72, _id.song_name);
		
		draw_line_width(24.96, 50.88, 792, 50.88, 1);
		
		draw_set_halign(fa_left);
		draw_set_font(fnt_chart_headers);
		draw_set_color(#333333);
		draw_text(29.759999999999998, 72.96, "Sets")
		draw_text(78.72, 72.96, "CountsSide 1-Side 2");
		draw_text(421.43999999999994, 72.96, "Front Hash-Back Hash");
		
		var set_num_x = 29.759999999999998;
		var set_num_y = 94.08;
		
		var counts_x = 101.76;
		
		var side_1_2_x = 134.39999999999998;
		
		var front_back_x = 421.43999999999994;
		
		var line_spacing = 22.08;
		
		draw_set_font(fnt_charts);
		for (var i = 0; i < array_length(_id.charts); i++) {
			var colcol = [
				c_white,
				#e8e8e8
			]
			
			var front_back_text = get_front_back_text(_id, i);
			var side1_2_text = get_side_1_2_text(_id, i);
			
			var box_y_start = 89.28;
			var box_x = 29.759999999999998;
			
			var box_w = (front_back_x + string_width(front_back_text)) - box_x//756.48;
			var box_h = line_spacing//21.12;
			
			
			var col = colcol[is_multiple(i+1, 2)];
			
			draw_set_color(col);
			draw_rectangle(box_x, box_y_start + (i * box_h), box_x + box_w, box_y_start + ((i+1) * box_h), false);
			
			draw_set_color(#333333);
			draw_set_halign(fa_left);
			draw_text(set_num_x, set_num_y + (i * line_spacing), string(i));
			
			draw_text(side_1_2_x, set_num_y + (i * line_spacing), side1_2_text);
			
			draw_text(front_back_x, set_num_y + (i * line_spacing), front_back_text);
		
			draw_set_halign(fa_center);
			draw_text(counts_x, set_num_y + (i * line_spacing), string(_id.charts[i].counts));
		}
		
		draw_set_color(c_white);
	
		surface_reset_target();
		var sprite = sprite_create_from_surface(surface, 0, 0, w, h, false, true, 0, 0);
	
		sprite_save(sprite, 0, filename);
	}
	
	_id.charts_exported = true;
	
	var chart_objects = [];
	with (obj_charts) {
		array_push(chart_objects, id);
	}
	
	//debug_message(object_index, id, get_file_count(_directory));
	//debug_message(object_index, id, array_length(chart_objects));
	
	if get_file_count(_directory) == array_length(chart_objects) {
		var _zip = zip_create();
		
		var _path = get_save_filename("ZIP archives|*.zip", "chart-export.zip");
		
		if _path == "" {
			create_message("File export canceled.");
			debug_message(object_index, id, "File export canceled by user.");
			directory_destroy("cache/chart-export");
			exit;
		}
			
		var files = get_directory_files(_directory);
		//debug_message(object_index, id, files);
			
		for (var i = 0; i < array_length(files); i++) {
			var file_name = files[i];
			var file_path = _directory + "/" + file_name;
			
			//debug_message(object_index, id, file_path + " exists: " + string(file_exists(file_path)));
			
			zip_add_file(_zip, file_name, file_path);
		}
		
		zip_save(_zip, _path);
		
		_id.chart_export_cleanup = true;
		_id.chart_export_path = _path;
		//directory_destroy(_directory);
	}
}

function get_front_back_text(_id, chart) {
	var front_back_steps = _id.charts[chart].front_back_steps;
	var closest_front_back = _id.charts[chart].front_back_marker;
			
	var behind_or_front = "in front of ";
	if front_back_steps < 0 {
		behind_or_front = "behind ";
	} else if front_back_steps > 0 {
		behind_or_front = "in front of ";
	} else {
		behind_or_front = "On ";
	}
			
			
	var front_back_names = [
		"Front Hash (HS)",
		"Back Hash (HS)",
		"Front side line",
		"Back side line",
		"Front Hash (NCAA)",
		"Back Hash (NCAA)"
	]
			
	var front_back_text = "";
	if front_back_steps != 0 {
		front_back_text = string(abs(front_back_steps)) + " steps " + behind_or_front + front_back_names[closest_front_back];
	} else {
		front_back_text = behind_or_front + front_back_names[closest_front_back];
	}
	
	return front_back_text;
}

function get_side_1_2_text(_id, chart) {
	var outside_inside_steps = _id.charts[chart].outside_inside_steps;
	var side = _id.charts[chart].side;
	var yard_line = _id.charts[chart].yard_line;
			
	var side1_2_text = "";
	var outside_or_inside = "inside ";
	if outside_inside_steps < 0 {
		outside_or_inside = "outside ";
	} else if outside_inside_steps > 0 {
		outside_or_inside = "inside ";
	} else {
		outside_or_inside = "On ";
	}
			
	if outside_inside_steps != 0 {
		side1_2_text = "Side " + string(side) + ": " + string(abs(outside_inside_steps)) + " steps " + outside_or_inside + string(yard_line) + "yd ln"
	} else {
		if side != 0 {
			side1_2_text = "Side " + string(side) + ": " + outside_or_inside + string(yard_line) + "yd ln";
		} else {
			side1_2_text = outside_or_inside + string(yard_line) + "yd ln";
		}
	}
	
	return side1_2_text;
}

function calculate_chart_coordinates(_id, chart) {
	var front_back_prop = [
		{ _y: 924, name: "Front Hash (HS)" },
		{ _y: 557, name: "Back Hash (HS)" },
		{ _y: 1293, name: "Front side line" },
		{ _y: 188, name: "Back side line" },
		{ _y: 872, name: "Front Hash (NCAA)" },
		{ _y: 608, name: "Back Hash (NCAA)" }
	];
	
	var chart_set = _id.charts;
	
	var step_width = 13;

	var fifty_yard = 1146; //x
	var yard_spacing = 21.1; //x
	
	var inside_outside_multiplier;
	if chart_set[chart].side == 1 {
		inside_outside_multiplier = -1;
	} else if chart_set[chart].side == 2 || chart_set[chart].side == 0 {
		inside_outside_multiplier = 1;
	}
	
	var _x = ((50 - chart_set[chart].yard_line) * yard_spacing * inside_outside_multiplier) + (chart_set[chart].outside_inside_steps * -inside_outside_multiplier * step_width) + fifty_yard;
	var _y = front_back_prop[chart_set[chart].front_back_marker]._y + (chart_set[chart].front_back_steps * step_width);
	
	return {
		x: _x,
		y: _y
	};
}

function setup_new_charts() {
	set_menu_visibility(false);
	
	delete_marchers();
	instance_destroy(obj_conductor);
	
	audio_stop_all();
}

function reset_show_info() {
	global.show = {
		path: "",
		name: "",
		songs: [
			{
				name: "",
				chart: "",
				music: "",
				properties: "",
			}
		],
		current_song: 0
	}
}