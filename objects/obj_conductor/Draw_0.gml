if room == rm_stadium {
	draw_set_color(c_black);
	draw_set_font(fnt_default);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	//debug_message(object_index, id, "time sig count " + string(time_signature_count));
	draw_text(105, 1430,
		"Measure " +
		string(ceil(beat/(time_signature_count))) +
		"\nBeat " +
		string((floor(beat mod (time_signature_count))) + 1)
	);
	draw_set_color(c_white);
} else if room == rm_soundtest {
	song = snd_nosound;
	
	draw_set_font(fnt_large);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	
	if !(setup_audio) {
		setup_audio = true;
		
		audio_path = get_open_filename("OGG Files (*.ogg)|*.ogg", "");
		if audio_path == "" {
			instance_destroy();
			window_set_caption(old_caption);
			create_message("File import canceled.");
			debug_message(object_index, id, "File import canceled.", log_types.warn);
			exit;
		}
	
		//create the sound
		new_sound = audio_create_stream(audio_path);
		global.audio_name = filename_name(new_sound);
		
		song = new_sound//string_replace_all(string(new_sound), "ref sound ", "");
		
		sound = new_sound;
		audio_stop_all();
		
		if music != undefined {
			if audio_is_playing(music) {
				audio_stop_sound(music);
			}
		}
		music = play_sound(sound);
	}
	
	if !(setup_properties) {
		setup_properties = true;
		
		properties_path = get_open_filename("JSON Files (*.json)|*.json", "");
		if properties_path == "" {
			instance_destroy();
			window_set_caption(old_caption);
			create_message("File import canceled.");
			debug_message(object_index, id, "File import canceled.", log_types.warn);
			exit;
		}
		
		//init song properties
		var music_properties = load_json(properties_path);
	
		array_push(global.music,
			{	
				sound: new_sound,
				tempo: music_properties.tempo,
				time_signature_count: music_properties.time_signature_count,
				time_signature_beat: music_properties.time_signature_beat
			}
		);
		
		sound = new_sound;
		audio_stop_all();
		
		if music != undefined {
			if audio_is_playing(music) {
				audio_stop_sound(music);
			}
		}
		
		var i = array_length(global.music) - 1;
	
		var temp = get_music(song);
		tempo = global.music[i].tempo;
		time_signature_count = global.music[i].time_signature_count;
		time_signature_beat = global.music[i].time_signature_beat;
		music = play_sound(sound);
	}

	var str = "";
	
	var i = array_length(global.music) - 1;
	
	str =
	"Tempo: " + string(tempo) + " BPM,\n" +
	"Time signature: " + string(time_signature_count) + "/" + string(time_signature_beat) + ",\n" +
	"Measure: " + string(ceil(beat/(time_signature_count))) + "\n" + 
	"Beat: " + string((floor(beat mod (time_signature_count))) + 1);

	draw_text(room_width/2, 906, str);

	draw_set_halign(fa_left);
}