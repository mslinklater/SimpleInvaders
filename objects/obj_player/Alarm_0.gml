/// @description Revive

global.playerAlive = true;
image_index = 0;

with(obj_playmanager)
{
	alarm_set(kStepSoundAlarm, 1);
}