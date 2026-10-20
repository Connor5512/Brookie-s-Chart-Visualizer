function set_settings_visibility(_visible) {
	set_menu_visibility(!(_visible));
	
	layer_set_visible("SettingsMenu2", _visible);
	layer_set_visible("SettingsUI", _visible);
	layer_set_visible("SettingsMenu1", _visible);
}

function set_menu_visibility(_visible) {
	layer_set_visible("ButtonDetailing", _visible);
	layer_set_visible("UI", _visible);
	layer_set_visible("UI_top", _visible);
	layer_set_visible("ButtonTop_detaiol", _visible);
	layer_set_visible("MenuBackground", _visible);
}