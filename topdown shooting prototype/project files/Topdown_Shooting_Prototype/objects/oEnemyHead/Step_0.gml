x = body_id.x;
y = body_id.y;

gun_current = body_id.gun_current;

#region Hedef Alma Yeteneği (Zeka)
if (predictMovement)
{
	var dis = point_distance(gun_x, gun_y, oPlayer.x, oPlayer.y);

	var a = 0;
	if ((oPlayer.hsp != 0) && (oPlayer.vsp != 0)) a = 6;

	if (sign(oPlayer.x - oPlayer.old_x) == sign(oPlayer.x - gun_x)) divby_x = dis / (13 - a);
	else divby_x = dis / (15.2 - a);
	
	if (sign(oPlayer.y - oPlayer.old_y) == sign(oPlayer.y - gun_y)) divby_y = dis / (13 - a);
	else divby_y = dis / (15.2 - a);

	look_x = lerp(look_x, oPlayer.x + lengthdir_x(abs(oPlayer.hsp) * (divby_x), oPlayer.move_dir), 0.2);
	look_y = lerp(look_y, oPlayer.y + lengthdir_y(abs(oPlayer.vsp) * (divby_y), oPlayer.move_dir), 0.2);

	var min_look_x = min(look_x, oPlayer.x + lengthdir_x(abs(oPlayer.hsp) * (divby_x), oPlayer.move_dir));
	var min_look_y = min(look_y, oPlayer.y + lengthdir_y(abs(oPlayer.vsp) * (divby_y), oPlayer.move_dir));
	var max_look_x = max(look_x, oPlayer.x + lengthdir_x(abs(oPlayer.hsp) * (divby_x), oPlayer.move_dir));
	var max_look_y = max(look_y, oPlayer.y + lengthdir_y(abs(oPlayer.vsp) * (divby_y), oPlayer.move_dir));

	look_x = clamp(look_x, min_look_x, max_look_x);
	look_y= clamp(look_y, min_look_y, max_look_y);
}
else
{
	look_x = oPlayer.x;
	look_y = oPlayer.y;
}
#endregion

 #region Animasyon

/*
image_speed = 1;
if (body_id.vsp == 0 && body_id.hsp == 0)
{
	image_speed = 0;
	image_index = 0;
}
else
{
	image_speed = 1;
}
*/

image_speed = body_id.move_dis / 4;
if (!body_id.move_dis) image_index = 0;

 #endregion

#region Yerden Eşya Alma
/*
var interact_item_id = instance_place(x, y, oPickGun);
if (interact_item_id != noone) && (global.key_interact)
{
	gun_current = interact_item_id.gun_type;
	instance_destroy(interact_item_id);
}
*/
#endregion

#region Elde Eşya Tutma

if ((gun_timer != 0) && (gun_timer < 15)) gun_timer ++;
else gun_timer = 0;

switch(gun_current)
{
	case 0: 
	{
		sprite_index = sEnemy;
		
		gun_x = x;
		gun_y = y;
		
		break;
	}
	case "pistol":
	{
		sprite_index = sEnemyPistol;
		
		gun_x = x + lengthdir_x(30, image_angle + 65);
		gun_y = y + lengthdir_y(30, image_angle + 65);
		
		if (!gun_timer) && (player_on_sight)
		{
			var blt = instance_create_layer(gun_x, gun_y, "Player", oBullet); 
			shoot_dir = point_direction(gun_x, gun_y, look_x, look_y) - 90;
			if (predictMovement) blt.dir = shoot_dir;
			else blt.dir = random_range(shoot_dir - 5, shoot_dir + 5);
			blt.type = 2;
			gun_timer = 1;
			blt.shooter = id;
		}
		break;
	}
}
#endregion

#region Bakış Yönü
//image_angle = point_direction(x, y, look_x, look_y) - 90;

