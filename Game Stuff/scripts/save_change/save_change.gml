function save_change(){

path_controller.saved_amt=path_controller.path_amt


// --- Sequence 1 ---
var leng_1 = array_length(path_controller.saved_array_1);
var pos_1 = 0;
if (leng_1 > 100) {
    array_delete(path_controller.saved_array_1, 0, 1);
    leng_1--;
}
var _copy_1 = [];
array_copy(_copy_1, 0, path_controller.path_arr[pos_1], 0, array_length(path_controller.path_arr[pos_1]));
path_controller.saved_array_1[leng_1] = _copy_1;


// --- Sequence 2 ---
var leng_2 = array_length(path_controller.saved_array_2);
var pos_2 = 1;
if (leng_2 > 100) {
    array_delete(path_controller.saved_array_2, 0, 1);
    leng_2--;
}
var _copy_2 = [];
array_copy(_copy_2, 0, path_controller.path_arr[pos_2], 0, array_length(path_controller.path_arr[pos_2]));
path_controller.saved_array_2[leng_2] = _copy_2;

// --- Sequence 3 ---
var leng_3 = array_length(path_controller.saved_array_3);
var pos_3 = 2;
if (leng_3 > 100) {
    array_delete(path_controller.saved_array_3, 0, 1);
    leng_3--;
}
var _copy_3 = [];
array_copy(_copy_3, 0, path_controller.path_arr[pos_3], 0, array_length(path_controller.path_arr[pos_3]));
path_controller.saved_array_3[leng_3] = _copy_3;

// --- Sequence 4 ---
var leng_4 = array_length(path_controller.saved_array_4);
var pos_4 = 3;
if (leng_4 > 100) {
    array_delete(path_controller.saved_array_4, 0, 1);
    leng_4--;
}
var _copy_4 = [];
array_copy(_copy_4, 0, path_controller.path_arr[pos_4], 0, array_length(path_controller.path_arr[pos_4]));
path_controller.saved_array_4[leng_4] = _copy_4;

// --- Sequence 5 ---
var leng_5 = array_length(path_controller.saved_array_5);
var pos_5 = 4;
if (leng_5 > 100) {
    array_delete(path_controller.saved_array_5, 0, 1);
    leng_5--;
}
var _copy_5 = [];
array_copy(_copy_5, 0, path_controller.path_arr[pos_5], 0, array_length(path_controller.path_arr[pos_5]));
path_controller.saved_array_5[leng_5] = _copy_5;

// --- Sequence 6 ---
var leng_6 = array_length(path_controller.saved_array_6);
var pos_6 = 5;
if (leng_6 > 100) {
    array_delete(path_controller.saved_array_6, 0, 1);
    leng_6--;
}
var _copy_6 = [];
array_copy(_copy_6, 0, path_controller.path_arr[pos_6], 0, array_length(path_controller.path_arr[pos_6]));
path_controller.saved_array_6[leng_6] = _copy_6;

// --- Sequence 7 ---
var leng_7 = array_length(path_controller.saved_array_7);
var pos_7 = 6;
if (leng_7 > 100) {
    array_delete(path_controller.saved_array_7, 0, 1);
    leng_7--;
}
var _copy_7 = [];
array_copy(_copy_7, 0, path_controller.path_arr[pos_7], 0, array_length(path_controller.path_arr[pos_7]));
path_controller.saved_array_7[leng_7] = _copy_7;

// --- Sequence 8 ---
var leng_8 = array_length(path_controller.saved_array_8);
var pos_8 = 7;
if (leng_8 > 100) {
    array_delete(path_controller.saved_array_8, 0, 1);
    leng_8--;
}
var _copy_8 = [];
array_copy(_copy_8, 0, path_controller.path_arr[pos_8], 0, array_length(path_controller.path_arr[pos_8]));
path_controller.saved_array_8[leng_8] = _copy_8;

}