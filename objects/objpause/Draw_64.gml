var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

display_set_gui_size(global.width,global.height);
draw_sprite(global.ret,0,0,0)
draw_set_alpha(.5);
draw_set_color(c_black)
draw_rectangle(0,0,gui_width,gui_height,0)
draw_set_alpha(1);
display_set_gui_size(1280,720);
draw_set_font(fntGameOver);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_sprite_ext(sprPause,0,gui_width/2,gui_height/2,gui_width/(gui_width/2),gui_width/(gui_width/2),0,-1,1)
	for(var i = 0; i < array_length(button_text); i++)
	{
		button_color = button_select == (array_length(button_text)-1)-i ? c_black : c_gray;
		draw_set_color(button_color);
		draw_text(gui_width/2,(gui_height/2-65)+(36*i),button_text[i]);
	}
	

draw_set_halign(-1);
draw_set_valign(-1);