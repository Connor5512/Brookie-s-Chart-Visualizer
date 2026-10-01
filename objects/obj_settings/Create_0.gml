init_music();
game_set_speed(60, gamespeed_fps);

opening = false;
saving = false;

set_settings_visibility(false);
set_menu_visibility(true);

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

global.debug = false;
global.program_title = " - Brookie's Chart Visualizer";