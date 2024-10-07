// obj_acorn Draw

// Draw acorn
if (show) {
	draw_self();

// Draw SIKE! (center-justified)
} else {
	draw_text_color(x, y - sike_half_height, sike,
					c_blue, c_blue, c_blue, c_blue, 1);
}
