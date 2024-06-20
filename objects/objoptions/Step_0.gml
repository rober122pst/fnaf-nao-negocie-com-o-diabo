selected = keyboard_check_pressed(vk_enter);
right = keyboard_check_pressed(vk_right);
left = keyboard_check_pressed(vk_left);
move = right-left;
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
if(global.options)
{
	if(selected)
	{
		if(button_select >= 4)
		{
			button_select = 3;
			button_option = "AUDIO"
		}else if(button_select == 3)
		{
			button_select =4;
			button_option = "VISUAL"
		}
		else if(button_select == 2)
		{
			button_option = "CONTROLS";
		}
		else if(button_select == 1)
		{
			button_option = "LANGUAGE";
		}
		else if(button_select <= 0)
		{
			global.save_settings = true;
			if(!instance_exists(objMenu) && room == menuRoom)
			{
				with(instance_create_layer(x,y,"Instances",objMenu))
				{
					other.button_select = 1;
				}
				instance_destroy();
			}
			global.options = false;
		}
		global.options = false;
	}
}else
{
	#region selected

	if(button_option == "AUDIO")
	{
		button_text = ["MASTER VOLUME:", "SFX VOLUME:", "MUSIC VOLUME:", "BACK"];
		/*if(button_select >= 3)
		{
			color_button = [c_black, c_gray, c_gray, c_gray];
		}
		else if(button_select == 2)
		{
			color_button = [c_gray, c_black, c_gray, c_gray];
		}
		else if(button_select == 1)
		{
			color_button = [c_gray, c_gray, c_black, c_gray];
		}
		else if(button_select == 0)
		{
			color_button = [c_gray, c_gray, c_gray, c_black];
		}*/
	
		if(selected)
		{
			if(button_select >= 3)
			{
			
			}else if(button_select == 2)
			{
			
			}
			else if(button_select == 1)
			{
			
			}
			else if(button_select <= 0)
			{
				button_option = 0;
				button_select = 4;
				button_text = button_options;
				global.options = true;
			}
		}
	}
	else if(button_option == "VISUAL")
	{
		video_text[0] = string(global.width)+"x"+string(global.height);
		button_text = ["RESOLUTION:", "DISPLAY:", "VSYNC:", "BRIGHTNESS:", "BACK"];
		if(button_select >= 4)
		{
			if(move != 0)
			{
				if(resolution >= 0 && resolution <= 5)
				{
					resolution+=move;
					if(resolution < 0)
					{
						resolution = 5;
					}
					if(resolution > 5)
					{
						resolution = 0;
					}
				}
			}
			window_center();
			global.height = HD[resolution];
			global.width = global.height*(1280/720);
			window_set_size(global.width,global.height);
			surface_resize(application_surface,global.width,global.height);
		}
		else if(button_select == 3)
		{
			if(move != 0){
				if(!window_get_fullscreen())
				{
					global.fullscren = true;
					video_text[1] = "FULLSCREEN"
					window_set_fullscreen(true);
				}else {
					global.fullscren = false;
					video_text[1] = "WINDOW"
					window_set_fullscreen(false);	
				}
			}
		}
		else if(button_select == 2)
		{
			if(move != 0) {
				if(!global.vsync) {
					video_text[2] = "ON";
					display_reset(0, true);
					global.vsync = true;
				}else {
					video_text[2] = "OFF";
					display_reset(0, false);
					global.vsync = false;
				}
			}
		}
		else if(button_select == 1)
		{
		}
		else if(button_select == 0)
		{
		}
	
		if(selected)
		{
			if(button_select <= 0)
			{
				button_option = 0;
				button_select = 4;
				button_text = button_options;
				global.options = true;
			}
		}
	}

	#endregion
}

