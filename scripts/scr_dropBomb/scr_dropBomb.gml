function scr_dropBomb() {
	with(obj_playmanager)
	{
		// which columns have baddies in them
		var columnList = ds_list_create();
		for(var iCol=0 ; iCol<11 ; iCol++)
		{
			var occupied = false;
			for( var iRow=0 ; iRow<5 ; iRow++)
			{
				if(ds_list_find_value(baddieOccupancyList, (iRow*11) + iCol))
				{
					occupied = true;
				}
			}
			if(occupied)
			{
				ds_list_add(columnList, iCol);
			}
		}
		if(ds_list_size(columnList) > 0)
		{
			var chosenColumn = ds_list_find_value(columnList, irandom_range(0, ds_list_size(columnList)-1));
			var xpos = kBaddieStartX + baddieColumnXPos + (kBaddieStartXStep * chosenColumn);
			var ypos = baddieColumnYPos + kBaddieStartY - (baddieBombSpawnRow[|chosenColumn] * kBaddieStartYStep);
	 		instance_create_layer(xpos, ypos, "Instances", obj_bomb);
		}
		
		bombAvailable = false;
	}


}
