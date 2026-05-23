if file_exists(working_directory+"json_file.json")
	{
		var _loaded_file = file_text_open_read(working_directory+"json_file.json");
		var _temp_vbuff_list = "";
		    while (!file_text_eof(_loaded_file))
		    {
		        _temp_vbuff_list += file_text_read_string(_loaded_file);
		        file_text_readln(_loaded_file);
		    }
		    file_text_close(_loaded_file);    delete(_loaded_file);

			var text = json_parse(_temp_vbuff_list)
			save_struct=text.mapEditorData
	}