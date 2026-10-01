if variable_global_exists("button_init") {
	setup_new_charts()
	
	var inst = instance_create_layer(0, 0, "ChartManager", obj_chart_manager);
	inst.mode = chart_manager_modes.import;
	inst.open_file = false;
	inst.import_target = working_directory + "four_elements/part_one_earth.brcv";
	inst.song_import = working_directory + "four_elements/part_one_earth_const.ogg";
	inst.song_properties = working_directory + "four_elements/part_one_earth.json";
	//song = everybody_talks1;

	inst.next = scr_setup_fourelements_p2;

	window_set_caption("\"Four Elements\"" + global.program_title);
	create_message("Loaded \"Four Elements\".")
}