var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();
draw_set_font(fntGameOver);
if(global.options)
{
	draw_sprite_ext(sprPause,0,gui_width/2,gui_height/2,gui_width/(gui_width/2),gui_width/(gui_width/2),0,-1,1)
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(1);
	for(var i = 0; i <= array_length(button_text)-1; i++)
	{
		color_button = button_select == (array_length(button_text)-1)-i ? c_black : c_gray
		draw_set_color(color_button);
		draw_text(gui_width/2,(gui_height/2-90)+(36*i),button_text[i]);
	}
	
}

#region selected

if(button_option == "AUDIO")
{
	draw_set_halign(fa_right);
	draw_sprite_ext(sprOptions,0,gui_width/2,gui_height/2,gui_width/(gui_width/2),gui_width/(gui_width/2),0,-1,1)
	for(var i = 0; i <= array_length(button_text)-1; i++)
	{
		color_button = button_select == (array_length(button_text)-1)-i ? c_black : c_gray
		draw_set_color(color_button);
		if(i < array_length(button_text)-1)
		{
			draw_text(gui_width/2+56,(gui_height/2-120)+(36*i),button_text[i]);
		}
		else 
		{
			draw_set_halign(fa_center);
			draw_text(gui_width/2,(gui_height/2),button_text[i]);	
		}
	}
	
}
else if(button_option == "VISUAL")
{
	draw_sprite_ext(sprOptions,0,gui_width/2,gui_height/2,gui_width/(gui_width/2),gui_width/(gui_width/2),0,-1,1)
	for(var i = 0; i <= array_length(button_text)-1; i++)
	{
		for(var o = 0; o <= array_length(video_text)-1; o++)
		{
			color_button = button_select == (array_length(button_text)-1)-o ? c_black : c_gray
			draw_set_color(color_button);
			draw_set_halign(fa_left);
			draw_text(gui_width/2+5,(gui_height/2-120)+(36*o),video_text[o]);
		}
		color_button = button_select == (array_length(button_text)-1)-i ? c_black : c_gray
		draw_set_color(color_button);
		if(i < array_length(button_text)-1)
		{
			draw_set_halign(fa_right);
			draw_text(gui_width/2,(gui_height/2-120)+(36*i),button_text[i]);
		}
		else 
		{
			draw_set_halign(fa_center);
			draw_text(gui_width/2,(gui_height/2-120)+(36*i)+20,button_text[i]);	
		}
		
	}
}

#endregion