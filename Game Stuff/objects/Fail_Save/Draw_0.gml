if image_alpha==1
{
	draw_self()

	var temp_txt = ""
	for (i=0; i<array_length(fail_array); i++)
	{
	
		temp_txt=temp_txt+"Round "+string(fail_array[i]+1)+"\n"
		
		
	}
	draw_set_font(font_smll)
	draw_set_colour(c_black)
	draw_text(x,y,temp_txt)
	draw_set_colour(c_white)
}