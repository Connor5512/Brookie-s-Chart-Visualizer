var debug_string = "";

if global.debug {
	if global.debug_preferences.mouse_position {
		//Calculate field position of mouse cursor
		var step_width = 13;

		var fifty_yard = 1146; //x
		var yard_spacing = 21.1; //x
		var front_back_marker = front_back.front_hash;

		var yard_line = -1;
		var outside_inside_steps = 0;

		var side = 0;
		if mouse_x < fifty_yard {
			side = 1;
		} else if mouse_x > fifty_yard {
			side = 2;
		}

		var inside_outside_multiplier;
		if side == 1 {
			inside_outside_multiplier = -1;
		} else if side == 2 || side == 0 {
			inside_outside_multiplier = 1;
		}

		var side_1_x = [], side_2_x = [];
		for (var i = 0; i < 10; i++) {
			side_1_x[i] = {
				yardline: i*5,
				_x: ((50 - i*5) * yard_spacing * 1) + fifty_yard
			};
			side_2_x[i] = {
				yardline: i*5,
				_x: ((50 - i*5) * yard_spacing * -1) + fifty_yard
			};
		}

		var temp_array = side_1_x;
		if side == 1 {
			temp_array = side_1_x;
		} else if side == 2 {
			temp_array = side_2_x;
		}

		var closest_yardline;
		var closest_yardline_distance = 999999;
		for (var i = 0; i < array_length(temp_array); i++) {
			if abs(temp_array[i]._x - mouse_x) < closest_yardline_distance {
				closest_yardline_distance = abs(temp_array[i]._x - mouse_x);
				closest_yardline = temp_array[i].yardline;
			}
		}

		front_back_prop = [
			{ _y: 924, name: "Front Hash (HS)" },
			{ _y: 557, name: "Back Hash (HS)" },
			{ _y: 1293, name: "Front side line" },
			{ _y: 188, name: "Back side line" },
			{ _y: 872, name: "Front Hash (NCAA)" },
			{ _y: 608, name: "Back Hash (NCAA)" }
		];
		
		var closest_front_back;
		var closest_front_back_distance = 999999;
		for (var i = 0; i < array_length(front_back_prop); i++) {
			var hs_check = (hash_type == field_hashes.HS) && (i > 3);
			var ncaa_check = (hash_type == field_hashes.NCAA) && (i < 2);
			if !(hs_check) && !(ncaa_check) {
				if abs(front_back_prop[i]._y - mouse_y) < closest_front_back_distance {
					closest_front_back_distance = abs(front_back_prop[i]._y - mouse_y);
					closest_front_back = i;
				}
			}
		}
		
		if closest_front_back == undefined {
			exit;
		}

		//x_start = ((50 - charts[chart].yard_line) * yard_spacing * inside_outside_multiplier) + (charts[chart].outside_inside_steps * -inside_outside_multiplier * step_width) + fifty_yard;
		//y_start = front_back_y[front_back_marker] + (front_back_steps * step_width);

		//mouse_x = ((50 - yard_line) * yard_spacing * inside_outside_multiplier) + outside_inside_steps * -inside_outside_multiplier * step_width) + fifty_yard;

		yard_line = round_to_multiple(50 - (mouse_x - fifty_yard + (outside_inside_steps * inside_outside_multiplier * step_width)) / (yard_spacing * inside_outside_multiplier), 5);
		
		outside_inside_steps = round_to_multiple((fifty_yard + (inside_outside_multiplier * yard_spacing * (50 - yard_line)) - mouse_x) / (inside_outside_multiplier * step_width), 0.05);
		
		var outside_or_inside = "inside ";
		if outside_inside_steps < 0 {
			outside_or_inside = "outside ";
		} else if outside_inside_steps > 0 {
			outside_or_inside = "inside ";
		} else {
			outside_or_inside = "On ";
		}
		
		var side1_2_text = "";
		if outside_inside_steps != 0 {
			side1_2_text = "Side " + string(side) + ": " + string(abs(outside_inside_steps)) + " steps " + outside_or_inside + string(yard_line) + "yd ln"
		} else {
			if side != 0 {
				side1_2_text = "Side " + string(side) + ": " + outside_or_inside + string(yard_line) + "yd ln";
			} else {
				side1_2_text = outside_or_inside + string(yard_line) + "yd ln";
			}
		}
		
		var front_back_steps = round_to_multiple((mouse_y - front_back_prop[closest_front_back]._y) / step_width, 0.05);
		
		var behind_or_front = "in front of ";
		if front_back_steps < 0 {
			behind_or_front = "behind ";
		} else if front_back_steps > 0 {
			behind_or_front = "in front of ";
		} else {
			behind_or_front = "On ";
		}
		
		var front_back_text = "";
		if front_back_steps != 0 {
			front_back_text = string(abs(front_back_steps)) + " steps " + behind_or_front + front_back_prop[closest_front_back].name;
		} else {
			front_back_text = behind_or_front + front_back_prop[closest_front_back].name;
		}
		
		debug_string = string_append(debug_string, 
		
		"Cursor field position:\n" +
		side1_2_text + "\n" +
		front_back_text + "\n\n");
	}
	if global.debug_preferences.mouse_coordinates {
		debug_string = string_append(debug_string, "MX = " + string(mouse_x) + "\nMY = " + string(mouse_y) +"\n\n");
	}
}

draw_set_font(fnt_default);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_text(12, 12, debug_string);

draw_set_color(c_white);