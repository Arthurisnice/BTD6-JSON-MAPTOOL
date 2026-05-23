draw_set_colour(c_gray)

if path_controller.path_size[path_controller.selected] == my_size
{
	draw_set_colour(c_white)
}

draw_rectangle(x-sprite_width/2.1,y-sprite_height/2.1,x+sprite_width/2.1,y+sprite_height/2.1,false)
draw_set_colour(c_white)

draw_self()

if my_size==2
{
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	draw_text(x,y-sprite_height,"Path Thiccness")
}
