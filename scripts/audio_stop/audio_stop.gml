// Helper script that stops select audio from playing upon room restart
function audio_stop() {
	audio_stop_sound(snd_acorn);
	audio_stop_sound(snd_chatter);
	audio_stop_sound(snd_ice);
	audio_stop_sound(snd_jump);
	audio_stop_sound(snd_wind);
}
