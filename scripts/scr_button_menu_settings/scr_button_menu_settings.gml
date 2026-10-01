if variable_global_exists("button_init") {
	set_settings_visibility(!(layer_get_visible("SettingsUI")));
}

function set_settings_visibility(_visible) {
	layer_set_visible("UI", !(_visible));
	
	layer_set_visible("SettingsMenu2", _visible);
	layer_set_visible("SettingsUI", _visible);
	layer_set_visible("SettingsMenu1", _visible);
}