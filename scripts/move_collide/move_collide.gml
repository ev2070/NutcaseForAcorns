// Modified helper script provided by Professor Blake Andrews
//		from DM-UY 2153 Intro to Game Development.
// Moves obj_player and checks for collisions with obj_platforms.
// Handles leftover movement & wraps obj_player horizontally around the screen.
function move_collide() {
	// Apply the remainders we saved last frame
	var _total_hspd = hspd + x_remainder;
	var _total_vspd = vspd + y_remainder;
	
	// Save the remainder for next frame
	x_remainder = _total_hspd % 1;
	y_remainder = _total_vspd % 1;
	
	/// Now let's apply horizontal and vertical movement
	move_in_direction(_total_hspd, true);
	move_in_direction(_total_vspd, false);
	
	//	Screen wrapping
	if (x > room_width) {
		x = 0;
		x_remainder = 0;
	}	
	if (x < 0) {
		x = room_width;
		x_remainder = 0;
	}
}
