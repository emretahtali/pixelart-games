ds_list_clear(wall_list);

for (var i = 0; i < instance_number(oWall); i++) ds_list_add(wall_list, instance_find(oWall,i));