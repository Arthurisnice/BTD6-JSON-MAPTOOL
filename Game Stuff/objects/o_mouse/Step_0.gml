x=mouse_x
y=mouse_y

if mouse_check_button(mb_left) {image_index=1}
else {image_index=0}

if keyboard_check_pressed(vk_anykey) or mouse_check_button_pressed(mb_any)
{
	if instance_exists(Load_result) {instance_destroy(Load_result)}
}