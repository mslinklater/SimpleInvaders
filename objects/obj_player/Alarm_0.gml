/// @description Revive

global.playerAlive = true;
image_index = 0;

with(obj_gamemaster)
{
	alarm_set(kStepSoundAlarm, 1);
}