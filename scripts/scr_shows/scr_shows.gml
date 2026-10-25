function setup_show() {
	//delete_marchers();
	instance_destroy(obj_conductor);
	
	var current_song = global.show.current_song;
	debug_message(object_index, id, "Starting new show movement...");
	
	var chart = "cache/show/" + global.show.songs[current_song].chart
	var audio = "cache/show/" + global.show.songs[current_song].music
	var prop = "cache/show/" + global.show.songs[current_song].properties
	
	if file_exists(chart) && file_exists(audio) && file_exists(prop) {
		load_charts(chart, audio, prop, true);
	} else {
		debug_message(object_index, id, "Could not load show movement; Extracted files do not exist.", log_types.error);
	}
	
	//inst.song = everybody_talks1;
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