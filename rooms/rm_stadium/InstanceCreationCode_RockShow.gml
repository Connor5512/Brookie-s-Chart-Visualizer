click_script = scr_button_menu_rockshow;

clickable = false;
if
	(file_exists(working_directory + "rock_show.show"))
{
	clickable = true;
}

//show_debug_message(working_directory + "rock_show/" + "firework.chart");
//show_debug_message(file_exists(working_directory + "rock_show/" + "firework.chart"));