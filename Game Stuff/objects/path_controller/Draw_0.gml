draw_set_valign(fa_middle)
draw_set_halign(fa_left)
draw_set_font(font_smll)

var vertical_dsp = 42
var sqr_size = 10
var pos_hight = 20
var hor_pos = 94
var lane_size = 14

for (var p=0; p<path_amt; p++)
{

	for (var i=0;i<100;i++)
	{
		var desplacment = hor_pos+(12*i)
		var height_dps = pos_hight+vertical_dsp*p
		
		if i<50
		{
			if collision_rectangle(desplacment,height_dps,desplacment+sqr_size,height_dps+sqr_size,o_mouse,false,true) && mouse_check_button_pressed(mb_left)
			{
				if path_arr[p][i]==0 {path_arr[p][i]=1}
				else if path_arr[p][i]==1 {path_arr[p][i]=0}
			}
			
			if collision_rectangle(desplacment,height_dps,desplacment+sqr_size,height_dps+sqr_size,o_mouse,false,true)
			{
				draw_set_halign(fa_center)
				draw_set_font(font_big)
					draw_text(675,560,i+1)
				draw_set_font(font_smll)
				draw_set_halign(fa_left)
			}
			
			draw_sprite(s_box,path_arr[p][i],desplacment,height_dps)
		}
		else
		{
			if collision_rectangle(desplacment-12*50,height_dps+lane_size,desplacment+sqr_size-12*50,height_dps+sqr_size+lane_size,o_mouse,false,true) && mouse_check_button_pressed(mb_left)
			{
				if path_arr[p][i]==0 {path_arr[p][i]=1}
				else if path_arr[p][i]==1 {path_arr[p][i]=0}
			}
			
			if collision_rectangle(desplacment-12*50,height_dps+lane_size,desplacment+sqr_size-12*50,height_dps+sqr_size+lane_size,o_mouse,false,true)
			{
				draw_set_halign(fa_center)
				draw_set_font(font_big)
					draw_text(675,560,i+1)
				draw_set_font(font_smll)
				draw_set_halign(fa_left)
			}
			
			draw_sprite(s_box,path_arr[p][i],desplacment-12*50,height_dps+lane_size)
		}
		
	}
}

var next_pos = pos_hight+vertical_dsp*path_amt+20

var path_x_pos=20
for (var b=0;b<path_amt+1;b++)
{
	if b<path_amt
	{
		
		var txt_y=pos_hight+vertical_dsp*b+10
		draw_line_width_colour(0,txt_y-20,room_width,txt_y-20,6,c_black,c_black)
		draw_roundrect_colour(path_x_pos-8,txt_y-10,path_x_pos+58,txt_y+10,c_gray,c_gray,false)
		draw_text(path_x_pos,txt_y,"Path "+ string(b+1))
	}
}