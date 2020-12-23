/// @description

global.playerAlive = false;
instance_destroy(other);
audio_play_sound(snd_dead, 0, 0);

// stop any step sound alarm
with(obj_playmanager)
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
	alarm_set(kAlarmGameOver,120);
}
