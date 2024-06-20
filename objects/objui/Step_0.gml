if(power_attack >= 50)
{
	power_attack = 0;
}
index_power = int64(power_attack/5);

if(player.life <= 1)
{
	index_life = 1;
}else {
	index_life = 0;	
}

if(power_1 || power_2 || power_3 || power_4)
{
	power_ = true;
}

if(global.game_over)
{
	your_dead = true;
	if(your_dead = true && your_dead_timer > 0)
	{
		your_dead_timer--;
	}
	if(your_dead_timer <= 0)
	{
		your_dead_alpha-=.05;
	}
	if(your_dead_alpha <= 0)
	{
		journal_dead = true;
		journal_dead_alpha+=0.05;
	}
	if(journal_dead)
	{
		if(keyboard_check_pressed(vk_down))
		{
			if(count_menu_death > 0)
			{
					count_menu_death--;
			}else if(count_menu_death <= 0){
				count_menu_death = 2;	
			}
		}else if(keyboard_check_pressed(vk_up))
		{
			if(count_menu_death < 2)
			{
					count_menu_death++;
			}else if(count_menu_death >= 2){
				count_menu_death = 0;	
			}
		}
		if(keyboard_check_pressed(vk_enter))
		{
			if(count_menu_death >= 2)
			{
				room_restart();
			}else if(count_menu_death == 1)
			{
			
			}else if(count_menu_death == 0)
			{
				room_goto(startRoom);
			}
		}
	}
}