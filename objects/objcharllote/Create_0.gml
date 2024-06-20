while(!place_meeting(x,y+1,objCollision))
{
	y++;
}
game_over = false;

life = 5;

shoot_bool = true;
ex_shoot_bool = false;

spd = 2;
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

massa = 3;

GRAVIDADE = .3;

debug = false;

GAME_WIN = false;