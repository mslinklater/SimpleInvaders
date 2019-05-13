/// @description Play step sound

if(stepSound)
{
	audio_play_sound(snd_step1, 0, 0);
}
else
{
	audio_play_sound(snd_step2, 0, 0);
}
stepSound = !stepSound;

if(global.playerAlive)
{
	var numBaddies = ds_list_size(baddieList);
	alarm_set(2, numBaddies + 4);
}