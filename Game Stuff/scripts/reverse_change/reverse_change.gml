
function reverse_change(){

	// --- Sequence 1 ---
	var leng_1 = array_length(path_controller.saved_array_1);
	var _pos_to_1 = array_last(path_controller.saved_array_1);
	var pos_1 = 0;
	if (leng_1 > 1) {
	    path_controller.path_arr[pos_1] = _pos_to_1;
	    array_delete(path_controller.saved_array_1, leng_1 - 1, 1);
	}

	// --- Sequence 2 ---
	var leng_2 = array_length(path_controller.saved_array_2);
	var _pos_to_2 = array_last(path_controller.saved_array_2);
	var pos_2 = 1;
	if (leng_2 > 1) {
	    path_controller.path_arr[pos_2] = _pos_to_2;
	    array_delete(path_controller.saved_array_2, leng_2 - 1, 1);
	}

	// --- Sequence 3 ---
	var leng_3 = array_length(path_controller.saved_array_3);
	var _pos_to_3 = array_last(path_controller.saved_array_3);
	var pos_3 = 2;
	if (leng_3 > 1) {
	    path_controller.path_arr[pos_3] = _pos_to_3;
	    array_delete(path_controller.saved_array_3, leng_3 - 1, 1);
	}

	// --- Sequence 4 ---
	var leng_4 = array_length(path_controller.saved_array_4);
	var _pos_to_4 = array_last(path_controller.saved_array_4);
	var pos_4 = 3;
	if (leng_4 > 1) {
	    path_controller.path_arr[pos_4] = _pos_to_4;
	    array_delete(path_controller.saved_array_4, leng_4 - 1, 1);
	}

	// --- Sequence 5 ---
	var leng_5 = array_length(path_controller.saved_array_5);
	var _pos_to_5 = array_last(path_controller.saved_array_5);
	var pos_5 = 4;
	if (leng_5 > 1) {
	    path_controller.path_arr[pos_5] = _pos_to_5;
	    array_delete(path_controller.saved_array_5, leng_5 - 1, 1);
	}

	// --- Sequence 6 ---
	var leng_6 = array_length(path_controller.saved_array_6);
	var _pos_to_6 = array_last(path_controller.saved_array_6);
	var pos_6 = 5;
	if (leng_6 > 1) {
	    path_controller.path_arr[pos_6] = _pos_to_6;
	    array_delete(path_controller.saved_array_6, leng_6 - 1, 1);
	}

	// --- Sequence 7 ---
	var leng_7 = array_length(path_controller.saved_array_7);
	var _pos_to_7 = array_last(path_controller.saved_array_7);
	var pos_7 = 6;
	if (leng_7 > 1) {
	    path_controller.path_arr[pos_7] = _pos_to_7;
	    array_delete(path_controller.saved_array_7, leng_7 - 1, 1);
	}

	// --- Sequence 8 ---
	var leng_8 = array_length(path_controller.saved_array_8);
	var _pos_to_8 = array_last(path_controller.saved_array_8);
	var pos_8 = 7;
	if (leng_8 > 1) {
	    path_controller.path_arr[pos_8] = _pos_to_8;
	    array_delete(path_controller.saved_array_8, leng_8 - 1, 1);
	}

	path_controller.path_amt=path_controller.saved_amt
}