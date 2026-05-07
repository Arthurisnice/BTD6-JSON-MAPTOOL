image_xscale=1
image_yscale=1
if load_paths==true
{
	image_xscale=0.9
	image_yscale=0.9
	file_path = get_open_filename(".json","")
	
	msg_id = file_text_open_read(file_path)
	
	if is_valid_json(file_path)
	{
		if file_exists(file_path)
		{
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
			
			msg_id=text.mapEditorData
		}
		
		var path_data_leng=array_length(msg_id.mapEditorModel.customMapModel.PathData)
	
		show_debug_message(msg_id.mapEditorModel.customMapModel.PathData)
		show_debug_message("\narray of size:" +string(path_data_leng))
	
		if msg_id.mapEditorModel.customMapModel.MapEditorSettingsData.totalPathPatternSequences!=100
		{
			for (var i=0;i<path_data_leng;i++)
			{
				msg_id.mapEditorModel.customMapModel.PathData[i].pathEnabledSequence = [true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true]
			}
		
			show_debug_message("100 rounds created in save file/n")
		
			show_debug_message(msg_id.mapEditorModel.customMapModel.MapEditorSettingsData.totalPathPatternSequences)
			msg_id.mapEditorModel.customMapModel.MapEditorSettingsData.totalPathPatternSequences=100
			
			path_controller.path_amt=path_data_leng
		}
		else
		{
			show_debug_message("100 rounds detected, loading paths...")
		
			for (var j=0;j<path_data_leng;j++)
			{
				show_debug_message(msg_id.mapEditorModel.customMapModel.PathData[j].pathEnabledSequence)
				show_debug_message("\n")
				path_controller.path_arr[j]=msg_id.mapEditorModel.customMapModel.PathData[j].pathEnabledSequence
				path_controller.path_size[j]=msg_id.mapEditorModel.customMapModel.PathData[j].pathWidth
			}
		
			path_controller.path_amt=path_data_leng
		}
	
		if instance_exists(Load_result) {instance_destroy(Load_result)}
		var result = instance_create_depth(room_width / 2, room_height / 2, depth - 1, Load_result);
	    result.image_index = 0;
	}

	load_paths=false
	Save_Path.s_file_path=file_path	
}

if place_meeting(x,y,o_mouse) && mouse_check_button_pressed(mb_left) {load_paths=true; 	save_change()}