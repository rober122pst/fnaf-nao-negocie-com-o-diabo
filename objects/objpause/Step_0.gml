selected = keyboard_check_pressed(vk_enter);

if(keyboard_check_pressed(ord("P")))
{
	room_goto(global.roomfrom);
}

if(!global.options)
{
	if(keyboard_check_pressed(vk_up))
	{
		if(button_select < array_length(button_text)-1)
			{
				button_select++;
		}else if(button_select >= array_length(button_text)-1){
			button_select = 0;	
		}
	}
	else if(keyboard_check_pressed(vk_down))
	{
		if(button_select > 0)
		{
			button_select--;
		}else if(button_select <= array_length(button_text)-1){
			button_select = array_length(button_text)-1;	
		}
	}

	if(selected)
	{
		if(button_select >= 3)
		{
			room_goto(global.roomfrom);
		}else if(button_select == 2)
		{
			room_goto(global.roomfrom);
			global.restart_level = true;
		}
		else if(button_select == 1)
		{
			global.options = true;
		}
		else if(button_select <= 0)
		{
		
		}
	}
}