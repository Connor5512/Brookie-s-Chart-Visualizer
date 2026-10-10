click_script = scr_button_generalized_info;

//not actually checking any files here
//im only using filename_ext() and filename_name() to remove the trailing build number
var version = string_replace(filename_name(GM_version), filename_ext(GM_version), "");

info_text = "Brookie's Chart Visualizer - An experimental marching band coordinate visualizer.\n\nCreated by Brookie512"
+ "\n\nVersion " + version;
