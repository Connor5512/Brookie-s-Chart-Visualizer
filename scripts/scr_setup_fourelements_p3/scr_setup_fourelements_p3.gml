if instance_exists(obj_conductor) {
	//delete_marchers();
	instance_destroy(obj_conductor);
	
	var inst = instance_create_layer(0, 0, "ChartManager", obj_chart_manager);
	inst.mode = chart_manager_modes.import;
	inst.open_file = false;
	inst.import_target = working_directory + "four_elements/part_three_air.brcv";
	inst.song_import = working_directory + "four_elements/part_three_air_const.ogg";
	inst.song_properties = working_directory + "four_elements/part_three_air.json";
	//inst.song = everybody_talks1;
	inst.next = scr_setup_fourelements_p4;
}