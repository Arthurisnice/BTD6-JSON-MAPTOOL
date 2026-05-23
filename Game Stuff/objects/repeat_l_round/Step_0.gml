
image_xscale=og_sc
image_yscale=og_sc

if place_meeting(x,y,o_mouse) && mouse_check_button_pressed(mb_left) 
{
	image_xscale=og_sc-0.1
	image_yscale=og_sc-0.1
	image_index++
}


if image_index==1
{
	Save_Path.repeat_round=true
}
else
{
	Save_Path.repeat_round=false
}
