click_script = scr_button_generalized_hyperlink;

icon = spr_github;

link = "https://github.com/Connor5512/Brookie-s-Chart-Visualizer";
mouse_hover = cr_handpoint;

clickable_function = true;
function check_clickable() {
	clickable = !(global.is_mobile);
}