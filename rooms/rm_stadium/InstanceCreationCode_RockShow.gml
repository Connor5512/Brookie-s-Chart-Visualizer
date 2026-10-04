click_script = scr_button_menu_rockshow;

clickable = false;
if
	(file_exists(working_directory + "rock_show.show"))
{
	clickable = true;
}

//debug_message(object_index, id, working_directory + "rock_show/" + "firework.chart");
//debug_message(object_index, id, file_exists(working_directory + "rock_show/" + "firework.chart"));