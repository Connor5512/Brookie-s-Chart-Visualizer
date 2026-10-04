if instance_exists(obj_conductor) {
	//delete_marchers();
	instance_destroy(obj_conductor);
	
	var inst = instance_create_layer(0, 0, "ChartManager", obj_chart_manager);
	inst.mode = chart_manager_modes.import;
	inst.open_file = false;
	inst.import_target = working_directory + "rock_show/firework.chart"
	inst.song_import = working_directory + "rock_show/firework.ogg";
	inst.song_properties = working_directory + "rock_show/firework.json";
	//inst.song = firework1;
	inst.next = scr_setup_everybody_talks;
}