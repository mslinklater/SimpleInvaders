 /// @description Update the game
if((starCounter % 5) == 0)
{
	instance_create_layer(random_range(0, 240), 0, "Stars", obj_star);
}

if((currentPhase == kPhaseGame) && (global.playerAlive))
{
	var numBaddies = ds_list_size(baddieList);

	// Process clearing the grid of baddies
	if(numBaddies == 0)
	{
		currentPhase = kPhaseBuild;
		alarm[kBuildAlarm] = 5;
		baddieList = ds_list_create();
		numBaddiesBuilt = 0;
		baddieMovingDown = false;
		baddieRequestMoveDown = false;
		instance_destroy(obj_barrier);
		wave = clamp(wave++, 0, 10);
		alarm_set(kStepSoundAlarm, -1);
		return;
	}
	
	// update this frames baddie
	updatingBaddie = clamp(updatingBaddie, 0, ds_list_size(baddieList) - 1);
	
	with(baddieList[|updatingBaddie])
	{
		if(other.baddieMovingDown)
		{
			y += kBaddieYSpeed;
		}
		else
		{
			x += other.baddieDelta;
			image_index = 1 - image_index;
			
			if(x >= room_width - kBaddieXBorder)
			{
				other.baddieDirection = kDirectionLeft;
				other.baddieRequestMoveDown = true;
			}
			if(x <= kBaddieXBorder)
			{
				other.baddieDirection = kDirectionRight;
				other.baddieRequestMoveDown = true;
			}
		}
	}
	
	updatingBaddie++;
	
	// wrap back to updating the first baddie and do some processing
	if(updatingBaddie >= numBaddies)
	{		
		updatingBaddie = 0;
		baddieMovingDown = baddieRequestMoveDown;
		if(baddieMovingDown)	// move bomb drop down
		{
			baddieColumnYPos += kBaddieYSpeed;
		}
		baddieRequestMoveDown = false;
		if(baddieDirection == kDirectionRight)
		{
			baddieDelta = kBaddieXSpeed;
		}
		else
		{
			baddieDelta = -kBaddieXSpeed;
		}
		baddieColumnXPos += baddieDelta;
	}
	
	// Decide wether to drop bombs
	if(bombAvailable)
	{
		scr_dropBomb();
	}
}

// Game Over
if(currentPhase == kPhaseGameOver)
{
	if(keyboard_check(vk_space))
	{
		room_goto(rm_boot);
	}
}
