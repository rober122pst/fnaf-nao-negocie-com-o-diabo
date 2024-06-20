display_set_gui_size(view_wport[0],view_hport[0])


var wport = display_get_gui_width(), hport = display_get_gui_height();
#region hud
draw_sprite_ext(sprLife,index_life,20,hport-50,3,3,0,-1,1);

draw_set_color(c_black);
draw_set_font(fntLife);
draw_text(30,hport-45,"HP."+ string(player.life));
if(index_power < 10 and power_0)
{
	draw_sprite_ext(sprPizza,index_power,100,hport-20,1.2,1.2,0,-1,1);
	if(index_power == 9)
	{
		power_attack = 0;
		power_0 = false;
		power_1 = true;
	}
}else if(index_power < 10 and power_1) 
{
	draw_sprite_ext(sprPizza,index_power,125,hport-20,1.2,1.2,0,-1,1);
	draw_sprite_ext(sprPizza,9,100,hport-20,1.2,1.2,0,-1,1);
	if(index_power == 9)
	{
		power_attack = 0;
		power_1 = false;
		power_2 = true;
	}
}else if(index_power < 10 and power_2) 
{
	draw_sprite_ext(sprPizza,index_power,150,hport-20,1.2,1.2,0,-1,1);
	draw_sprite_ext(sprPizza,9,125,hport-20,1.2,1.2,0,-1,1);
	draw_sprite_ext(sprPizza,9,100,hport-20,1.2,1.2,0,-1,1);
	if(index_power == 9)
	{
		power_attack = 0;
		power_2 = false;
		power_3 = true;
	}
}else if(index_power < 10 and power_3) 
{
	draw_sprite_ext(sprPizza,index_power,175,hport-20,1.2,1.2,0,-1,1);
	draw_sprite_ext(sprPizza,9,150,hport-20,1.2,1.2,0,-1,1);
	draw_sprite_ext(sprPizza,9,125,hport-20,1.2,1.2,0,-1,1);
	draw_sprite_ext(sprPizza,9,100,hport-20,1.2,1.2,0,-1,1);
	if(index_power == 9)
	{
		power_attack = 0;
		power_3 = false;
		power_4 = true;
	}
}else if(index_power < 10 and power_4) 
{
	draw_sprite_ext(sprPizza,index_power,200,hport-20,1.2,1.2,0,-1,1);
	draw_sprite_ext(sprPizza,9,175,hport-20,1.2,1.2,0,-1,1);
	draw_sprite_ext(sprPizza,9,150,hport-20,1.2,1.2,0,-1,1);
	draw_sprite_ext(sprPizza,9,125,hport-20,1.2,1.2,0,-1,1);
	draw_sprite_ext(sprPizza,9,100,hport-20,1.2,1.2,0,-1,1);
	if(index_power == 9)
	{
		power_attack = 0;
		power_4 = false;
	}
}else {
	power_ = true;
	power_attack = 0;
	draw_sprite_ext(sprPizza,9,200,hport-20,1.2,1.2,0,-1,1);
	draw_sprite_ext(sprPizza,9,175,hport-20,1.2,1.2,0,-1,1);
	draw_sprite_ext(sprPizza,9,150,hport-20,1.2,1.2,0,-1,1);
	draw_sprite_ext(sprPizza,9,125,hport-20,1.2,1.2,0,-1,1);
	draw_sprite_ext(sprPizza,9,100,hport-20,1.2,1.2,0,-1,1);
}
#endregion

#region gameover
if(global.game_over)
{
	if(journal_dead)
	{
		var xx, yy;
		var distance = ((objFinnishLevel.x)-(objFinnishLevel.x - player.x));
		xx = 460+(distance/(objFinnishLevel.x/355));
		xx_+=vel;
		vel+=.05;
		if(xx_ >= xx)
		{
			xx_ = xx;
		}
		yy = hport/2;
		draw_set_alpha(.5)
		draw_rectangle(0,0,wport,hport,0);
		draw_set_alpha(journal_dead_alpha);
		draw_sprite_ext(sprGameOver,0,wport/2,hport/2,wport/(wport/2),wport/(wport/2),0,-1,1)
		for(var i = 0; i < 15; i++){
			if(i >= 15){
				index++;
			}
			draw_sprite(sprFreddyGameOver,index,xx_,yy)
		}
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		if(count_menu_death == 2)
		{
			draw_set_color(c_black);
			draw_set_font(fntGameOver);
			draw_text(wport/2,hport/2+96,"Restart");
			draw_set_color(c_gray);
			draw_text(wport/2,hport/2+160,"Back to map");
			draw_text(wport/2,hport/2+224,"Quit");
		}else if(count_menu_death == 1)
		{
			draw_set_color(c_black);
			draw_set_font(fntGameOver);
			draw_text(wport/2,hport/2+160,"Back to map");
			draw_set_color(c_gray);
			draw_text(wport/2,hport/2+96,"Restart");
			draw_text(wport/2,hport/2+224,"Quit");
		}else if(count_menu_death == 0)
		{
			draw_set_color(c_black);
			draw_set_font(fntGameOver);
			draw_text(wport/2,hport/2+224,"Quit");
			draw_set_color(c_gray);
			draw_text(wport/2,hport/2+96,"Restart");
			draw_text(wport/2,hport/2+160,"Back to map");
		}
		draw_set_color(c_black);
		draw_set_halign(-1);
		draw_set_valign(-1);
		draw_set_alpha(1);
	}else if(your_dead)
	{
		draw_set_alpha(.5)
		draw_rectangle(0,0,wport,hport,0);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(your_dead_alpha);
		draw_set_color(c_white);
		draw_set_font(fntDead);
		draw_text(wport/2,hport/2,"YOU DEAD")
		draw_set_halign(-1);
		draw_set_valign(-1);
		draw_set_alpha(1);
	}
}
#endregion
