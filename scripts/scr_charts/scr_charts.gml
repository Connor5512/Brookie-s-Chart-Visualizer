function delete_marchers() {
	var chart_objects = [];
	with (obj_charts) {
		array_push(chart_objects, id);
	}
	
	var temp  = array_length(chart_objects)
	for (var i = 0; i < array_length(chart_objects); i++) {
		instance_destroy(chart_objects[i]);
	}
	show_debug_message("Destroyed " + string(temp) + " marchers");
}