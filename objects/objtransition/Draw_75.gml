draw_set_color(c_black);
draw_rectangle(0,0,display_get_gui_width(),yy,false);
draw_rectangle(0,yy1,display_get_gui_width(),view_hport[0],false);

if(transition_begin){
	yy-=vel;
	yy1-=vel*-1;
	if(yy <= 0 && yy1 >= view_hport[0]){
		transition_begin = false;
	}
}

if(transition_end){
	yy+=vel;
	yy1+=vel*-1;
	if(yy >= view_hport[0]/2+20 && yy1 <= view_hport[0]/2-20){
		transition_end = false;
		room_goto_next();
	}
}