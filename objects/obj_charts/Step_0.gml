if type == marchers.band {
	sprite_index = spr_marcher_band;
	layer = layer_get_id("Band");
} else if type == marchers.colorguard {
	sprite_index = spr_marcher_colorguard;
	layer = layer_get_id("Colorguard");
} else if type == marchers.majorette {
	sprite_index = spr_marcher_majorette;
	layer = layer_get_id("Majorette");
} else if type == marchers.front_ensemble {
	sprite_index = spr_marcher_front_ensemble;
	layer = layer_get_id("Band");
}

colors = global.preferences.color_marchers;
labels = global.preferences.label_marchers;

if colors {
	if sprite_index == spr_marcher_band {
		if instrument == instruments.alto_sax {
			image_index = 1; //alto saxophone
		} else if instrument == instruments.baritone_horn {
			image_index = 2; //baritone
		} else if instrument == instruments.clarinet {
			image_index = 3; //clarinet
		} else if instrument == instruments.trombone {
			image_index = 8; //trombone
		} else if instrument == instruments.flute {
			image_index = 5; //flute
		} else if instrument == instruments.mellophone {
			image_index = 6; //mellophone
		} else if instrument == instruments.battery_percussion {
			image_index = 7; //percussion
		} else if instrument == instruments.tenor_sax {
			image_index = 1; //tenor sax
		} else if instrument == instruments.tuba {
			image_index = 4; //tuba
		} else if instrument == instruments.trumpet {
			image_index = 9; //trumpet
		} else {
			image_index = 0;
		}
	}
} else {
	image_index = 0;
}

//var temp1 = 0, temp2 = 0;
var chart_percent = 0;
if instance_exists(obj_conductor) {
	chart_percent = (obj_conductor.beat - add_array_struct_variable(charts, chart, "counts")) / charts[chart + 1].counts;
	if obj_conductor.music != undefined {
		if audio_is_playing(obj_conductor.music) {
			//temp1 = add_array_struct_variable(charts, chart+1, "counts") - obj_conductor.beat;
			//temp2 = add_array_struct_variable(charts, chart, "counts");
			var temp3 = obj_conductor.beat;
			for (var i = 0; i < array_length(charts); i++) {
				temp3 -= charts[i].counts;
				if temp3 <= 0 {
					if i=0 i = 1;
					chart = i-1;
					if chart_old != chart { chart_percent = 0; }
					break;
				}
			}
		}
	}
}

//debug_message(object_index, id, "1: " + string(temp1));
//debug_message(object_index, id, "2: " + string(temp2));
//debug_message(object_index, id, "3: " + string(temp1 - temp2));

var inside_outside_multiplier;
if charts[chart].side == 1 {
	inside_outside_multiplier = -1;
} else if charts[chart].side == 2 || charts[chart].side == 0 {
	inside_outside_multiplier = 1;
}

x_start = ((50 - charts[chart].yard_line) * yard_spacing * inside_outside_multiplier) + (charts[chart].outside_inside_steps * -inside_outside_multiplier * step_width) + fifty_yard;
y_start = front_back_prop[charts[chart].front_back_marker]._y + (charts[chart].front_back_steps * step_width);

//debug_message(object_index, id, array_length(charts))
//debug_message(object_index, id, array_length(chart+1))
//if array_length(charts) > chart+1 {
	if charts[chart+1].side == 1 {
		inside_outside_multiplier = -1;
	} else if charts[chart+1].side == 2 || charts[chart+1].side == 0 {
		inside_outside_multiplier = 1;
	}
	
	x_end = ((50 - charts[chart+1].yard_line) * yard_spacing * inside_outside_multiplier) + (charts[chart+1].outside_inside_steps * -inside_outside_multiplier * step_width) + fifty_yard;
	y_end = front_back_prop[charts[chart+1].front_back_marker]._y + (charts[chart+1].front_back_steps * step_width);
//} else {
//	x_end = x_start;
//	y_end = y_start;
//}

//debug_message(object_index, id, "Chart: " + string(chart));
//debug_message(object_index, id, "x_start: " + string(x_start));
//debug_message(object_index, id, "x_end: " + string(x_end));
//debug_message(object_index, id, "counts: " + string(obj_conductor.beat - add_array_struct_variable(charts, chart, "counts")));
//debug_message(object_index, id, "chart_percent: " + string(chart_percent));
//debug_message(object_index, id, "counts: " + string(add_array_struct_variable(charts, chart+1, "counts")));

x = lerp(x_start, x_end, chart_percent);
y = lerp(y_start, y_end, chart_percent);