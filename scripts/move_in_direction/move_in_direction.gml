// Modified helper script provided by Professor Blake Andrews
//		from DM-UY 2153 Intro to Game Development.
// Handles movement in a specified direction given a total speed.
function move_in_direction(_total_spd, _is_horizontal) {
	// Cut off the remainder for this frame
	var _spd_floored = floor(abs(_total_spd)) * sign(_total_spd);
	
	if (_spd_floored != 0) {
		for (var _i = 0; _i < abs(_spd_floored); _i++) {
			var _next_x = _is_horizontal ? x + sign(_spd_floored) : x;
            var _next_y = _is_horizontal ? y : y + sign(_spd_floored);
			
			if (place_meeting(_next_x, _next_y, obj_platform)) {
				if (_is_horizontal) {
                    hspd = 0;
                    x_remainder = 0;
                } else {
                    vspd = 0;
                    y_remainder = 0;
                }
				break; // Leave loop if a collidable object is 1 pixel ahead
			}
			if (_is_horizontal) {
                x += sign(_spd_floored);
            } else {
                y += sign(_spd_floored);
            }
		}
	}
}
