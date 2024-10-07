// obj_snow_storm Create

randomize(); // Seed the random number generator

// Velocity (magnitude and direction)
storm_speed = // Decrease speed as player progresses through levels
	(room == rm_level5) ? 4 :
	((room == rm_level4 || room == rm_level3) ? 6 :
	((room == rm_level2) ? 8 : 10));
dir = irandom_range(0, 1) * 2 - 1; // -1 (right to left) or 1 (left to right)

// Determine position and sprite direction
right_startx = room_width + sprite_width;
left_startx = -sprite_width;
x = (dir == -1) ? right_startx : left_startx;
y = room_height/2;
image_xscale = (dir == 1) ? 1: -1;

// Alpha variables for white rectangle
current_alpha = 0; // Start transparent
alpha_min = 0; // Transparent bound
alpha_max = // Opaque bound
	(room == rm_level5) ? 250 :
	((room == rm_level4) ? 240 :
	((room == rm_level3) ? 220 :
	((room == rm_level2) ? 200 : 150)));
alpha_step = // Step size for alpha oscillation while storm on screen
	(room == rm_level5) ? 0.4 :
	((room == rm_level4) ? 0.6 :
	((room == rm_level3) ? 0.8 : 1));
alpha_fade_out_step = // Step size for alpha decrease when storm off screen
	(room == rm_level5) ? 4 :
	((room == rm_level4) ? 3 :
	((room == rm_level3) ? 2 : 1));

// Timer variables
seconds = // Decrease delay as player progresses through levels
	(room == rm_level5) ? 1 :
	((room == rm_level4) ? 2 : 3);
delay_timer = 0;

// Booleans
playing_wind = true;
off_screen = false;
