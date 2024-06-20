if(other.image_index == 0)
{
	show_debug_message("here");
	if(jump)
	{
		vely = 0;
		vely -= 10;
		destroy_cakiou = true;
		instance_destroy(other);
	}
	
}else if(other.image_index == 1 && !invecible && !destroy_cakiou)
{
	show_debug_message("here1");
	dammage = true;
}