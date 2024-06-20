#region COMANDOS
right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);
jump = keyboard_check_pressed(ord("Z"));
stop = keyboard_check(ord("C"));
#endregion

var collison = place_meeting(x,y+1,objCollision);
var plataforma = place_meeting(x,y+1,objPlataform);
chao = collison + plataforma;

if(!global.game_over || sprite_dammager)
{
	#region move
	var move = right - left;
	if(!stop) velx = move * spd else velx = 0;
	vely += GRAVIDADE*massa;
	while(place_meeting(x,y,objCollision)){
		if(image_xscale = 1){
			x--;
		}else {x++}
		y--;
	}
	
	if (place_meeting(x+velx,y,objCollision))
	{
		while(!place_meeting(x+sign(velx),y,objCollision))
		{
			x+=sign(velx);
		}
		velx = 0;
	}
	if (place_meeting(x,y+vely,objCollision))
	{
		while(!place_meeting(x,y+sign(vely),objCollision))
		{
			y+=sign(vely);
		}
		vely = 0;
	}

	if(!place_free(x,y+vely))
	{
		while(!place_meeting(x,y+sign(vely),objPlataform))
		{
			y+=sign(vely);
		}
		vely = 0;
	}

	if(move != 0) image_xscale = sign(move)

	//PULO
	if(jump && down && objPlataform.descer)
	{
		y++;
	}else
	{
		if(chao && jump)
		{
			vely -= 10;
		}
	}
	if(keyboard_check_released(ord("Z")))
	{
		aparada_key = true;
	}
	if(!chao)
	{
		if(aparada_key)
		{
			jump = keyboard_check(ord("Z"));
			if(jump)
			{
				aparou = true;
			}else
			{
				aparou = false;	
			}
		}
	}else
	{
		jump = keyboard_check_pressed(ord("Z"));
		aparou = false;
		aparada_key = false;
	}

	#endregion

	#region sprites
	if(down and chao and !stop) 
	{
		if(sprite_index != sprFreddyDown)
		{
			spd = 0;
			sprite_index = sprFreddyDownIni;
			if(sprite_index = sprFreddyDownIni && image_index >= 1)
			{
				sprite_index = sprFreddyDown;		
			}
		}
		mask_index = sprMaskDown;
	}
	else if(vely != 0)
	{
		sprite_index = sprFreddyJump;
		mask_index = sprMask;
	}
	else if(velx == 0)
	{
		if(sprite_index != sprFreddyIdle)
		{
			sprite_index = sprFreddyIdle;
		}		
	mask_index = sprMask;
	}else if(velx != 0)
	{
		sprite_index = sprFreddyRun;

		mask_index = sprMask;
	}
	
	if(!down){
		spd = 2;
	}
	#endregion

	#region dammage
	if(invecible && timer_invencible > 0)
	{
		timer_invencible--;
		image_alpha = max(sin(get_timer()/90000),0.3);
	}else
	{
		image_alpha = 1;
	}

	if(timer_invencible <= 0)
	{
		invecible = false;
	}

	if(sprite_dammager)
	{
		spd = 0;
		shoot_bool = false;
		sprite_dammager_timer--;
		sprite_index = sprFreddyDammage;
		if(sprite_dammager_timer <= 0)
		{
			sprite_dammager = false;
			sprite_dammager_timer = 12;
			shoot_bool = true;
		}
	}

	if(place_meeting(x,y,objEnemy) && !invecible)
	{
		dammage = true;
	}
	if(dammage)
	{
		life--;
		invecible = true;
		sprite_dammager = true;
		timer_invencible = invencible_timer;
		dammage = false;
	}

	#endregion
}else {
	sprite_index = sprFreddyDeath;
	if(image_index >= 2)
	{
		image_speed = 0;
		if(!instance_exists(objFreddyGhost))
		{
			instance_create_layer(x,y,"Instances",objFreddyGhost);
			exit;
		}
	}
	velx = 0;
	vely = 0;
}
if(life <= 0)
{
	room_restart();
}

#region GAME WIN

if(GAME_WIN){
	spd = 0;
	x+=1;
	right = 0;
	left = 0;
	jump = 0;
	up = 0;
	down = 0;
	stop = 0;
	sprite_index = sprFreddyRun;
	image_xscale = 1;
}

#endregion GAME WIN