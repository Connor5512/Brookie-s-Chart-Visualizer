debug_message(object_index, id, "Create event fired - " + string(id));

metronome = !(global.preferences.play_music);
metronome_count = beats.eighth;

enum beats {
	quarter,
	eighth,
	sixteenth,
	tripulet
}

sound = snd_nosound;
tempo = 0;
time_signature_count = 0;
time_signature_beat = 0;
song = "";
beat = 0;
beat_old = 0;
music = undefined;
song_played = false;

setup = false;

timer = 240;
real_timer = undefined;

waiting_time = 0;
is_waiting = false;

function set_piece_variables() {
	var temp = get_music(song);
	sound = temp.sound;
	tempo = temp.tempo;
	time_signature_count = temp.time_signature_count;
	time_signature_beat = temp.time_signature_beat;
}

next = scr_none;
target_file = "";

show = false;