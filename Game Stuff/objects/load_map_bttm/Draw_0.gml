draw_self()

image_xscale=1
image_yscale=1

if place_meeting(x,y,o_mouse) && mouse_check_button_pressed(mb_left) && timer==0
{
	save_change()
	image_xscale=0.9
	image_yscale=0.9
	
	timer=3
	
	
}
	
if timer>0 
{
	timer--
	draw_rectangle_colour(0,0,room_width,room_height,c_black,c_black,c_black,c_black,false)
	draw_text(room_width/2,room_height/2,"Loading...")
}
if timer==1{loaded=true}
	
	
if loaded==true
{
	m_file_path=get_open_filename(".json","Open a MapData Save you have, on an existing MapData you have.")
	
	
	show_debug_message(m_file_path)

	
	if is_valid_json(Load_Path.file_path) && file_exists(Load_Path.file_path)
	{
		if is_valid_json_save(m_file_path) && file_exists(m_file_path)
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
			
			//======================================================//
			
			var _loaded_file_MAIN = file_text_open_read(Load_Path.file_path);
			var _temp_vbuff_list_MAIN = "";
			while (!file_text_eof(_loaded_file_MAIN))
			{
				_temp_vbuff_list_MAIN += file_text_read_string(_loaded_file_MAIN);
				file_text_readln(_loaded_file_MAIN);
			}
			file_text_close(_loaded_file_MAIN);    delete(_loaded_file_MAIN);
			
			var text_temp_MAIN = string_replace_all(_temp_vbuff_list_MAIN,"\"\"","\"#$#code#$#\"")
		
			var text_MAIN = SnapFromJSON(text_temp_MAIN,true)
			
			text_MAIN.mapEditorData=text
			
			var final_txt = SnapToJSON(text_MAIN, false, false, false,true)
		
			var update_json = string_replace_all(final_txt,"#$#code#$#","")
		
			
			var _buf = buffer_create(string_byte_length(update_json), buffer_fixed, 1);
			buffer_write(_buf, buffer_text, update_json);
			buffer_save(_buf, Load_Path.file_path);
			buffer_delete(_buf);
			
			Load_Path.skip_path_get=true
			Load_Path.skip_mssg=true
			Load_Path.load_paths=true
			
			if instance_exists(Load_result) {instance_destroy(Load_result)}
			var result = instance_create_depth(room_width / 2, room_height / 2, depth - 1, Load_result);
			result.image_index = 3;
			show_debug_message("teste for image 3")
			loaded=false
			
		}
		else
		{
			if instance_exists(Load_result) {instance_destroy(Load_result)}
			var result = instance_create_depth(room_width / 2, room_height / 2, depth - 1, Load_result);
			result.image_index = 4;
			show_debug_message("teste for image4 ")
			loaded=false
		}
	}
	else
	{
		if instance_exists(Load_result) {instance_destroy(Load_result)}
		var result = instance_create_depth(room_width / 2, room_height / 2, depth - 1, Load_result);
		result.image_index = 5;
		show_debug_message("teste for image 5")
		loaded=false
	}
}
