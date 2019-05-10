/// @description
instance_create_layer(random_range(0, 240), 0, "Stars", obj_star);

if(keyboard_check_pressed(vk_space))
{
	room_goto(rm_play);
}