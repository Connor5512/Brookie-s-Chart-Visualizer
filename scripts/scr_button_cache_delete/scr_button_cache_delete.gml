if variable_global_exists("button_init") {
	directory_destroy("cache");
	directory_destroy("logs");
	
	create_message("Cache deleted.")
	debug_message(object_index, id, "Deleted cache from %localappdata%/Brookie_s_Chart_Visualizer")
}