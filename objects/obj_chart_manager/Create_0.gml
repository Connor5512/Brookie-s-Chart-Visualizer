mode = chart_manager_modes.export;
import_target = "";
song = "";
open_file = false;
next = scr_none;

enum chart_manager_modes {
	import,
	export
}

function write_instance_to_ds_map(instance, map) {
	var inst = instance.label;
	ds_map_add(map, inst + "_type", instance.type);
	ds_map_add(map, inst + "_symbol", instance.symbol);
	ds_map_add(map, inst + "_charts", instance.charts);
	ds_map_add(map, inst + "_instrument", instance.instrument);
}