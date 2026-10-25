if timer != 0 {
	timer--;
	exit;
}

metronome = (global.preferences.play_music);

if !(setup) {
	if music != undefined {
		if audio_is_playing(music) {
			audio_stop_sound(music);
		}
	}
	setup = true;
	set_piece_variables();
	music = play_sound(sound);
}

var delay = (60/tempo);
var pos;
if audio_is_playing(music) {
	pos = audio_sound_get_track_position(music);
	if pos > 0 {
		song_played = true;
	}
} else {
	pos = 0;
}
beat = pos/delay;

if pos = 0 && song_played && !(audio_is_playing(music)) {
	if (show) {
		if array_length(global.show.songs) - 1 != global.show.current_song {
			global.show.current_song++;
			setup_show();
		}
	} else {
		script_execute(next);
	}
}