// obj_game_manager Draw

// Show game title and instructions
if (room == rm_standby) {
	draw_set_halign(fa_left); // left justified
	draw_set_font(fnt_bowlby_one_sc_regular_big);
	draw_text_color(room_width*0.455 - title_half_width,
					room_height*0.15 - title_half_height, title,
					title_color, title_color, title_color, title_color, 1);
	
	draw_set_halign(fa_center); // center justified
	draw_set_font(fnt_bowlby_one_sc_regular);
	draw_text_color(room_width*0.8 - instrs_half_width,
					room_height*0.425 - instrs_half_height, instructions,
					instrs_color, instrs_color, instrs_color, instrs_color, 1);

// In game rooms, if player failed to advance, show corresponding message
} else {
	if (advance_failed) {
		draw_text_color(obj_player.x, obj_player.y + afm_height,
			advance_failed_msg, afm_color, afm_color, afm_color, afm_color, 1);
	}
}
