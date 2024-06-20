
if(keyboard_check_pressed(ord("P")) && !global.game_over)
{
	global.ret = sprite_create_from_surface(application_surface,0,0,global.width,global.height,false,true,0,0);

	global.roomfrom = room;
	room_persistent = true;
	room_goto(pauseRoom);
}
else 
{
	if(global.restart_level)
	{
		room_restart();
	}
	room_persistent = false;
}