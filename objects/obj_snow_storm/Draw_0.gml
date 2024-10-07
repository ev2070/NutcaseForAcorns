// obj_snow_storm Draw

// If storm on screen or off screen but still fading out,
// show white rectangle
if (!off_screen || (off_screen && current_alpha > alpha_min)) {
	draw_set_alpha(current_alpha/255);
	draw_rectangle_color(0, -sprite_height/2, room_width, room_height,
						 c_white, c_white, c_white, c_white, false);
	draw_set_alpha(1);
}

draw_self();
