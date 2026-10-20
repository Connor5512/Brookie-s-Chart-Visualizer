init_music();

global.start_time = string(current_year) + "-" + string(current_month) + "-" + string(current_day) + " " + string(current_hour) + "-" + string(current_minute) + "-" + string(current_second)
global.log_file = "logs/" + string_replace(string(global.start_time), ".", "") + ".log"

global.is_mobile = (os_type == os_android || os_type == os_ios);

room_goto(rm_stadium);

game_set_speed(60, gamespeed_fps);

opening = false;
saving = false;
resetting = false;
exporting = false;

setup = false;

ini_open("preferences.ini");
global.preferences = 
{
	pause_in_menu: ini_read_real("PREFERENCES", "pause_in_menu", false),
	color_marchers: ini_read_real("PREFERENCES", "color_marchers", false),
	label_marchers: ini_read_real("PREFERENCES", "label_marchers", true),
	play_music: ini_read_real("PREFERENCES", "play_music", false),
}

global.debug_preferences = {
	mouse_coordinates: ini_read_real("DEBUG", "mouse_coordinates", false),
	mouse_position: ini_read_real("DEBUG", "mouse_position", false),
}

reset_show_info();

global.debug = debug_mode;
global.program_title = " - Brookie's Chart Visualizer";

debug_message(object_index, id, "global.start_time == " + string(global.start_time))

directory_destroy("cache/chart-export");

hash_type = field_hashes.HS;

window_set_caption("Blank Field" + global.program_title);