
alpha = sign(sin(get_timer()/200000))*-1;

if(keyboard_check_pressed(vk_anykey))
{
	room_goto(menuRoom);
}