// obj_platform_sinking Step

event_inherited();

// Check if player is on the platform
player_on_platform = (place_meeting(x, y-1, obj_player));

if (player_on_platform) {
    y += sinking_speed; // Move platform downwards
	
	// If sinking platform collides with a
	// regular platform below it, stop moving
	if (place_meeting(x, y+1, obj_platform) ||
		(y >= room_height-sprite_height)) {
		sinking_speed = 0;
	}
}
