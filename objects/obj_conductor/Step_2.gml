if metronome {
	if music != undefined {
		audio_sound_gain(music, 0);
	}
	var metronome_beat;
	switch metronome_count {
		case beats.quarter	:
			metronome_beat = 1;
			break;
		case beats.eighth	:
			metronome_beat = 0.5;
			break;
		case beats.sixteenth	:
			metronome_beat = 0.25;
			break;
		case beats.tripulet	:
			metronome_beat = 0.33
			break;
	}
	//show_debug_message(metronome_beat)
	if is_multiple(beat, metronome_beat) {
		//show_debug_message(beat/metronome_beat)
		//show_debug_message(beat)
		var pitch = 0.75;
		if is_multiple(beat, 1) {
			pitch = 1;
		}
		if audio_is_playing(sound) && !(audio_is_playing(snd_metronome)) {
			if music != undefined {
				if !(audio_is_paused(music)) {
					play_sound(snd_metronome, 0.25, 0, pitch);
				}
			}
		}
		//show_debug_message("Played metronome beat" + string(beat))
	}
} else {
	if music != undefined {
		audio_sound_gain(music, 1);
	}
}