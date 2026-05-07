if place_meeting(x,y,o_mouse) && mouse_check_button_pressed(mb_left) 
{
	if path_controller.path_amt<8 {path_controller.path_amt++}
}

if path_controller.path_amt==8 {image_alpha=0.5}
else {image_alpha=1}