function string_append(_string, substring) {
	return _string + substring;
}

function string_prepend(_string, substring) {
	return substring + _string;
}

function create_message(_string) {
	var inst = instance_create_depth(0, 0, -9999, obj_message);
	inst.text = string(_string);
}

function string_contains(_string, substring) {
	return _string != string_replace_all(_string, substring, "");
}