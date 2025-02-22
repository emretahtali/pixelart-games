x = oPlayer.x;
y = oPlayer.y;

#region Animasyon
image_speed = 1;
if (oPlayer.vsp == 0 && oPlayer.hsp == 0)
{
	image_speed = 0;
	image_index = 0;
}
else
{
	if (oPlayer.walksp = 1.5) image_speed = .4;
	else image_speed = 1;
}

//Bakış Yönü
image_angle = point_direction(x,y,mouse_x,mouse_y) - 90;
#endregion

#region Yerden Eşya Alma

var interact_item_id = instance_place(x, y, oPickGun);
if (interact_item_id != noone) && (global.key_interact)
{
	gun_current = interact_item_id.gun_type;
	instance_destroy(interact_item_id);
}
#endregion

#region Elde Eşya Tutma

if ((gun_timer != 0) && (gun_timer < 15)) gun_timer ++;
else gun_timer = 0;

switch(gun_current)
{
	case 0: sprite_index = sPlayer; break;
	case "pistol":
	{
		sprite_index = sPlayerPistol;
		if (global.key_shoot)
		{
			if (!gun_timer)
			{
				var blt = instance_create_layer(x + lengthdir_x(30, image_angle + 65), y + lengthdir_y(30, image_angle + 65), "Player", oBullet); 
				blt.dir = random_range(image_angle - 3, image_angle + 3);
				blt.type = 1;
				ScreenShake(5, 10);
				gun_timer = 1;
				blt.shooter = id;
			}
		}
		break;
	}
}
#endregion

#region Ölüm Kalım
if (hp <= 0) room_restart();


#endregion