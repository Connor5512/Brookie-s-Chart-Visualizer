function add_array_struct_variable(array, _until, name) {
	var _total = 0;
	for (var i = 0; i < _until + 1; i++) {
		_total = _total + real(variable_struct_get(array[i], name));
	}

	return _total;
}