function get_file_count(directory) {
    var _count = 0;
    var _file = file_find_first(directory + "/*", 0);
    
    while (_file != "") {
        if (_file != "." && _file != "..") {
            _count++;
        }
        _file = file_find_next();
    }
    
    file_find_close();
    return _count;
}

function get_directory_files(_dir, _mask = "*.*") {
   var _file_names = [];
   
	if (string_char_at(_dir, string_length(_dir)) != "/" &&
		string_char_at(_dir, string_length(_dir)) != "\\") {
		_dir += "/";
	}
			
	var _file_name = file_find_first(_dir + _mask, 0);
			
	while (_file_name != "") {
		array_push(_file_names, _file_name);
		_file_name = file_find_next();
	}
			
	file_find_close();
	
	return _file_names;
}

function load_json(json_path) {
	var buffer = buffer_load(json_path);
	var json = buffer_read(buffer, buffer_text);
	
	return json_parse(json);
}