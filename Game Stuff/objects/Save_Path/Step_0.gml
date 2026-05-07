if place_meeting(x,y,o_mouse) && mouse_check_button_pressed(mb_left) {path_save=true; show_debug_message("teste")}

if path_save==true
{
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
	        if (arr_temp[p][v] != 0) 
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
		var txt = ""
	
		for (i=0; i<arr_amt; i++)
		{	
			
			var final_arr=[]
			
			for (var f=0; f<100; f++)
			{
				final_arr[i][f] = arr_temp[i][f]==0 ? "false" : "true";
			
			}
			
			txt = txt + "Path "+string(i+1)+" -> " + string(final_arr[i]) + "\n"
		}
		
		txt=string_replace_all(txt,"\"","")
		txt=string_replace_all(txt," ","")
		
		show_debug_message(txt)
		
		instance_create_depth(room_width/2,room_height/2,depth-1,Save_Result)
		clipboard_set_text(txt)
	}
	else
	{
		Fail_Save.image_alpha=1
	}

}


