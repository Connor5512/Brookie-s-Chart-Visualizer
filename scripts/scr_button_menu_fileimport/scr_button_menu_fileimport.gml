if variable_global_exists("button_init") {
	setup_new_charts()
	
	var inst = instance_create_layer(0, 0, "ChartManager", obj_chart_manager);
	inst.open_file = true;
	inst.mode = chart_manager_modes.import;
}