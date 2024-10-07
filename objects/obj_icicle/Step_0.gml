// obj_icicle Step

// If the player hits the icicle, player dies
if (!obj_player.screaming && place_meeting(x, y+1, obj_player)) {
	player_death();
}
