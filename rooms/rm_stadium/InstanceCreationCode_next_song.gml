clickable_function = true;
function check_clickable() {
	clickable = (array_length(global.show.songs) - 1 != global.show.current_song);
}

button = "next";
click_script = scr_button_show_audio;

visibility_condition = true;
function check_visibility() {
	visible = instance_exists(obj_conductor)
}

icon = spr_skip;