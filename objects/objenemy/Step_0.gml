if(distance_to_object(global.Player) < 256){;	
	if(place_meeting(x+velx,y,objCollision)||!place_meeting(x+velx*2,y+1,objCollision))
	{
		velx*=-1;
	}

	image_xscale = sign(velx);

	vely += GRAVIDADE*massa;

	if (place_meeting(x,y+vely,objCollision))
	{
		while(!place_meeting(x,y+sign(vely),objCollision))
		{
			y+=sign(vely);
		}
		vely = 0;
	}
	
	
	x += velx
	y += vely;

}else {
	exit;
}

