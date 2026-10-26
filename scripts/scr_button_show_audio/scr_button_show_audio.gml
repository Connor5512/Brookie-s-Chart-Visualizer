if variable_global_exists("button_init") {
	if button = "previous" {
		if obj_conductor.music == undefined {
			if global.show.current_song > 0 {
				global.show.current_song--;
			}
			with obj_conductor {
				setup_show();
			}
			
			exit;
		}
		
		if audio_sound_get_track_position(obj_conductor.music) > 5 {
			with obj_conductor {
				setup_show();
			}
		} else {
			if global.show.current_song > 0 {
				global.show.current_song--;
			}
			with obj_conductor {
				setup_show();
			}
		}
		
		create_message("Rewound song.");
	} else if button = "loop" {
		if global.loop_state == loop_states.disabled {
			global.loop_state = loop_states.all;
		} else if global.loop_state == loop_states.all {
			global.loop_state = loop_states.one;
		} else if global.loop_state == loop_states.one {
			global.loop_state = loop_states.disabled;
		}
	} else if button = "next" {
		global.show.current_song++;
		with obj_conductor {
			setup_show();
		}
		
		create_message("Skipped song.");
		debug_message(object_index, id, "Skipped song.");
	}
}

enum loop_states {
	disabled,
	all,
	one
}