//if (instance_exists(oPlayer)) && (collision_rectangle(x + lengthdir_x(sight_dis, image_angle + 150), y + lengthdir_y(sight_dis, image_angle + 150), x + lengthdir_x(sight_dis, image_angle + 30), y + lengthdir_y(sight_dis, image_angle + 30), oPlayer, 0, 0))

if (instance_exists(oPlayer))
{
	sight_wall_check_list = ds_list_create();
	collision_line_list(gun_x, gun_y, oPlayerHead.x, oPlayerHead.y, all, 1, 1, sight_wall_check_list, 1);
	with (ds_list_find_value(sight_wall_check_list, 0)) other.wall_check_obj = object_get_name(object_index);

	while ((wall_check_obj != "oWall") && (object_get_parent(asset_get_index(wall_check_obj)) != oWall)) && (wall_check_obj != "oPlayer")
	{
		ds_list_delete(sight_wall_check_list, 0);
		with (ds_list_find_value(sight_wall_check_list, 0)) other.wall_check_obj = object_get_name(object_index);
	}
	ds_list_destroy(sight_wall_check_list);
}
/*
if (wall_check_obj == "oEnemy") 
{
	ds_list_delete(sight_wall_check_list, 0);
	with (ds_list_find_value(sight_wall_check_list, 0)) other.wall_check_obj = object_get_name(object_index);
}
*/

if (instance_exists(oPlayer)) && (wall_check_obj != "oWall") && (object_get_parent(asset_get_index(wall_check_obj)) != oWall)
{
	if (rectangle_in_triangle(oPlayerHead.x - (oPlayerHead.sprite_width / 4), oPlayerHead.y - (oPlayerHead.sprite_height / 3), oPlayerHead.x + (oPlayerHead.sprite_width / 4), oPlayerHead.y + (oPlayerHead.sprite_height / 3), x, y, x + lengthdir_x(sight_dis, image_angle + 120), y + lengthdir_y(sight_dis, image_angle + 120), x + lengthdir_x(sight_dis, image_angle + 60), y + lengthdir_y(sight_dis, image_angle + 60)) != 0) || (rectangle_in_triangle(oPlayerHead.x - (oPlayerHead.sprite_width / 4), oPlayerHead.y - (oPlayerHead.sprite_height / 3), oPlayerHead.x + (oPlayerHead.sprite_width / 4), oPlayerHead.y + (oPlayerHead.sprite_height / 3), x + lengthdir_x(sight_dis * 1, image_angle + 90), y + lengthdir_y(sight_dis * 1, image_angle + 90), x + lengthdir_x(sight_dis, image_angle + 120), y + lengthdir_y(sight_dis, image_angle + 120), x + lengthdir_x(sight_dis, image_angle + 60), y + lengthdir_y(sight_dis, image_angle + 60)) != 0)
	{
		player_on_sight = true;
		if (((point_direction(x, y, look_x, look_y) - 90) -  image_angle) < -100) image_angle = point_direction(x, y, look_x, look_y) - 90;
		else if (((point_direction(x, y, look_x, look_y) - 90) -  image_angle) > 100) image_angle = point_direction(x, y, look_x, look_y) - 90;
		else image_angle = lerp(image_angle, point_direction(x, y, look_x, look_y) - 90, 0.4);
	}
	else player_on_sight = false;
}
else player_on_sight = false;

if (body_id.path_index != -1) 
{
	oEnemy.onPath = true;
	
	//image_angle = body_id.move_dir - 90;
	
	if (((body_id.move_dir - 90) -  image_angle) < -100) image_angle = body_id.move_dir - 90;
	else if (((body_id.move_dir - 90) -  image_angle) > 100) image_angle = body_id.move_dir - 90;
	else image_angle = lerp(image_angle, body_id.move_dir - 90, 0.2);
}
else oEnemy.onPath = false; 

#endregion

#region Ölüm Kalım
if (hp <= 0)
{
	instance_destroy(body_id);
	instance_destroy();
}
#endregion