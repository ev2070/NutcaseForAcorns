// obj_game_manager Create

// Play theme if not already playing
if (!audio_is_playing(snd_theme)) {
	audio_play_sound(snd_theme, 1, true);
}

// Title string variables
title = "NUTCASE FOR ACORNS";
title_half_width = string_width(title)/2;
title_half_height = string_height(title)/2;
title_color = #004B4D;

// Instructions string variables
instructions = "HELP SCRAT FIND HIS TRUE ACORN!\n" +
			"There's only one acorn that's truly his!\n\n\n" +
			"A for Left\n" + "D for Right\n" +
			"SPACE for Jump\n\n\n" +
			"ENTER to Start\n" +
			"R to Restart";
instrs_half_width = string_width(instructions)/2;
instrs_half_height = string_height(instructions)/2;
instrs_color = #FF5733;

// Advance Failed Message String variables
advance_failed = false;

advance_failed_msg = "Collect all acorns\nto advance";
afm_height = string_height(advance_failed_msg);
afm_color = #B22222;

afm_seconds = 4;
afm_duration = afm_seconds * GAME_SPEED;
afm_timer = 0;

// Acorn variables
acorns_per_level = 4;
acorns_acquired = 0;
