if(!global.options)
{
	if(button_select >= 2)
	{
		color_button[0] = c_white;
		color_button[1] = c_gray;
		color_button[2] = c_gray;
	}
	else if(button_select == 1)
	{
		color_button[0] = c_gray;
		color_button[1] = c_white;
		color_button[2] = c_gray;
	}
	else if(button_select <= 0)
	{
		color_button[0] = c_gray;
		color_button[1] = c_gray;
		color_button[2] = c_white;
	}


	if(keyboard_check_pressed(vk_up))
	{
		if(button_select < 2)
		{
				button_select++;
		}else if(button_select >= 2){
			button_select = 0;	
		}
	}
	else if(keyboard_check_pressed(vk_down))
	{
		if(button_select > 0)
		{
				button_select--;
		}else if(button_select <= 2){
			button_select = 2;	
		}
	}
	
	if(keyboard_check_pressed(vk_enter))
	{
		if(button_select >= 2)
		{
			room_goto(Fase01);
		}else if(button_select == 1)
		{
			button_select = 2;
			global.options = true;
			if(!instance_exists(objOptions))
			{
				instance_create_layer(x,y,"Instances",objOptions);
			}
			instance_destroy();
		}else if(button_select <= 0)
		{
			game_end();
		}
	}
}