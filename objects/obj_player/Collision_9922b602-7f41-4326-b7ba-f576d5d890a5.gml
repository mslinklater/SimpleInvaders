/// @description

global.playerAlive = false;
instance_destroy(other);

// stop any step sound alarm
with(obj_gamemaster)
{
	alarm_set(kStepSoundAlarm, -1);
}

// player dead stuff
lives--;

if(lives > 0)
{
	alarm_set(kAlarmRevive,120);
}
else
{
	// proper dead...
	scr_endgame();
}
