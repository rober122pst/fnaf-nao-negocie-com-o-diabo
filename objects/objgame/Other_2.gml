if(file_exists("settings.ini"))
{
	ini_open("settings.ini");
	
	//VISUAL//
	global.width = ini_read_real("Visual","width",1280);
	global.height = ini_read_real("Visual","height",720);
	global.fullscren = ini_read_real("Visual","fullscreen",false);
	global.vsync = ini_read_real("Visual","vsync",false);
	
	ini_close();
}
/*view_wport[0] = global.width;
view_hport[0] = global.height;*/

surface_resize(application_surface,global.width,global.height);
window_set_size(global.width,global.height);
if(global.fullscren) window_set_fullscreen(true);
else window_set_fullscreen(false);
if(global.vsync) display_reset(0,true);
else display_reset(0,false);