#region save settings

if(global.save_settings)
{
	if(file_exists("settings.ini")) file_delete("settings.ini");
	ini_open("settings.ini");
	
	//VISUAL//
	ini_write_real("Visual","width",global.width);
	ini_write_real("Visual","height",global.height);
	ini_write_real("Visual","fullscreen",global.fullscren);
	ini_write_real("Visual","vsync",global.vsync);
	
	ini_close();
	global.save_settings = false;
}

#endregion