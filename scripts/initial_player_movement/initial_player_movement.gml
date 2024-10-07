// Helper script that set the player's movement to its initial values
// The first block of variables were provided by by Professor Blake Andrews
//		from DM-UY 2153 Intro to Game Development.
function initial_player_movement() {
	// New obj_player variables introduced here
	hspd = 0;
	vspd = 0;
	grounded = false;
	just_jumped = false;
	jumps_spent = 0;
	jump_pressed = false;
	x_remainder = 0;
	y_remainder = 0;
	image_speed = 1;
	
	screaming = false;
	dead = false;
	
	// Have obj_player face right on (re)spawn
	if (image_xscale != 1) {
		image_xscale = image_scale_factor;
	}
}
