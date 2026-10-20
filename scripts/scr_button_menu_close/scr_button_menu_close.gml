if variable_global_exists("button_init") {
	if button == "Settings" {
		set_settings_visibility(false);
	} else if button == "UI_close" {
		set_menu_visibility(false);
	} else if button == "UI_open" {
		set_menu_visibility(true);
	}
}