// All player lives lost... end the game

// set phase
obj_playmanager.currentPhase = obj_playmanager.kPhaseGameOver;

// add high score
highscore_add("PLAYER", score);

// remove all the aliens
instance_destroy(obj_baddie);

// remove the barriers
instance_destroy(obj_barrier);

// remove the player
instance_destroy(obj_player);

// remove all bombs, bullets and explosions
instance_destroy(obj_bullet);
instance_destroy(obj_bomb);
instance_destroy(obj_bomb_explosion);
instance_destroy(obj_baddie_explosion);

instance_destroy(obj_floor);
