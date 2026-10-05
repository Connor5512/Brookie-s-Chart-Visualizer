chart_old = chart;

if chart_export_cleanup {
	if file_exists(chart_export_path) {
		directory_destroy("cache/chart-export");
	}
	
	chart_export_cleanup = false;
}

if !(charts_exported) && !(chart_export_cleanup) {
	export_coordinate_sheet(id);
}