// obj_icicle_falling Create

randomize(); // Seed the random number generator

startx = x;
starty = y;
sinking_speed = 4;
vanish = random_range(0,1);

// Booleans
sinking = false;
player_below = false;
player_screaming = false;
platform_between = false;
