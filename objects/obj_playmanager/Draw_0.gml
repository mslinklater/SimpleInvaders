  /// @description Insert description here
// You can write your code in this editor

// lives
if(currentPhase == kPhaseGame)
{
	draw_set_halign(fa_left);

	draw_text(8, 300, string(lives));
	for(var i=0 ; i<lives ;i++)
	{
		draw_sprite(spr_player, 0, 40+(i*25), 308);
	}
}
      
if(currentPhase == kPhaseGameOver)
{
	draw_set_halign(fa_center);
	draw_text(120, 160, "GAME OVER");
}
