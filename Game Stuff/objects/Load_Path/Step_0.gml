image_xscale=1
image_yscale=1
if load_paths==true
{
	image_xscale=0.9
	image_yscale=0.9
	
	var temp_file_path=""
	
	if skip_path_get==false
	{
		temp_file_path = get_open_filename(".json","")
	}
	if skip_path_get==true {skip_path_get=false; temp_file_path=file_path}
	
	msg_id = file_text_open_read(temp_file_path)
	
	if is_valid_json(temp_file_path)
	{
		if file_exists(temp_file_path)
		{
			file_path=temp_file_path
			
			var _loaded_file = file_text_open_read(file_path);
			var _temp_vbuff_list = "";
			while (!file_text_eof(_loaded_file))
			{
			    _temp_vbuff_list += file_text_read_string(_loaded_file);
			    file_text_readln(_loaded_file);
			}
			file_text_close(_loaded_file);    delete(_loaded_file);
			
			var text = json_parse(_temp_vbuff_list)
			
			show_debug_message("Json Loaded Sucessfully")
			
			if text.mapEditorData.mapEditorModel.customMapModel.MapEditorSettingsData.totalPathPatternSequences==4000
			{
				repeat_l_round.image_index=1
			}
			
			msg_id=text.mapEditorData
		}
		
		var path_data_leng=array_length(msg_id.mapEditorModel.customMapModel.PathData)
	
		show_debug_message(msg_id.mapEditorModel.customMapModel.PathData)
		show_debug_message("\narray of size:" +string(path_data_leng))
	
		var lane_size = array_length(msg_id.mapEditorModel.customMapModel.PathData[0].pathEnabledSequence)
		
		path_controller.lane_amount=lane_size
		
	
		for (var i=0;i<path_data_leng;i++)
		{
			for (var i2=0; i2<lane_size;i2++)
			{
				path_controller.path_arr[i][i2] = msg_id.mapEditorModel.customMapModel.PathData[i].pathEnabledSequence[i2]
			}
		}
		show_debug_message(msg_id.mapEditorModel.customMapModel.MapEditorSettingsData.totalPathPatternSequences)
		msg_id.mapEditorModel.customMapModel.MapEditorSettingsData.totalPathPatternSequences=lane_size
			
		path_controller.path_amt=path_data_leng
	
		if skip_mssg==false
		{
			if instance_exists(Load_result) {instance_destroy(Load_result)}
			var result = instance_create_depth(room_width / 2, room_height / 2, depth - 1, Load_result);
		    result.image_index = 0;
		}
		else if skip_mssg==true {skip_mssg=false}
		
	}

	load_paths=false
	Save_Path.s_file_path=file_path	
}

if place_meeting(x,y,o_mouse) && mouse_check_button_pressed(mb_left) {load_paths=true; 	save_change()}