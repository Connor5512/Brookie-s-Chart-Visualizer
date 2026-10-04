function scr_setup_show_general() {
	//delete_marchers();
	instance_destroy(obj_conductor);
	show_debug_message("Starting new show movement...")
	
	var current_song = global.show.current_song;
	load_charts("temp/" + global.show.songs[current_song].chart, "temp/" + global.show.songs[current_song].music, "temp/" + global.show.songs[current_song].properties, true);
	//inst.song = everybody_talks1;
}