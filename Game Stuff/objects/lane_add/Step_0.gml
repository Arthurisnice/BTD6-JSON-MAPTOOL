
image_xscale=1
image_yscale=1

if place_meeting(x,y,o_mouse) && mouse_check_button_pressed(mb_left) 
{
	
	image_xscale=0.9
	image_yscale=0.9
	var amt=path_controller.lane_amount
	if (amt+1) <= 100
	{
		path_controller.lane_amount++
	}
}
