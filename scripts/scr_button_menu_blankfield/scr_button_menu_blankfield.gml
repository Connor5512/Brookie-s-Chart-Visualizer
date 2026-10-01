if variable_global_exists("button_init") {
	setup_new_charts()
	
	window_set_caption("Blank Field" + global.program_title);
	create_message("Loaded Blank Field.")
}