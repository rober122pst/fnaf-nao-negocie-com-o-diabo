#region COMANDOS
right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);
jump = keyboard_check_pressed(ord("Z"));
dash = keyboard_check_pressed(vk_lshift);
shoot = keyboard_check(ord("X"));
stop = keyboard_check(ord("C"));
ex_shoot = keyboard_check_pressed(ord("V"));
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
			dash_perm = true;
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

	#region dash

	if(dash and !dash_bool and dash_perm && !stop && !down)
	{
		dash_bool = true;
		dash_perm = false;
		dash_timming = room_speed/4;
	}
	if(dash_bool)
	{
		if(!place_meeting(x+dash_vel*image_xscale,y,objCollision)) {
			x+=dash_vel*image_xscale;
		}
		vely = 0;
		spd = 0;
		dash_cd = 0;
		dash_timming--;
		if(dash_timming <= 0)
		{
			dash_bool = false;
		}
	}
	else
	{
		spd = 3;
		if(chao)
		{
			dash_cd++;
			if(dash_cd >= dash_max_cd){
				dash_perm = true;
			}
		}
	}
	#endregion

	#region shoot
	_xx = x + lengthdir_x(1, image_angle);

	if (shoot && shoot_bool)
	{
		if(!dash_bool)
		{
			shoot_bool = false;
			alarm[0] = 6;
		}
	}

	//Especial
	if(objUI.power_ && ex_shoot && !ex_shoot_bool)
	{
		show_debug_message("here");
		if(!objUI.power_0)
		{
			if(objUI.power_4)
			{
				objUI.power_4 = false; objUI.power_3 = true;
			}else if(objUI.power_3)
			{
				objUI.power_3 = false; objUI.power_2 = true;	
			}else if(objUI.power_2)
			{
				objUI.power_2 = false; objUI.power_1 = true;	
			}else if(objUI.power_1) 
			{
				objUI.power_1 = false; objUI.power_0 = true;	
			}else
			{
				objUI.power_4 = true;	
			}
			ex_shoot_bool = true;
			shoot_bool = false;
		}	
	}

	if(ex_shoot_bool)
	{
		with(instance_create_layer(_xx,y-32,"Bullets",objExtShoot))
		{
			speed = 15;
			direction = -90 + 90 * other.image_xscale;
			image_angle = direction;
		}
		shoot_bool = true;
		ex_shoot_bool = false;
	}
	#endregion

	#region sprites
	if(down and chao and !stop) 
	{
		spd = 0;
		if(sprite_index != sprFreddyDown)
		{
			sprite_index = sprFreddyDownIni;
			if(sprite_index = sprFreddyDownIni && image_index >= 1)
			{
				sprite_index = sprFreddyDown;
			}
		}
		mask_index = sprMaskDown;
	}
	else if(dash_bool)
	{
		sprite_index = sprFreddyDash;
		mask_index = sprMaskDown;
	}
	else if(vely != 0)
	{
		sprite_index = sprFreddyJump;
		mask_index = sprMask;
	}
	else if(velx == 0)
	{
		if(shoot)
		{
			sprite_index = sprFreddyShoot;
		}else
		{
			if(sprite_index != sprFreddyIdle)
			{
				sprite_index = sprFreddyIdle;
			}
		}
		mask_index = sprMask;
	}else if(velx != 0)
	{
		if(shoot)
		{
			sprite_index = sprFreddyRunShoot;
		}else
		{
			sprite_index = sprFreddyRun;
		}
		mask_index = sprMask;
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
		vely=0;
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
	global.game_over = true;
}