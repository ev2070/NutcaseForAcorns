// Helper script that is triggered when the player dies
// Death sound and animation begin
function player_death() {
	obj_player.screaming = true;
	audio_play_sound(snd_chatter, 0, false);
	obj_player.sprite_index = spr_scrat_melt;
	obj_player.dead = true;
}
