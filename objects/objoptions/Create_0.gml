color_button = [c_gray, c_gray, c_gray, c_black, c_gray];
button_options = ["AUDIO","VISUAL","CONTROLS","LANGUAGE","BACK"]
button_text = button_options;
button_select = array_length(button_text)-1;
video_text = [string(global.width)+"x"+string(global.height),"FULLSCREEN","ON"];
if(!window_get_fullscreen())
{
	video_text[1] = "WINDOW"
}else {
	video_text[1] = "FULLSCREEN"
}
if(global.vsync) {
	video_text[2] = "ON";
}else {
	video_text[2] = "OFF";
}
HD = [576,720,900,1080,1440,2160];
switch global.height{
	case HD[0]:
		resolution = 0; break;
	case HD[1]:
		resolution = 1; break;
	case HD[2]:
		resolution = 2; break;
	case HD[3]:
		resolution = 3; break;
	case HD[4]:
		resolution = 4; break;
	case HD[5]:
		resolution = 5; break;
}

button_option = 0;