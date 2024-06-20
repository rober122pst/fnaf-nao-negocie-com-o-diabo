var yy_ = random_range(y-38,y-26);
if(down && (!place_meeting(x,y+1,objCollision) && !place_meeting(x,y+1,objPlataform)))
{
	with(instance_create_layer(_xx,yy_,"Bullets",objShoot))
	{
		speed = 10;
		direction = -90;
		
	}	
}
else if(down && !stop)
{
	with(instance_create_layer(_xx,y-16,"Bullets",objShoot))
	{
		speed = 10;
		direction = -90 + 90 * other.image_xscale;
		
	}
}
else if(((down && right) || (down && left)) && stop)
{
	with(instance_create_layer(_xx,y-16,"Bullets",objShoot))
	{
		speed = 10;
		direction = -90 + 45 * other.image_xscale;
		
	}	
}
else if((down && stop))
{
	with(instance_create_layer(_xx,yy_,"Bullets",objShoot))
	{
		speed = 10;
		direction = -90;
		
	}		
}
else if((up && right) || (up && left))
{
	with(instance_create_layer(_xx,yy_,"Bullets",objShoot))
	{
		speed = 10;
		direction = 90 - 45 * other.image_xscale;
		
	}	
}
else if(!up)
{
	with(instance_create_layer(_xx,yy_,"Bullets",objShoot))
	{
		speed = 10;
		direction = -90 + 90 * other.image_xscale;
		
	}
}else if(up) 
{
	with(instance_create_layer(_xx,yy_,"Bullets",objShoot))
	{
		speed = 10;
		direction = 90;
		
	}
}
shoot_bool = true;