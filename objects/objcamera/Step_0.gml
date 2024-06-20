if not instance_exists(objCharllote)
{
	exit;	
}

x = target_.x;
y = lerp(y, target_.y-height_/4,0.6);
camera_set_view_pos(view_camera[0],x-width_/2,y-height_/2);