// obj_player Create
// Starter code provided by Professor Blake Andrews
//		from DM-UY 2153 Intro to Game Development.

// Macro to replace deprecated `room_speed`
#macro GAME_SPEED game_get_speed(gamespeed_fps)

start_x = x;
start_y = y;

image_scale_factor = 1;	// Making this bigger results in left/right glitch
image_xscale = image_scale_factor;
image_yscale = image_scale_factor;

// SLOW Game Feel - caused by snow storm
normal_hspd_max = 10;
normal_accel = 0.5;
slow_hspd_max = 4;
slow_accel = 0.3;
normal_jump_max = 15;
weak_jump_max = 12;

// QUICK Game Feel
hspd_max = normal_hspd_max; // maximum left/right speed
accel = normal_accel;       // left/right movement acceleration
jump_max = normal_jump_max; // strength of upward force
grav_amt = 0.6;             // strength of downward force
jump_hold = 0.07 * GAME_SPEED;  // time you can hold for a higher jump
num_jump = 1;               // # jumps before needing to touch ground
jump_pressed_timer = 30;    // # frames to save "jump" input, aka input caching
coyote_time = 1;            // # frames before fall when stepping off platform

// Alarm variables (initialized here to prevent warnings)
grounded = false;
just_jumped = false;
jump_pressed = false;

initial_player_movement();

// Boolean
is_player = true;
