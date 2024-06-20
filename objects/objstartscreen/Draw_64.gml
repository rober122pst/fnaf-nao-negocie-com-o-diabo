var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_font(fntMenu);
draw_set_alpha(alpha);
draw_text(gui_width/2,gui_height-100,"PRESS ANY KEY")
draw_set_alpha(1);
draw_set_halign(-1);
draw_set_valign(-1);
