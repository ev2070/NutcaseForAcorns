// obj_acorn Step

// If Scrat catches an acorn, say SIKE!
if (!acquired && instance_place(x, y, obj_player) != noone) {
    show = false;
	timer = duration;
	
	obj_game_manager.acorns_acquired += 1;
	audio_play_sound(snd_acorn, 0, false);
	
	acquired = true;
}

// Countdown
if (timer > 0) {
	timer--;
}

// SIKE! should have a high z-index to appear on top
if (!show) {
	depth = -3;
}

// Self destruct after showing SIKE! for a bit
if (!show && timer <= 0) {
	instance_destroy();
}
