draw_self()
if activate==true
{
	draw_set_valign(fa_top)
	draw_set_halign(fa_center)
	draw_set_font(font_smll)
	draw_text(x-sprite_width*3,y-sprite_height*1.2,"Press Esc to exti and enter to continue.\nUse arrow keys to go up or down a number.\nHold Shift for 10x and press backspace to restart.")
	if keyboard_check_pressed(vk_escape) {activate=false;}
	if keyboard_check_pressed(vk_enter) && act_stt==3 {act_stt++; save_change()}
	else if keyboard_check_pressed(vk_enter) {act_stt++}
	
	if keyboard_check_pressed(vk_backspace) {act_stt=0}
	
	if act_stt>4 {act_stt=0}
	
	second_number=clamp(second_number,1,100)
	first_number=clamp(first_number,1,100)
	
	
	switch(act_stt)
	{
		case 1:
			if keyboard_check(vk_shift) {held=10}
			else {held=1}
		
			if first_number>1 && keyboard_check_pressed(vk_down) {first_number-=held}
			if first_number<100 && keyboard_check_pressed(vk_up) {first_number+=held}
			
			draw_text(x,y-sprite_height,"from "+string(first_number))
			
			
			
			break;
			
		case 2:
			if keyboard_check(vk_shift) {held=10}
			else {held=1}
		
			if second_number>0 && keyboard_check_pressed(vk_down) {second_number-=held}
			if second_number<100 && keyboard_check_pressed(vk_up) {second_number+=held}
			
			draw_text(x,y-sprite_height,"from "+string(first_number)+"\nto "+string(second_number))
			
			break;
		case 3:
					if keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_down)
					{
						if act==false {act=true}
						else if act==true {act=false}
					}
					
					var formated_txt = act==true? "true":"false";
						
					draw_text(x,y-sprite_height,"from "+string(first_number)+"\nto "+string(second_number) + "\nas "+formated_txt)
			break;
		case 4:
		
			var formated_txt_ = act==true? "true":"false";
			draw_text(x,y-sprite_height,"All done!")
			var slc = path_controller.selected
			
				for(i=first_number;i<second_number;i++)
				{
					path_controller.path_arr[slc][i]=act
				}
				
			break;
	}
}