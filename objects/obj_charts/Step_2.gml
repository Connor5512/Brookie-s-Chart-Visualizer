chart_old = chart;

if chart_export_cleanup {
	if file_exists(chart_export_path) {
		directory_destroy("cache/chart-export");
		
		chart_export_cleanup = false;
		
		debug_message(object_index, id, "Coordinate sheets for \"" + obj_conductor.song + "\" exported.");
	}
}

if !(charts_exported) && !(chart_export_cleanup) {
	export_coordinate_sheet(id);
}