click_script = scr_button_menu_fourelements;

clickable = false;
if
	(file_exists(working_directory + "four_elements/part_one_earth.brcv")) &&
	(file_exists(working_directory + "four_elements/part_one_earth.json")) &&
	(file_exists(working_directory + "four_elements/part_one_earth_const.ogg")) &&
	
	(file_exists(working_directory + "four_elements/part_two_water.brcv")) &&
	(file_exists(working_directory + "four_elements/part_two_water.json")) &&
	(file_exists(working_directory + "four_elements/part_two_water.ogg")) &&
	
	(file_exists(working_directory + "four_elements/part_three_air.brcv")) &&
	(file_exists(working_directory + "four_elements/part_three_air.json")) &&
	(file_exists(working_directory + "four_elements/part_three_air_const.ogg")) &&
	
	(file_exists(working_directory + "four_elements/part_four_fire_finale.brcv")) &&
	(file_exists(working_directory + "four_elements/part_four_fire_finale.json")) &&
	(file_exists(working_directory + "four_elements/part_four_fire_finale.ogg"))
{
	clickable = true;
}

show_debug_message(clickable);
