
image_xscale=1
image_yscale=1

if place_meeting(x,y,o_mouse) && mouse_check_button_pressed(mb_left) 
{
	save_change()
	image_xscale=0.9
	image_yscale=0.9
	path_controller.path_arr[path_controller.selected] = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
}
