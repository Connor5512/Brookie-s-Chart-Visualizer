if variable_global_exists("button_init") {
	if button = "Audio" {
		obj_conductor.setup_audio = false;
	} else if button = "Properties" {
		obj_conductor.setup_properties = false;
	} else if button = "ToField" {
		room_goto(rm_stadium);
		audio_stop_all();
	} else if button = "ToSoundcheck" {
		room_goto(rm_soundtest)
		audio_stop_all();
	}
}