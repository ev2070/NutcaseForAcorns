// obj_icicle_falling Step

event_inherited();

player_below = (y <= obj_player.y &&
				x-10 <= obj_player.x && x+10 >= obj_player.x);
player_screaming = obj_player.screaming;
platform_between = false; // Reset

if (player_below) {
	// Check if there's a platform in between the
	// icicle's y-pos down to the player's y-pos
    for (var _curr_y = y + 1; _curr_y < obj_player.y;
		_curr_y += obj_platform.sprite_height) {
        if (place_meeting(x, _curr_y, obj_platform)) {
            platform_between = true;
            break;
        }
    }
}

if (player_below && !player_screaming && !platform_between) {
    sinking = true;
}

if (sinking) {
    y += sinking_speed; // Move downward

    // If icicle collides with a platform below it or
    // hits the ground, the icicle may disappear or respawn
    if (place_meeting(x, y+1, obj_platform) ||
        place_meeting(x, y+1, obj_platform_sinking) ||
        (y >= room_height)) {
        sinking_speed = 0;

        if (vanish < 0.3) {
            instance_destroy();
        } else {
            audio_play_sound(snd_ice, 0, false);
            x = startx;
            y = starty;
            sinking_speed = 4;
            vanish = random_range(0,1);
            sinking = false;
        }
    }
}
