// obj_game_manager Step

// In the standby room, press ENTER to enter first level
if (room == rm_standby && keyboard_check(vk_enter)) {
	room_goto(rm_level1);
	acorns_acquired = 0;
}

// When player reaches the top of a level
// and has gathered all acorns in a level,
// proceed to the next level
if (obj_player.y <= 0 && acorns_acquired == acorns_per_level) {
	acorns_acquired = 0;
		 if (room == rm_level1) { room_goto(rm_level2); }
	else if (room == rm_level2) { room_goto(rm_level3); }
	else if (room == rm_level3) { room_goto(rm_level4); }
	else if (room == rm_level4) { room_goto(rm_level5); }
	else if (room == rm_level5) { room_goto(rm_standby); }
	
	audio_stop(); // Stop all but snd_theme
	audio_play_sound(snd_level_up, 0, false);

// But if player reaches the top of a level,
// and has not gathered all acorns in a level,
// play player death & prepare for advance failed message
} else if (!obj_player.screaming && obj_player.y <= 0 &&
	acorns_acquired < acorns_per_level) {
	y = sprite_height;
	player_death();
	advance_failed = true;
	afm_timer = afm_duration;
}

// If time is not up, countdown; else unset boolean
if (afm_timer > 0) {
	afm_timer--;
} else {
	advance_failed = false;
}

// If on a game level and R is pressed, restart level
// Most helpful in case of glitches
if ((room == rm_level1 || room == rm_level2 || room == rm_level3 ||
	 room == rm_level4 || room == rm_level5) && keyboard_check(ord("R"))) {
	audio_stop(); // Stop all but snd_theme
	room_restart();
	acorns_acquired = 0;
}
