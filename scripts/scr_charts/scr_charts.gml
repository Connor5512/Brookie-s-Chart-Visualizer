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
	//create sound
	var new_sound = audio_create_stream(audio_path);
	
	//init song properties
	var buffer = buffer_load(properties_path);
	var json = buffer_read(buffer, buffer_text);
	
	var music_properties = json_parse(json);
	
	global.music[array_length(global.music)] = {
		sound: new_sound,
		tempo: music_properties.tempo,
		time_signature_count: music_properties.time_signature_count,
		time_signature_beat: music_properties.time_signature_beat
	}
		
	song = string_replace_all(string(new_sound), "ref sound ", "");
	
	var inst = instance_create_layer(0, 0, "Band", obj_conductor);
	inst.time_signature_beat = global.music[array_length(global.music)-1].time_signature_beat;
	inst.time_signature_count = global.music[array_length(global.music)-1].time_signature_count;
	
	//Processing the charts
	delete_marchers();
	
	buffer = buffer_load(chart_path);
	json = buffer_read(buffer, buffer_text);
	buffer_delete(buffer);
	
	var data = json_decode(json);
	var ds_keys = ds_map_keys_to_array(data);
	//debug_message(object_index, id, ds_keys);
	
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

			obj.x = ((50 - obj.charts[0].yard_line) * obj.yard_spacing * inside_outside_multiplier) + (obj.charts[0].outside_inside_steps * -inside_outside_multiplier * obj.step_width) + obj.fifty_yard;

			obj.y = obj.front_back_y[obj.charts[0].front_back_marker] + (obj.charts[0].front_back_steps * obj.step_width);
			
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
	}
}