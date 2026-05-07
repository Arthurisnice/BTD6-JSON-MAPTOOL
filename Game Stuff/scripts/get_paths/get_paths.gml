function get_paths(_input_txt) {
    if (!instance_exists(path_controller)) return false;
    
    var _f1 = "pathEnabledSequence:";
    var _f2 = "nodes:";

    try {
        // 1. Split the main segments
        var _segments = string_split(_input_txt, _f1);
        var _valid_segments = [];
        
        // 2. Clean up segments (remove empty entries caused by the split)
        for (var i = 0; i < array_length(_segments); i++) {
            var _trimmed = string_trim(_segments[i]);
            if (_trimmed != "" && _trimmed != " ") {
                array_push(_valid_segments, _trimmed);
            }
        }

        if (array_length(_valid_segments) == 0) return false;
        
        // 3. Validate each segment
        for (var i = 0; i < array_length(_valid_segments); i++) {
            var _row = _valid_segments[i];
            var _second_split = string_split(_row, _f2);
            
            if (array_length(_second_split) < 1) return false;
            
            // Clean brackets and spaces
            var _clean_row = _second_split[0];
            _clean_row = string_replace_all(_clean_row, "[", "");
            _clean_row = string_replace_all(_clean_row, "]", "");
            _clean_row = string_trim(_clean_row);
            
            var _final_values = string_split(_clean_row, ",");

            // DEBUG: See why it's failing
            show_debug_message("Segment " + string(i) + " length: " + string(array_length(_final_values)));

            // If you need EXACTLY 100, keep this. 
            // If you need AT LEAST 100, use < 100.
            if (array_length(_final_values) == 0) {
                show_debug_message("Failed at segment " + string(i) + " - too few values.");
                return false;
            }
        }

        return true; 
    }
    catch (_exception) {
        show_debug_message("Error in get_paths: " + string(_exception.message));
        return false;
    }
}