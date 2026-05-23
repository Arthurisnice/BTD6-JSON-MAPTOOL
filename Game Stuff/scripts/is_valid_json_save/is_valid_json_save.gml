function is_valid_json_save(file_path) 
{
	try
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
			
			var second_test=text.mapEditorModel.customMapModel.PathData
			
			var third_test=text.mapEditorModel.customMapModel.MapEditorSettingsData.totalPathPatternSequences
			
			var fourth_test=text.mapEditorModel.customMapModel.PathData[0].pathEnabledSequence[0]
			
			return true
	}
	catch (_exception) {
	    show_debug_message("\nJson DID NOT Loaded Sucessfully:" + string(_exception.message) + " \n")
	    
		if instance_exists(Load_result) {instance_destroy(Load_result)}
		var result = instance_create_depth(room_width / 2, room_height / 2, depth - 1, Load_result);
		result.image_index = 1;
		
		return false
	}

}