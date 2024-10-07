// obj_player Step
// Starter code provided by Professor Blake Andrews
//		from DM-UY 2153 Intro to Game Development.

if (!dead) {
	
	#region Movement and Collisions
	move_collide();

	// On ground?
	if (place_meeting(x, y+1, obj_platform)) {
		alarm[2] = coyote_time; // While on a platform, hold this timer at max
		grounded = true;
		jumps_spent = 0;
	}
	#endregion
	
	#region Base movement and animation related to key press

	vspd += grav_amt; // Apply gravity
	
	// Slow player down if snow storm on screen
	if (instance_exists(obj_snow_storm) && !obj_snow_storm.off_screen &&
		hspd_max != slow_hspd_max && accel != slow_accel && 
		jump_max != weak_jump_max) {
		hspd_max = slow_hspd_max;
		accel = slow_accel;
		jump_max = weak_jump_max;

	// Speed player back up if snow storm off screen
	} else if (instance_exists(obj_snow_storm) && obj_snow_storm.off_screen &&
		hspd_max != normal_hspd_max && accel != normal_accel &&
		jump_max != normal_jump_max) {
		hspd_max = normal_hspd_max;
		accel = normal_accel;
		jump_max = normal_jump_max;
	}
	
	if (keyboard_check(ord("A"))) { // If pressing A
	    if (hspd > -hspd_max) {
	        hspd -= accel; // Accelerate if not at max speed left
	    } else { 
	        hspd = -hspd_max;
	    }
	    image_xscale = -image_scale_factor; // Flip sprite to face left
	    if (grounded) {
	        sprite_index = spr_scrat_run; // Set running sprite
	    }
	} else if (keyboard_check(ord("D"))) { // If D, same deal in other direction
	    if (hspd < hspd_max) {
	        hspd += accel;
	    } else {
	        hspd = hspd_max;
	    }
	    image_xscale = image_scale_factor; // Flip sprite to face right
	    if (grounded) { // Only change to running sprite if on ground
	        sprite_index = spr_scrat_run;
	    }
	} else {        
	    // If not pressing either direction and on the ground,
	    // slow down and show idle animation
	    if (grounded) {
	        hspd = lerp(hspd, 0, .05);
	        sprite_index = spr_scrat_idle; // Set idle sprite
			
			// If there's a storm, move idle player in direction of storm
			if (instance_exists(obj_snow_storm) && !obj_snow_storm.off_screen) {
				if (obj_snow_storm.dir == -1) { // Moving left
					hspd -= accel/2;
				} else if (obj_snow_storm.dir == 1) { // Moving right
					hspd += accel/2;	
				}
			}
	    }
	}
	#endregion

	#region Jumping and Falling
	if (is_player) {
		if (keyboard_check_pressed(vk_space)) {	// "input caching"
			jump_pressed = true;
			alarm[1] = jump_pressed_timer; // saves key press for some frames
		}

		// If player is touching the ground or platform,
		// set our jump value to 0 so we don't move
		if (grounded) {
			vspd = 0;

		// If player is NOT on the ground
		} else {
			// Allow player to hold the jump button for increased height
			if (just_jumped) {
				if (keyboard_check(vk_space)) {
					jump_pressed = false;
					vspd = -jump_max;
				} else {
					just_jumped = false;
					alarm[0] = 0;
				}
			}
			// Use jump sprite for jump, fall sprite for fall
			sprite_index = (vspd > 0) ? spr_scrat_jump : spr_scrat_fall;
		}

		// Check for jump key only if we have jumps left to use
		// Turn off our jump key, because we used it and
		// Set our jump value to its max to start the jump
		if (jump_pressed && jumps_spent < num_jump) {
		    jump_pressed = false;
			vspd = -jump_max;
    								
			// If not on the ground, use an air jump
			if (grounded == false) {
				jumps_spent += 1;
			}
			if (jump_hold > 0) {
				just_jumped = true;
				alarm[0] = jump_hold;
				if (spr_scrat_jump && !audio_is_playing(snd_jump)) {
					audio_play_sound(snd_jump, 0, false);
				}
			}
			grounded = false; // Not on the ground anymore! We jumped!
		}
	}
	#endregion	
}

// Play melting player animation, then respawn
if (image_index > 15 && dead) { // 16 frames for Scrat melt sprite
	initial_player_movement();
	x = start_x;
	y = start_y;
}
