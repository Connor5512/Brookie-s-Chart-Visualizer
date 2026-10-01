if timer != 0 {
	timer--;
	exit;
}

metronome = (global.preferences.play_music);

if !(setup) {
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

if pos = 0 && song_played {
	script_execute(next);
}