click_script = scr_button_menu_fourelements;
button = "midi";

clickable_function = true;
function check_clickable() {
	clickable = (file_exists(working_directory + "sample/four_elements.show"));
}