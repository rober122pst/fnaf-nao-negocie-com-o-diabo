while(!place_meeting(x,y+1,objCollision))
{
	y++;
}

sprite_index = choose(sprChildrenLoiroPink0, sprChildrenLoiroPink01, sprChildrenLoiroPink02, sprChildrenLoiroRed0, sprChildrenLoiroRed01, sprChildrenLoiroRed02
, sprChildrenLoiroYellow0, sprChildrenLoiroYellow01, sprChildrenLoiroYellow02, sprChildrenMorenoPink0, sprChildrenMorenoPink01, sprChildrenMorenoPink02, sprChildrenMorenoPink03
, sprChildrenMorenoRed0, sprChildrenMorenoRed01, sprChildrenMorenoRed02, sprChildrenMorenoRed03, sprChildrenMorenoYellow0, sprChildrenMorenoYellow01, sprChildrenMorenoYellow02, sprChildrenMorenoYellow03);

teste = 0
vely = 0;
velx = choose(-1,1);
massa = 2;

GRAVIDADE = .3;