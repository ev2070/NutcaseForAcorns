// obj_snow_storm Step

// If time is up!
if (delay_timer <= 0) {
	off_screen = (dir == -1 && x < left_startx) || 
                (dir == 1 && x > right_startx);
	
    // If storm is off screen
    if (off_screen) {
		// Fade out white rectangle, keep within bounds
		current_alpha -= alpha_fade_out_step;
		current_alpha = clamp(current_alpha, alpha_min, alpha_max);

        // If white rectangle fully faded out, reset for a new storm
        if (current_alpha <= alpha_min) {
            dir = irandom_range(0, 1) * 2 - 1;
            x = (dir == -1) ? right_startx : left_startx;
            image_xscale = (dir == 1) ? 1 : -1;
            current_alpha = alpha_min;
            delay_timer = seconds * GAME_SPEED;
            playing_wind = true;
        }
		
	// If storm is on screen
    } else {
        // Play wind once and move
        if (playing_wind) {
            audio_play_sound(snd_wind, 0, false);
            playing_wind = false;
        }
        x += storm_speed * dir; // Move the storm

		// White rectangle oscillates from transparency
		// to opaqueness and back for first two levels
		if (room == rm_level1 || room == rm_level2) {
			if (current_alpha <= alpha_min || current_alpha >= alpha_max) {
				alpha_step *= -1;
			}
		}
		// Update current alpha, keep within bounds
		current_alpha += alpha_step;
		current_alpha = clamp(current_alpha, alpha_min, alpha_max);
    }

// Time is not up, so countdown
} else {
    delay_timer--;
}
