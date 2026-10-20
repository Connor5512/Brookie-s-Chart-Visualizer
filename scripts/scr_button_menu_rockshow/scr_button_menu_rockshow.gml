if variable_global_exists("button_init") {
	setup_new_charts()
	
	var inst = instance_create_layer(0, 0, "ChartManager", obj_chart_manager);
	inst.mode = chart_manager_modes.import;
	inst.open_file = false;
	inst.import_target = working_directory + "sample/rock_show_2026.show";
	//inst.song_import = working_directory + "rock_show/animal.ogg";
	//inst.song_properties = working_directory + "rock_show/animal.json";
	//song = everybody_talks1;

	//inst.next = scr_setup_firework;

	window_set_caption("\"Rock Show\"" + global.program_title);
	//create_message("Loaded \"Rock Show\".")
}