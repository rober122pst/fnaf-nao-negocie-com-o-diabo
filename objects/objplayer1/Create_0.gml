while(!place_meeting(x,y+1,objCollision))
{
	y++;
}
game_over = false;

life = 5;

shoot_bool = true;
ex_shoot_bool = false;

spd = 3;
vely = 0;
velx = 0;

aparou = false;
aparada_key = false;

sprite_dammager = false;
sprite_dammager_timer = 12;
invecible = false;
invencible_timer = room_speed*2;
timer_invencible = invencible_timer;
dammage = false;

dash_vel = 5;
dash_timming = 0;
dash_cd = 0;
dash_max_cd = (room_speed/4)+5;
dash_bool = false;
dash_perm = true;

massa = 2;

GRAVIDADE = .3;

