click_script = scr_button_menu_rockshow;

clickable = false;
if
	(file_exists(working_directory + "rock_show/animal.brcv")) &&
	(file_exists(working_directory + "rock_show/animal.json")) &&
	(file_exists(working_directory + "rock_show/animal.ogg")) &&
	
	(file_exists(working_directory + "rock_show/everybody_talks.brcv")) &&
	(file_exists(working_directory + "rock_show/everybody_talks.json")) &&
	(file_exists(working_directory + "rock_show/everybody_talks.ogg")) &&
	
	(file_exists(working_directory + "rock_show/firework.brcv")) &&
	(file_exists(working_directory + "rock_show/firework.json")) &&
	(file_exists(working_directory + "rock_show/firework.ogg"))
{
	clickable = true;
}

//show_debug_message(working_directory + "rock_show/" + "firework.brcv");
//show_debug_message(file_exists(working_directory + "rock_show/" + "firework.brcv"));