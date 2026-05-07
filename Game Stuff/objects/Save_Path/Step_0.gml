if place_meeting(x,y,o_mouse) && mouse_check_button_pressed(mb_left) {path_save=true;  	save_change()}
image_xscale=1
image_yscale=1
if path_save==true
{
	image_xscale=0.9
	image_yscale=0.9
	fail_array=[]
	path_save=false
	var verify=true
	var arr_temp = path_controller.path_arr
	var arr_amt = path_controller.path_amt
	
	 for (var v = 0; v < 100; v++)
	{
	    var all_zeros = true; 

	    for (var p = 0; p <= arr_amt; p++)
	    {
	        if (arr_temp[p][v] != false) 
	        {
	            all_zeros = false; // Found a path! This position is NOT a fail.
	            break; 
	        }
	    }

	    // If we checked every 'p' and never found a non-zero value:
	    if (all_zeros)
	    {
	        verify = false;
	        array_push(Fail_Save.fail_array, v); 
	    }
	}
	
	if verify==true
	{		
		var _loaded_file = file_text_open_read(s_file_path);
		var _temp_vbuff_list = "";
		while (!file_text_eof(_loaded_file))
		{
			_temp_vbuff_list += file_text_read_string(_loaded_file);
			file_text_readln(_loaded_file);
		}
		file_text_close(_loaded_file);    delete(_loaded_file);
			
		var text = SnapFromJSON(_temp_vbuff_list,true)

		clipboard_set_text(text)
		
		 /*
		for (var i=0;i<path_controller.path_amt;i++)
		{
			text.mapEditorData.mapEditorModel.customMapModel.PathData[i].pathWidth = int64(path_controller.path_size[i])
			text.mapEditorData.mapEditorModel.customMapModel.PathData[i].pathEnabledSequence = path_controller.path_arr[i]
		}
		
		text.mapEditorData.mapEditorModel.customMapModel.MapEditorSettingsData.totalPathPatternSequences=100

			
		var update_json = json_stringify(text)
		
			
		var _buf = buffer_create(string_byte_length(update_json), buffer_fixed, 1);
		buffer_write(_buf, buffer_text, update_json);
		buffer_save(_buf, s_file_path);
		buffer_delete(_buf);
			
		if instance_exists(Load_result) {instance_destroy(Load_result)}
		var result = instance_create_depth(room_width / 2, room_height / 2, depth - 1, Load_result);
		result.image_index = 2;
		*/
	}
	else
	{
		Fail_Save.image_alpha=1
	}

}


