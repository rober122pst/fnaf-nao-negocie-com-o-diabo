if(aparou)
{
	if(bbox_bottom > other.bbox_top)
	{
		vely = 0;
		vely -= 9;
		instance_destroy(other);
		aparou = false;
		aparada_key = false;
	}else
	{
		if(!invecible){
			dammage = true;
			aparou = false;
		}
	}
}else{
	if(!invecible){
		dammage = true;
		aparou = false;
	}
}