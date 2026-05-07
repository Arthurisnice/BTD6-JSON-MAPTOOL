show_debug_message("--- ASYNC EVENT TRIGGERED ---");
var i_d = ds_map_find_value(async_load, "id");
show_debug_message("ID received: " + string(i_d) + " | Expected msg_id: " + string(msg_id));

if (i_d == msg_id) { 
    if (ds_map_find_value(async_load, "status")) {
        var input_result = ds_map_find_value(async_load, "result");
        
        // DEBUG: THIS IS THE MOST IMPORTANT CHECK FOR BROWSER LIMITS
        show_debug_message("Status: TRUE. Total String Length Received: " + string(string_length(input_result)));
        
        if (input_result != "") {
            show_debug_message("Loading Attempt Started...");
            
            txt = input_result;    
            txt = string_replace_all(txt, "\"", "");
            show_debug_message("Quotes removed. Length is now: " + string(string_length(txt)));
    
            var _find_1 = "pathEnabledSequence:";
            var _find_2 = "nodes:";
            
            show_debug_message("Running get_paths()...");
            var will_work = get_paths(txt);
            
            show_debug_message("get_paths() returned: " + string(will_work));
            
            if (will_work == true) {
                show_debug_message("Validation Passed! Splitting by pathEnabledSequence...");
                txt = string_split(txt, _find_1);
                show_debug_message("Initial Split Count: " + string(array_length(txt)));
        
                txt[0] = string_replace(txt[0], "pathEnabledSequence:", "");

                path_amt_tobe = array_length(txt);
                
                // Cleanup loop
                for (var i = 0; i < path_amt_tobe; i++) {
                    if (txt[i] == undefined or txt[i] == noone or txt[i] == "") {
                        show_debug_message("Deleted empty entry at index: " + string(i));
                        array_delete(txt, i, 1); 
                        break;
                    }
                }
        
                path_amt_tobe = array_length(txt);
                show_debug_message("Cleaned Array Count (Paths to process): " + string(path_amt_tobe));
    
                // Second Split Loop
                for (var i = 0; i < path_amt_tobe; i++) {
                    show_debug_message("  -> Processing Path Segment: " + string(i));
                    
                    var temp_txt = txt[i];
                    temp_txt = string_split(txt[i], _find_2);
                    show_debug_message("    Split by 'nodes:'. Found chunks: " + string(array_length(temp_txt)));
            
                    temp_txt = string_replace(temp_txt[0], "[", "");
                    temp_txt = string_replace(temp_txt, "]", "");
            
                    array_secondary[i] = string_split(temp_txt, ",");
                    show_debug_message("    Values extracted for Path " + string(i) + ": " + string(array_length(array_secondary[i])));
                }
    
                show_debug_message("Applying values to path_controller...");
                
                // Final Assignment Loop
                show_debug_message("Applying values to path_controller...");

				for (var j = 0; j < path_amt_tobe; j++)
				{
				    var current_row_len = array_length(array_secondary[j]);
    
				    for (var k = 0; k < 100; k++)
				    {
				        if (k < current_row_len) 
				        {
				            // 1. Get the value and trim any hidden spaces
				            var raw_val = string_lower(string_trim(string(array_secondary[j][k])));
            
				            // 2. Explicitly check for the text "false" or "0"
				            var numb = 0;
				            if (raw_val == "false" || raw_val == "0") {
				                numb = 0;
				            } else {
				                numb = 1;
				            }
            
				            // 3. Convert to real and store
				            path_controller.path_arr[j][k] = real(numb);
            
				            // Debug the first few to confirm
				            if (k < 2) show_debug_message("Path " + string(j) + " Node " + string(k) + " fixed to: " + string(numb));
				        }
				    }
				}
    
                path_controller.path_amt = path_amt_tobe;
                var result = instance_create_depth(room_width / 2, room_height / 2, depth - 1, Load_result);
                result.image_index = 0;
                
                show_debug_message("--- SUCCESS COMPLETION ---");
                
            } else {
                show_debug_message("--- FAILURE: get_paths() returned FALSE ---");
                var result = instance_create_depth(room_width / 2, room_height / 2, depth - 1, Load_result);
                result.image_index = 1;
            }
        } else {
            show_debug_message("Input result was completely empty!");
        }
    } else {
        show_debug_message("Async Status was FALSE (User cancelled or error).");
    }
}