/**
* @function is_multiple
* @description Checks whether a value is a multiple of another value.
* @param {Real} n1 The value to be checked for being a multiple.
* @param {Real} n2 The value to check for multiples of.
* @returns {bool} The clamped value.
*/

function is_multiple(n1, n2) {
    //return n1 mod n2 == 0;
	//show_debug_message(n1/n2);
	return abs(round(n1/n2) - (n1/n2)) <= 0.06
	
	//!(string_contains(string((n1/n2)), "."));
}

function round_to_multiple(_round, multiple, _method = rounding.normal) {
	var result;
	if _method == rounding.up {
		result = ceil(_round/multiple) * multiple;
	} else if _method == rounding.down {
		result = floor(_round/multiple) * multiple;
	} else if _method == rounding.normal {
		result = round(_round/multiple) * multiple;
	}
	
	return result;
}

enum rounding {
	normal,
	up,
	down
}