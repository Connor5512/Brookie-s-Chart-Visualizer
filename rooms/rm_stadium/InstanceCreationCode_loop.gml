button = "loop";
click_script = scr_button_show_audio;

visibility_condition = true;
function check_visibility() {
	visible = instance_exists(obj_conductor)
}

icon = spr_loop_off;