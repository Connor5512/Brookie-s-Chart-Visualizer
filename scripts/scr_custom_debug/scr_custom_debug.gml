/** @function find_asset_type
	* @description Find the asset type of any existing game asset.
	* @param {Asset} asset Reference to the game asset to check the type of.
	* @param {Bool} _string Return the asset type as a string instead of a Constant.AssetType value.
*/

function find_asset_type(asset, _string = false){
	var result = asset_get_type(asset);
	if (_string) {
		var type = "undefined";
		if asset_get_type(asset) == asset_object {
			type = "object";
		} else if asset_get_type(asset) == asset_animationcurve {
			type = "animationcurve";
		} else if asset_get_type(asset) == asset_font {
			type = "font";
		} else if asset_get_type(asset) == asset_particlesystem {
			type = "particlesystem";
		} else if asset_get_type(asset) == asset_path {
			type = "path";
		} else if asset_get_type(asset) == asset_room {
			type = "room";
		} else if asset_get_type(asset) == asset_script {
			type = "script";
		} else if asset_get_type(asset) == asset_sequence {
			type = "sequence";
		} else if asset_get_type(asset) == asset_shader {
			type = "shader";
		} else if asset_get_type(asset) == asset_sound {
			type = "sound";
		} else if asset_get_type(asset) == asset_sprite {
			type = "sprite";
		} else if asset_get_type(asset) == asset_tiles {
			type = "tiles";
		} else if asset_get_type(asset) == asset_timeline {
			type = "sprite";
		} else if asset_get_type(asset) == asset_unknown {
			type = "unknown";
		}
		result = "asset_" + type;
	}
	
	return result;
}

/** @function find_object_id
	* @description Find the object index of any existing game object.
	* @param {Asset.GMObject} object Reference to the game asset to check the type of.
	* @param {Bool} _string Return the asset type as a string instead of a Constant.AssetType value.
*/

function find_object_id(object){
		ini_open("temp");
		ini_write_real("temp", "object_index", object);
		var temp_key = -512345183513248127222222222109187345098;
		var result = ini_read_real("temp", "object_index", temp_key);
		if (result == temp_key || find_asset_type(object) != asset_object) result = undefined;
		return result;
}

/**
 * @function debug_message
 * @description This function will create a custom debug message that is shown in the compiler window at runtime, alongside the name of the object that sent it, and the instance id of the object that sent the message.
 * @param {Asset.GMObject} object The game object that sent the debug message.
 * @param {Id.Instance} inst The id of the instance that sent the debug message.
 * @param {Any} string_or_format The custom debug message to show or a string format.
*/

function debug_message(object, inst, val_or_format, type = log_types.info) {
	var log_names = [
		"/info",
		"/warn",
		"/error",
		"/UUT"
	]
	
	var obj = string_replace_all(string(object), "ref object ", "");
	obj = string_replace_all(string(obj), "ref script ", "");
	var instance = string_replace_all(string(inst), "ref instance ", "");
	
	var log = file_text_open_append(global.log_file);
	var _message = "[" + log_names[type] + "] " + obj + " (" + instance + ") - \"" + string(val_or_format) + "\""
	show_debug_message(_message);
	file_text_write_string(log, _message);
	file_text_writeln(log);
	file_text_close(log);
}

enum log_types {
	info,
	warn,
	error,
	unit_test
}