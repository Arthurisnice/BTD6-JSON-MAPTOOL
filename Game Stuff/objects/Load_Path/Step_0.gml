if load_paths==true
{
	msg_id = get_string_async("PASTE IT HERE, IN HERE!!", "")
	
	load_paths=false
}

if place_meeting(x,y,o_mouse) && mouse_check_button_pressed(mb_left) {load_paths=true}