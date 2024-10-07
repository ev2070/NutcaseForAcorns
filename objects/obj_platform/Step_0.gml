// obj_platform Step
// Provided by Prof. Blake Andrews from DM-UY 2153 Intro to Game Development

if (shiny) { // Start animating
    image_speed = 0.3;
} else { // Stop animating
    image_speed = 0;
}

// If current frame of animation exceeds 11th frame,
// unset shiny and restart animation
if (image_index > 11) {
    shiny = false;
    image_index = 0;
}
