
image_xscale=1
image_yscale=1

if place_meeting(x,y,o_mouse) && mouse_check_button_pressed(mb_left) 
{
	save_change()
	image_xscale=0.9
	image_yscale=0.9
	
	m_file_path=Load_Path.file_path
	
if is_valid_json(m_file_path)
{
	if file_exists(m_file_path)
	{
		var _loaded_file = file_text_open_read(m_file_path);
		var _temp_vbuff_list = "";
		while (!file_text_eof(_loaded_file))
		{
			_temp_vbuff_list += file_text_read_string(_loaded_file);
			file_text_readln(_loaded_file);
		}
		file_text_close(_loaded_file);    delete(_loaded_file);
			
		var text_temp = string_replace_all(_temp_vbuff_list,"\"\"","\"#$#code#$#\"")
		
		var text = SnapFromJSON(text_temp,true)
			if Save_Path.repeat_round==true
		{
			for (var r=0;r<path_controller.path_amt;r++)
			{
				text.mapEditorData.mapEditorModel.customMapModel.PathData[r].pathWidth = int64(path_controller.path_size[r])
				text.mapEditorData.mapEditorModel.customMapModel.PathData[r].pathEnabledSequence = path_controller.path_arr[r]
			}
						
			for (var f1=0;f1<path_controller.path_amt;f1++)
			{
				for (var f2=100;f2<4000;f2++)
				{
					text.mapEditorData.mapEditorModel.customMapModel.PathData[f1].pathEnabledSequence[f2] = path_controller.path_arr[f1][99]
				}
			}
					
			text.mapEditorData.mapEditorModel.customMapModel.MapEditorSettingsData.totalPathPatternSequences=4000
		}
		else
		{
			for (var i=0;i<path_controller.path_amt;i++)
			{
				for (var i2=0; i2<path_controller.lane_amount;i2++)
				{
					text.mapEditorData.mapEditorModel.customMapModel.PathData[i].pathEnabledSequence[i2] = path_controller.path_arr[i][i2]
				}
				text.mapEditorData.mapEditorModel.customMapModel.PathData[i].pathWidth = int64(path_controller.path_size[i])
			}
					
					
			text.mapEditorData.mapEditorModel.customMapModel.MapEditorSettingsData.totalPathPatternSequences=100
		}	
		
		var final_txt = SnapToJSON(text.mapEditorData, false, false, false,true)
		
		var update_json = string_replace_all(final_txt,"#$#code#$#","")
	
		var _path = get_save_filename_ext(".json","","working_directory","Save your map data. So you can have multiple save files :>")
	
		_path=_path
	
		var _file = file_text_open_write(_path+".json");
		file_text_write_string(_file, update_json);
		file_text_close(_file);
	
	}
}
	
}
