if variable_global_exists("button_init") {
	setup_new_charts()
	
	var inst = instance_create_layer(0, 0, "ChartManager", obj_chart_manager);
	inst.mode = chart_manager_modes.import;
	inst.open_file = false;
	inst.import_target = working_directory + "rock_show/animal.brcv";
	inst.song_import = working_directory + "rock_show/animal.ogg";
	inst.song_properties = working_directory + "rock_show/animal.json";
	//song = everybody_talks1;

	inst.next = scr_setup_firework;

	window_set_caption("\"Rock Show\"" + global.program_title);
	create_message("Loaded \"Rock Show\".")
}

function set_menu_visibility(_visible) {
	layer_set_visible("ButtonDetailing", _visible);
	layer_set_visible("UI", _visible);
	layer_set_visible("UI_top", _visible);
	layer_set_visible("ButtonTop_detaiol", _visible);
	layer_set_visible("MenuBackground", _visible);
}

function setup_new_charts() {
	set_menu_visibility(false);
	
	delete_marchers();
	instance_destroy(obj_conductor);
	audio_stop_all();
}