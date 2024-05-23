/**
 * Martin Egli
 * 2024-05-15
 * testing honey comb structure to create the display
 * wall thickness: 0.5 mm
 * printing: 0.2 mm layer height
 */

use <parts.scad>

hex_rad = 10/2;
/* calculate hexagon center positions
 * r: radius, use "hex_rad"
 * n: index in x axis
 * m: index in y axis
 * even columns
 * dxeven = n*2*r*cos(30)
 * dyeven = m*3/2*r
 * odd columns
 * dxodd = n*3/2*r
 * dyodd = (m-1/2)*r*cos(30)
 */
dx_even_factor = 3/2*hex_rad; // see dxeven = m*3*r
dy_even_factor = 2*hex_rad*cos(30); // see dyeven = n*2*r*cos(30)
dx_odd_factor = 3/2*hex_rad; // see dxodd = m*3/2*r
dy_odd_factor = hex_rad*cos(30); // see dyodd = (2n+1)*r*cos(30)
module place_hexagon_cover_element(x_pos = 0, y_pos = 0) {
    if((x_pos % 2) == 0) {
        // even column
        translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0])
        hexagon_cover_element();
    }
    else {
        // odd column
        translate([x_pos*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0])
        hexagon_cover_element();
    }
}

module place_hexagon_cover_element_led(x_pos = 0, y_pos = 0, col = "Red") {
    if((x_pos % 2) == 0) {
        // even column
        translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0])
        hexagon_cover_element_led(col = col);
    }
    else {
        // odd column
        translate([x_pos*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0])
        hexagon_cover_element_led(col = col);
    }
}

module place_hexagon_cover_element_m3_mount(x_pos = 0, y_pos = 0) {
    if((x_pos % 2) == 0) {
        // even column
        translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0])
        hexagon_cover_element_m3_mount();
    }
    else {
        // odd column
        translate([x_pos*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0])
        hexagon_cover_element_m3_mount();
    }
}

module place_hexagon_rest_element(x_pos = 0, y_pos = 0) {
    if((x_pos % 2) == 0) {
        // even column
        translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0])
        hexagon_rest_element_led2427_cut();
    }
    else {
        // odd column
        translate([x_pos*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0])
        hexagon_rest_element_led2427_cut();
    }
}

module place_hexagon_rest_element_m3_mount(x_pos = 0, y_pos = 0) {
    if((x_pos % 2) == 0) {
        // even column
        translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0])
        hexagon_rest_element_m3_mount();
    }
    else {
        // odd column
        translate([x_pos*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0])
        hexagon_rest_element_m3_mount();
    }
}

// - plain display ------------------
// plain_display_cover_v1.0.stl
module plain_display_cover() {
    *place_hexagon_cover_element(0, 0);
    place_hexagon_cover_element(0, 1);
    place_hexagon_cover_element(0, 2);
    place_hexagon_cover_element(0, 3);
    place_hexagon_cover_element(0, 4);
    *place_hexagon_cover_element(0, 5);

    place_hexagon_cover_element(1, 0);
    place_hexagon_cover_element(1, 1);
    place_hexagon_cover_element(1, 2);
    place_hexagon_cover_element(1, 3);
    place_hexagon_cover_element(1, 4);
    place_hexagon_cover_element(1, 5);
    place_hexagon_cover_element(1, 6);

    place_hexagon_cover_element(2, -1);
    place_hexagon_cover_element(2, 0);
    place_hexagon_cover_element(2, 1);
    place_hexagon_cover_element(2, 2);
    place_hexagon_cover_element(2, 3);
    place_hexagon_cover_element(2, 4);
    place_hexagon_cover_element(2, 5);
    place_hexagon_cover_element(2, 6);

    place_hexagon_cover_element(3, -1);
    place_hexagon_cover_element(3, 0);
    place_hexagon_cover_element(3, 1);
    place_hexagon_cover_element(3, 2);
    place_hexagon_cover_element(3, 3);
    place_hexagon_cover_element(3, 4);
    place_hexagon_cover_element(3, 5);
    place_hexagon_cover_element(3, 6);
    place_hexagon_cover_element(3, 7);

    place_hexagon_cover_element(4, -2);
    place_hexagon_cover_element(4, -1);
    place_hexagon_cover_element(4, 0);
    place_hexagon_cover_element(4, 1);
    place_hexagon_cover_element(4, 2);
    place_hexagon_cover_element(4, 3);
    place_hexagon_cover_element(4, 4);
    place_hexagon_cover_element(4, 5);
    place_hexagon_cover_element(4, 6);
    place_hexagon_cover_element(4, 7);

    place_hexagon_cover_element(5, -1);
    place_hexagon_cover_element(5, 0);
    place_hexagon_cover_element(5, 1);
    place_hexagon_cover_element(5, 2);
    place_hexagon_cover_element(5, 3);
    place_hexagon_cover_element(5, 4);
    place_hexagon_cover_element(5, 5);
    place_hexagon_cover_element(5, 6);
    place_hexagon_cover_element(5, 7);

    place_hexagon_cover_element(6, -2);
    place_hexagon_cover_element(6, -1);
    place_hexagon_cover_element(6, 0);
    place_hexagon_cover_element(6, 1);
    place_hexagon_cover_element(6, 2);
    place_hexagon_cover_element(6, 3);
    place_hexagon_cover_element(6, 4);
    place_hexagon_cover_element(6, 5);
    place_hexagon_cover_element(6, 6);
    place_hexagon_cover_element(6, 7);

    place_hexagon_cover_element(7, -1);
    place_hexagon_cover_element(7, 0);
    place_hexagon_cover_element(7, 1);
    place_hexagon_cover_element(7, 2);
    place_hexagon_cover_element(7, 3);
    place_hexagon_cover_element(7, 4);
    place_hexagon_cover_element(7, 5);
    place_hexagon_cover_element(7, 6);
    place_hexagon_cover_element(7, 7);

    place_hexagon_cover_element(8, -2);
    place_hexagon_cover_element(8, -1);
    place_hexagon_cover_element(8, 0);
    place_hexagon_cover_element(8, 1);
    place_hexagon_cover_element(8, 2);
    place_hexagon_cover_element(8, 3);
    place_hexagon_cover_element(8, 4);
    place_hexagon_cover_element(8, 5);
    place_hexagon_cover_element(8, 6);
    place_hexagon_cover_element(8, 7);

    place_hexagon_cover_element(9, -1);
    place_hexagon_cover_element(9, 0);
    place_hexagon_cover_element(9, 1);
    place_hexagon_cover_element(9, 2);
    place_hexagon_cover_element(9, 3);
    place_hexagon_cover_element(9, 4);
    place_hexagon_cover_element(9, 5);
    place_hexagon_cover_element(9, 6);
    place_hexagon_cover_element(9, 7);

    place_hexagon_cover_element(10, -2);
    place_hexagon_cover_element(10, -1);
    place_hexagon_cover_element(10, 0);
    place_hexagon_cover_element(10, 1);
    place_hexagon_cover_element(10, 2);
    place_hexagon_cover_element(10, 3);
    place_hexagon_cover_element(10, 4);
    place_hexagon_cover_element(10, 5);
    place_hexagon_cover_element(10, 6);
    place_hexagon_cover_element(10, 7);

    place_hexagon_cover_element(11, -1);
    place_hexagon_cover_element(11, 0);
    place_hexagon_cover_element(11, 1);
    place_hexagon_cover_element(11, 2);
    place_hexagon_cover_element(11, 3);
    place_hexagon_cover_element(11, 4);
    place_hexagon_cover_element(11, 5);
    place_hexagon_cover_element(11, 6);
    place_hexagon_cover_element(11, 7);

    place_hexagon_cover_element(12, -2);
    place_hexagon_cover_element(12, -1);
    place_hexagon_cover_element(12, 0);
    place_hexagon_cover_element(12, 1);
    place_hexagon_cover_element(12, 2);
    place_hexagon_cover_element(12, 3);
    place_hexagon_cover_element(12, 4);
    place_hexagon_cover_element(12, 5);
    place_hexagon_cover_element(12, 6);
    place_hexagon_cover_element(12, 7);

    place_hexagon_cover_element(13, -1);
    place_hexagon_cover_element(13, 0);
    place_hexagon_cover_element(13, 1);
    place_hexagon_cover_element(13, 2);
    place_hexagon_cover_element(13, 3);
    place_hexagon_cover_element(13, 4);
    place_hexagon_cover_element(13, 5);
    place_hexagon_cover_element(13, 6);
    place_hexagon_cover_element(13, 7);

    place_hexagon_cover_element(14, -2);
    place_hexagon_cover_element(14, -1);
    place_hexagon_cover_element(14, 0);
    place_hexagon_cover_element(14, 1);
    place_hexagon_cover_element(14, 2);
    place_hexagon_cover_element(14, 3);
    place_hexagon_cover_element(14, 4);
    place_hexagon_cover_element(14, 5);
    place_hexagon_cover_element(14, 6);
    place_hexagon_cover_element(14, 7);

    place_hexagon_cover_element(15, -1);
    place_hexagon_cover_element(15, 0);
    place_hexagon_cover_element(15, 1);
    place_hexagon_cover_element(15, 2);
    place_hexagon_cover_element(15, 3);
    place_hexagon_cover_element(15, 4);
    place_hexagon_cover_element(15, 5);
    place_hexagon_cover_element(15, 6);
    place_hexagon_cover_element(15, 7);

    place_hexagon_cover_element(16, -2);
    place_hexagon_cover_element(16, -1);
    place_hexagon_cover_element(16, 0);
    place_hexagon_cover_element(16, 1);
    place_hexagon_cover_element(16, 2);
    place_hexagon_cover_element(16, 3);
    place_hexagon_cover_element(16, 4);
    place_hexagon_cover_element(16, 5);
    place_hexagon_cover_element(16, 6);
    place_hexagon_cover_element(16, 7);

    place_hexagon_cover_element(17, -1);
    place_hexagon_cover_element(17, 0);
    place_hexagon_cover_element(17, 1);
    place_hexagon_cover_element(17, 2);
    place_hexagon_cover_element(17, 3);
    place_hexagon_cover_element(17, 4);
    place_hexagon_cover_element(17, 5);
    place_hexagon_cover_element(17, 6);
    place_hexagon_cover_element(17, 7);

    place_hexagon_cover_element(18, -1);
    place_hexagon_cover_element(18, 0);
    place_hexagon_cover_element(18, 1);
    place_hexagon_cover_element(18, 2);
    place_hexagon_cover_element(18, 3);
    place_hexagon_cover_element(18, 4);
    place_hexagon_cover_element(18, 5);
    place_hexagon_cover_element(18, 6);

    place_hexagon_cover_element(19, 0);
    place_hexagon_cover_element(19, 1);
    place_hexagon_cover_element(19, 2);
    place_hexagon_cover_element(19, 3);
    place_hexagon_cover_element(19, 4);
    place_hexagon_cover_element(19, 5);
    place_hexagon_cover_element(19, 6);

    *place_hexagon_cover_element(20, 0);
    place_hexagon_cover_element(20, 1);
    place_hexagon_cover_element(20, 2);
    place_hexagon_cover_element(20, 3);
    place_hexagon_cover_element(20, 4);
    *place_hexagon_cover_element(20, 5);
    
    // mounts
    place_hexagon_cover_element_m3_mount(0, 0);
    place_hexagon_cover_element_m3_mount(0, 5);
    place_hexagon_cover_element_m3_mount(6, -2);
    place_hexagon_cover_element_m3_mount(6, 7);place_hexagon_cover_element_m3_mount(14, -2);
    place_hexagon_cover_element_m3_mount(14, 7);
    place_hexagon_cover_element_m3_mount(20, 0);
    place_hexagon_cover_element_m3_mount(20, 5);
}

// - display ------------------
// red leds: 8*4 + 4*5 + 2 + 7 = 61
// control individualy
module display_clock_cover() {
    *place_hexagon_cover_element(0, 0);
    place_hexagon_cover_element(0, 1);
    place_hexagon_cover_element(0, 2);
    place_hexagon_cover_element(0, 3);
    place_hexagon_cover_element(0, 4);
    *place_hexagon_cover_element(0, 5);

    place_hexagon_cover_element(1, 0);
    place_hexagon_cover_element(1, 1);
    place_hexagon_cover_element(1, 2);
    place_hexagon_cover_element(1, 3);
    place_hexagon_cover_element(1, 4);
    place_hexagon_cover_element(1, 5);
    place_hexagon_cover_element(1, 6);

    place_hexagon_cover_element(2, -1);
    place_hexagon_cover_element(2, 0);
    place_hexagon_cover_element_led(2, 1);
    place_hexagon_cover_element_led(2, 2);
    place_hexagon_cover_element_led(2, 3);
    place_hexagon_cover_element_led(2, 4);
    place_hexagon_cover_element(2, 5);
    place_hexagon_cover_element(2, 6);

    place_hexagon_cover_element(3, -1);
    place_hexagon_cover_element(3, 0);
    place_hexagon_cover_element_led(3, 1);
    place_hexagon_cover_element_led(3, 2);
    place_hexagon_cover_element_led(3, 3);
    place_hexagon_cover_element_led(3, 4);
    place_hexagon_cover_element_led(3, 5);
    place_hexagon_cover_element(3, 6);
    place_hexagon_cover_element(3, 7);

    place_hexagon_cover_element(4, -2);
    place_hexagon_cover_element_led(4, -1);
    place_hexagon_cover_element(4, 0);
    place_hexagon_cover_element_led(4, 1);
    place_hexagon_cover_element_led(4, 2);
    place_hexagon_cover_element_led(4, 3);
    place_hexagon_cover_element_led(4, 4);
    place_hexagon_cover_element(4, 5);
    place_hexagon_cover_element(4, 6);
    place_hexagon_cover_element(4, 7);

    place_hexagon_cover_element(5, -1);
    place_hexagon_cover_element(5, 0);
    place_hexagon_cover_element(5, 1);
    place_hexagon_cover_element(5, 2);
    place_hexagon_cover_element(5, 3);
    place_hexagon_cover_element(5, 4);
    place_hexagon_cover_element(5, 5);
    place_hexagon_cover_element(5, 6);
    place_hexagon_cover_element(5, 7);

    place_hexagon_cover_element(6, -2);
    place_hexagon_cover_element_led(6, -1);
    place_hexagon_cover_element(6, 0);
    place_hexagon_cover_element_led(6, 1);
    place_hexagon_cover_element_led(6, 2);
    place_hexagon_cover_element_led(6, 3);
    place_hexagon_cover_element_led(6, 4);
    place_hexagon_cover_element(6, 5);
    place_hexagon_cover_element(6, 6);
    place_hexagon_cover_element(6, 7);

    place_hexagon_cover_element(7, -1);
    place_hexagon_cover_element(7, 0);
    place_hexagon_cover_element_led(7, 1);
    place_hexagon_cover_element_led(7, 2);
    place_hexagon_cover_element_led(7, 3);
    place_hexagon_cover_element_led(7, 4);
    place_hexagon_cover_element_led(7, 5);
    place_hexagon_cover_element(7, 6);
    place_hexagon_cover_element(7, 7);

    place_hexagon_cover_element(8, -2);
    place_hexagon_cover_element_led(8, -1);
    place_hexagon_cover_element(8, 0);
    place_hexagon_cover_element_led(8, 1);
    place_hexagon_cover_element_led(8, 2);
    place_hexagon_cover_element_led(8, 3);
    place_hexagon_cover_element_led(8, 4);
    place_hexagon_cover_element(8, 5);
    place_hexagon_cover_element(8, 6);
    place_hexagon_cover_element(8, 7);

    place_hexagon_cover_element(9, -1);
    place_hexagon_cover_element(9, 0);
    place_hexagon_cover_element(9, 1);
    place_hexagon_cover_element(9, 2);
    place_hexagon_cover_element(9, 3);
    place_hexagon_cover_element(9, 4);
    place_hexagon_cover_element(9, 5);
    place_hexagon_cover_element(9, 6);
    place_hexagon_cover_element(9, 7);

    *place_hexagon_cover_element(10, -2);
    place_hexagon_cover_element_led(10, -1);
    place_hexagon_cover_element(10, 0);
    place_hexagon_cover_element_led(10, 1);
    place_hexagon_cover_element(10, 2);
    place_hexagon_cover_element_led(10, 3);
    place_hexagon_cover_element(10, 4);
    place_hexagon_cover_element(10, 5);
    place_hexagon_cover_element(10, 6);
    *place_hexagon_cover_element(10, 7);

    place_hexagon_cover_element(11, -1);
    place_hexagon_cover_element(11, 0);
    place_hexagon_cover_element(11, 1);
    place_hexagon_cover_element(11, 2);
    place_hexagon_cover_element(11, 3);
    place_hexagon_cover_element(11, 4);
    place_hexagon_cover_element(11, 5);
    place_hexagon_cover_element(11, 6);
    place_hexagon_cover_element(11, 7);

    place_hexagon_cover_element(12, -2);
    place_hexagon_cover_element_led(12, -1);
    place_hexagon_cover_element(12, 0);
    place_hexagon_cover_element_led(12, 1);
    place_hexagon_cover_element_led(12, 2);
    place_hexagon_cover_element_led(12, 3);
    place_hexagon_cover_element_led(12, 4);
    place_hexagon_cover_element(12, 5);
    place_hexagon_cover_element(12, 6);
    place_hexagon_cover_element(12, 7);

    place_hexagon_cover_element(13, -1);
    place_hexagon_cover_element(13, 0);
    place_hexagon_cover_element_led(13, 1);
    place_hexagon_cover_element_led(13, 2);
    place_hexagon_cover_element_led(13, 3);
    place_hexagon_cover_element_led(13, 4);
    place_hexagon_cover_element_led(13, 5);
    place_hexagon_cover_element(13, 6);
    place_hexagon_cover_element(13, 7);

    place_hexagon_cover_element(14, -2);
    place_hexagon_cover_element_led(14, -1);
    place_hexagon_cover_element(14, 0);
    place_hexagon_cover_element_led(14, 1);
    place_hexagon_cover_element_led(14, 2);
    place_hexagon_cover_element_led(14, 3);
    place_hexagon_cover_element_led(14, 4);
    place_hexagon_cover_element(14, 5);
    place_hexagon_cover_element(14, 6);
    place_hexagon_cover_element(14, 7);

    place_hexagon_cover_element(15, -1);
    place_hexagon_cover_element(15, 0);
    place_hexagon_cover_element(15, 1);
    place_hexagon_cover_element(15, 2);
    place_hexagon_cover_element(15, 3);
    place_hexagon_cover_element(15, 4);
    place_hexagon_cover_element(15, 5);
    place_hexagon_cover_element(15, 6);
    place_hexagon_cover_element(15, 7);

    place_hexagon_cover_element(16, -2);
    place_hexagon_cover_element_led(16, -1);
    place_hexagon_cover_element(16, 0);
    place_hexagon_cover_element_led(16, 1);
    place_hexagon_cover_element_led(16, 2);
    place_hexagon_cover_element_led(16, 3);
    place_hexagon_cover_element_led(16, 4);
    place_hexagon_cover_element(16, 5);
    place_hexagon_cover_element(16, 6);
    place_hexagon_cover_element(16, 7);

    place_hexagon_cover_element(17, -1);
    place_hexagon_cover_element(17, 0);
    place_hexagon_cover_element_led(17, 1);
    place_hexagon_cover_element_led(17, 2);
    place_hexagon_cover_element_led(17, 3);
    place_hexagon_cover_element_led(17, 4);
    place_hexagon_cover_element_led(17, 5);
    place_hexagon_cover_element(17, 6);
    place_hexagon_cover_element(17, 7);

    place_hexagon_cover_element(18, -1);
    place_hexagon_cover_element(18, 0);
    place_hexagon_cover_element_led(18, 1);
    place_hexagon_cover_element_led(18, 2);
    place_hexagon_cover_element_led(18, 3);
    place_hexagon_cover_element_led(18, 4);
    place_hexagon_cover_element(18, 5);
    place_hexagon_cover_element(18, 6);

    place_hexagon_cover_element(19, 0);
    place_hexagon_cover_element(19, 1);
    place_hexagon_cover_element(19, 2);
    place_hexagon_cover_element(19, 3);
    place_hexagon_cover_element(19, 4);
    place_hexagon_cover_element(19, 5);
    place_hexagon_cover_element(19, 6);

    *place_hexagon_cover_element(20, 0);
    place_hexagon_cover_element(20, 1);
    place_hexagon_cover_element(20, 2);
    place_hexagon_cover_element(20, 3);
    place_hexagon_cover_element(20, 4);
    *place_hexagon_cover_element(20, 5);
    
    // mounts
    place_hexagon_cover_element_m3_mount(0, 0);
    place_hexagon_cover_element_m3_mount(0, 5);
    place_hexagon_cover_element_m3_mount(10, -2);
    place_hexagon_cover_element_m3_mount(10, 7);
    place_hexagon_cover_element_m3_mount(20, 0);
    place_hexagon_cover_element_m3_mount(20, 5);
}

// - display ------------------
// red leds: 8*4 + 4*5 + 2 + 7 = 61
// control individualy
module display_clock_cover2() {
    place_hexagon_cover_element(0, 0);
    place_hexagon_cover_element(0, 1);
    *place_hexagon_cover_element(0, 2);
    
    place_hexagon_cover_element(1, -1);
    place_hexagon_cover_element(1, 0);
    place_hexagon_cover_element(1, 1);
    place_hexagon_cover_element(1, 2);
    place_hexagon_cover_element(1, 3);
    place_hexagon_cover_element(1, 4);
    place_hexagon_cover_element(1, 5);

    place_hexagon_cover_element(2, -1);
    place_hexagon_cover_element(2, 0);
    place_hexagon_cover_element_led(2, 1);
    place_hexagon_cover_element_led(2, 2);
    place_hexagon_cover_element_led(2, 3);
    place_hexagon_cover_element_led(2, 4);
    place_hexagon_cover_element(2, 5);

    place_hexagon_cover_element(3, -1);
    place_hexagon_cover_element(3, 0);
    place_hexagon_cover_element_led(3, 1);
    place_hexagon_cover_element_led(3, 2);
    place_hexagon_cover_element_led(3, 3);
    place_hexagon_cover_element_led(3, 4);
    place_hexagon_cover_element_led(3, 5);
    place_hexagon_cover_element(3, 6);

    place_hexagon_cover_element(4, -2);
    place_hexagon_cover_element_led(4, -1);
    place_hexagon_cover_element(4, 0);
    place_hexagon_cover_element_led(4, 1);
    place_hexagon_cover_element_led(4, 2);
    place_hexagon_cover_element_led(4, 3);
    place_hexagon_cover_element_led(4, 4);
    place_hexagon_cover_element(4, 5);

    *place_hexagon_cover_element(5, -2);
    place_hexagon_cover_element(5, -1);
    place_hexagon_cover_element(5, 0);
    place_hexagon_cover_element(5, 1);
    place_hexagon_cover_element(5, 2);
    place_hexagon_cover_element(5, 3);
    place_hexagon_cover_element(5, 4);
    place_hexagon_cover_element(5, 5);

    place_hexagon_cover_element(6, -2);
    place_hexagon_cover_element_led(6, -1);
    place_hexagon_cover_element(6, 0);
    place_hexagon_cover_element_led(6, 1);
    place_hexagon_cover_element_led(6, 2);
    place_hexagon_cover_element_led(6, 3);
    place_hexagon_cover_element_led(6, 4);
    place_hexagon_cover_element(6, 5);

    place_hexagon_cover_element(7, -1);
    place_hexagon_cover_element(7, 0);
    place_hexagon_cover_element_led(7, 1);
    place_hexagon_cover_element_led(7, 2);
    place_hexagon_cover_element_led(7, 3);
    place_hexagon_cover_element_led(7, 4);
    place_hexagon_cover_element_led(7, 5);
    place_hexagon_cover_element(7, 6);

    place_hexagon_cover_element(8, -2);
    place_hexagon_cover_element_led(8, -1);
    place_hexagon_cover_element(8, 0);
    place_hexagon_cover_element_led(8, 1);
    place_hexagon_cover_element_led(8, 2);
    place_hexagon_cover_element_led(8, 3);
    place_hexagon_cover_element_led(8, 4);
    place_hexagon_cover_element(8, 5);

    place_hexagon_cover_element(9, -2);
    place_hexagon_cover_element(9, -1);
    place_hexagon_cover_element(9, 0);
    place_hexagon_cover_element(9, 1);
    place_hexagon_cover_element(9, 2);
    place_hexagon_cover_element(9, 3);
    place_hexagon_cover_element(9, 4);
    place_hexagon_cover_element(9, 5);

    place_hexagon_cover_element(10, -2);
    place_hexagon_cover_element_led(10, -1);
    place_hexagon_cover_element(10, 0);
    place_hexagon_cover_element_led(10, 1);
    place_hexagon_cover_element(10, 2);
    place_hexagon_cover_element_led(10, 3);
    place_hexagon_cover_element(10, 4);
    *place_hexagon_cover_element(10, 5);

    place_hexagon_cover_element(11, -1);
    place_hexagon_cover_element(11, 0);
    place_hexagon_cover_element(11, 1);
    place_hexagon_cover_element(11, 2);
    place_hexagon_cover_element(11, 3);
    place_hexagon_cover_element(11, 4);
    place_hexagon_cover_element(11, 5);

    place_hexagon_cover_element(12, -2);
    place_hexagon_cover_element_led(12, -1);
    place_hexagon_cover_element(12, 0);
    place_hexagon_cover_element_led(12, 1);
    place_hexagon_cover_element_led(12, 2);
    place_hexagon_cover_element_led(12, 3);
    place_hexagon_cover_element_led(12, 4);
    place_hexagon_cover_element(12, 5);

    *place_hexagon_cover_element(13, -2);
    place_hexagon_cover_element(13, -1);
    place_hexagon_cover_element(13, 0);
    place_hexagon_cover_element_led(13, 1);
    place_hexagon_cover_element_led(13, 2);
    place_hexagon_cover_element_led(13, 3);
    place_hexagon_cover_element_led(13, 4);
    place_hexagon_cover_element_led(13, 5);
    place_hexagon_cover_element(13, 6);

    place_hexagon_cover_element(14, -2);
    place_hexagon_cover_element_led(14, -1);
    place_hexagon_cover_element(14, 0);
    place_hexagon_cover_element_led(14, 1);
    place_hexagon_cover_element_led(14, 2);
    place_hexagon_cover_element_led(14, 3);
    place_hexagon_cover_element_led(14, 4);
    place_hexagon_cover_element(14, 5);

    place_hexagon_cover_element(15, -1);
    place_hexagon_cover_element(15, 0);
    place_hexagon_cover_element(15, 1);
    place_hexagon_cover_element(15, 2);
    place_hexagon_cover_element(15, 3);
    place_hexagon_cover_element(15, 4);
    place_hexagon_cover_element(15, 5);

    place_hexagon_cover_element(16, -2);
    place_hexagon_cover_element_led(16, -1);
    place_hexagon_cover_element(16, 0);
    place_hexagon_cover_element_led(16, 1);
    place_hexagon_cover_element_led(16, 2);
    place_hexagon_cover_element_led(16, 3);
    place_hexagon_cover_element_led(16, 4);
    place_hexagon_cover_element(16, 5);

    place_hexagon_cover_element(17, -1);
    place_hexagon_cover_element(17, 0);
    place_hexagon_cover_element_led(17, 1);
    place_hexagon_cover_element_led(17, 2);
    place_hexagon_cover_element_led(17, 3);
    place_hexagon_cover_element_led(17, 4);
    place_hexagon_cover_element_led(17, 5);
    place_hexagon_cover_element(17, 6);

    place_hexagon_cover_element(18, -1);
    place_hexagon_cover_element(18, 0);
    place_hexagon_cover_element_led(18, 1);
    place_hexagon_cover_element_led(18, 2);
    place_hexagon_cover_element_led(18, 3);
    place_hexagon_cover_element_led(18, 4);
    place_hexagon_cover_element(18, 5);

    place_hexagon_cover_element(19, 1);
    place_hexagon_cover_element(19, 2);
    place_hexagon_cover_element(19, 3);
    place_hexagon_cover_element(19, 4);
    place_hexagon_cover_element(19, 5);

    place_hexagon_cover_element(20, 2);
    place_hexagon_cover_element(20, 3);
    place_hexagon_cover_element(20, 4);
    
    // mounts
    place_hexagon_cover_element_m3_mount(0, 2);
    place_hexagon_cover_element_m3_mount(5, -2);
    place_hexagon_cover_element_m3_mount(5, 6);
    place_hexagon_cover_element_m3_mount(10, 5);
    place_hexagon_cover_element_m3_mount(13, -2);
    place_hexagon_cover_element_m3_mount(15, 6);
    place_hexagon_cover_element_m3_mount(20, 4);
}

// - backlight ------------------
// red leds: 52
// yellow leds: 36
// white leds: 46
// total nb leds: 134
module display_backlight_cover() {
    *place_hexagon_cover_element(0, 0);
    place_hexagon_cover_element(0, 1);
    place_hexagon_cover_element(0, 2);
    place_hexagon_cover_element(0, 3);
    place_hexagon_cover_element(0, 4);
    *place_hexagon_cover_element(0, 5);

    place_hexagon_cover_element(1, 0);
    place_hexagon_cover_element_led(1, 1, "Red");
    place_hexagon_cover_element_led(1, 2, "Red");
    place_hexagon_cover_element_led(1, 3, "Red");
    place_hexagon_cover_element_led(1, 4, "Red");
    place_hexagon_cover_element_led(1, 5, "Red");
    place_hexagon_cover_element(1, 6);

    place_hexagon_cover_element(2, -1);
    place_hexagon_cover_element_led(2, 0, "Red");
    place_hexagon_cover_element_led(2, 1, "Red");
    place_hexagon_cover_element_led(2, 2, "Red");
    place_hexagon_cover_element_led(2, 3, "Red");
    place_hexagon_cover_element_led(2, 4, "Red");
    place_hexagon_cover_element_led(2, 5, "Red");
    place_hexagon_cover_element(2, 6);

    place_hexagon_cover_element(3, -1);
    place_hexagon_cover_element_led(3, 0, "Red");
    place_hexagon_cover_element_led(3, 1, "Red");
    place_hexagon_cover_element_led(3, 2, "Yellow");
    place_hexagon_cover_element_led(3, 3, "Yellow");
    place_hexagon_cover_element_led(3, 4, "Yellow");
    place_hexagon_cover_element_led(3, 5, "Red");
    place_hexagon_cover_element_led(3,6, "Red");
    place_hexagon_cover_element(3, 7);

    place_hexagon_cover_element(4, -2);
    place_hexagon_cover_element_led(4, -1, "Red");
    place_hexagon_cover_element_led(4, 0, "Red");
    place_hexagon_cover_element_led(4, 1, "Yellow");
    place_hexagon_cover_element_led(4, 2, "Yellow");
    place_hexagon_cover_element_led(4, 3, "Yellow");
    place_hexagon_cover_element_led(4, 4, "Yellow");
    place_hexagon_cover_element_led(4, 5, "Red");
    place_hexagon_cover_element_led(4, 6, "Red");
    place_hexagon_cover_element(4, 7);

    place_hexagon_cover_element(5, -1);
    place_hexagon_cover_element_led(5, 0, "Red");
    place_hexagon_cover_element_led(5, 1, "Yellow");
    place_hexagon_cover_element_led(5, 2, "White");
    place_hexagon_cover_element_led(5, 3, "White");
    place_hexagon_cover_element_led(5, 4, "White");
    place_hexagon_cover_element_led(5, 5, "Yellow");
    place_hexagon_cover_element_led(5, 6, "Red");
    place_hexagon_cover_element(5, 7);

    place_hexagon_cover_element(6, -2);
    place_hexagon_cover_element_led(6, -1, "Red");
    place_hexagon_cover_element_led(6, 0, "Yellow");
    place_hexagon_cover_element_led(6, 1, "White");
    place_hexagon_cover_element_led(6, 2, "White");
    place_hexagon_cover_element_led(6, 3, "White");
    place_hexagon_cover_element_led(6, 4, "White");
    place_hexagon_cover_element_led(6, 5, "Yellow");
    place_hexagon_cover_element_led(6, 6, "Red");
    place_hexagon_cover_element(6, 7);

    place_hexagon_cover_element(7, -1);
    place_hexagon_cover_element_led(7, 0, "Yellow");
    place_hexagon_cover_element_led(7, 1, "White");
    place_hexagon_cover_element_led(7, 2, "White");
    place_hexagon_cover_element_led(7, 3, "White");
    place_hexagon_cover_element_led(7, 4, "White");
    place_hexagon_cover_element_led(7, 5, "White");
    place_hexagon_cover_element_led(7, 6, "Yellow");
    place_hexagon_cover_element(7, 7);

    place_hexagon_cover_element(8, -2);
    place_hexagon_cover_element_led(8, -1, "Red");
    place_hexagon_cover_element_led(8, 0, "Yellow");
    place_hexagon_cover_element_led(8, 1, "White");
    place_hexagon_cover_element_led(8, 2, "White");
    place_hexagon_cover_element_led(8, 3, "White");
    place_hexagon_cover_element_led(8, 4, "White");
    place_hexagon_cover_element_led(8, 5, "Yellow");
    place_hexagon_cover_element_led(8, 6, "Red");
    place_hexagon_cover_element(8, 7);

    place_hexagon_cover_element(9, -1);
    place_hexagon_cover_element_led(9, 0, "Yellow");
    place_hexagon_cover_element_led(9, 1, "White");
    place_hexagon_cover_element_led(9, 2, "White");
    place_hexagon_cover_element_led(9, 3, "White");
    place_hexagon_cover_element_led(9, 4, "White");
    place_hexagon_cover_element_led(9, 5, "White");
    place_hexagon_cover_element_led(9, 6, "Yellow");
    place_hexagon_cover_element(9, 7);

    *place_hexagon_cover_element(10, -2);
    place_hexagon_cover_element_led(10, -1, "Red");
    place_hexagon_cover_element_led(10, 0, "Yellow");
    place_hexagon_cover_element_led(10, 1, "White");
    place_hexagon_cover_element_led(10, 2, "White");
    place_hexagon_cover_element_led(10, 3, "White");
    place_hexagon_cover_element_led(10, 4, "White");
    place_hexagon_cover_element_led(10, 5, "Yellow");
    place_hexagon_cover_element_led(10, 6, "Red");
    *place_hexagon_cover_element(10, 7);

    place_hexagon_cover_element(11, -1);
    place_hexagon_cover_element_led(11, 0, "Yellow");
    place_hexagon_cover_element_led(11, 1, "White");
    place_hexagon_cover_element_led(11, 2, "White");
    place_hexagon_cover_element_led(11, 3, "White");
    place_hexagon_cover_element_led(11, 4, "White");
    place_hexagon_cover_element_led(11, 5, "White");
    place_hexagon_cover_element_led(11, 6, "Yellow");
    place_hexagon_cover_element(11, 7);

    place_hexagon_cover_element(12, -2);
    place_hexagon_cover_element_led(12, -1, "Red");
    place_hexagon_cover_element_led(12, 0, "Yellow");
    place_hexagon_cover_element_led(12, 1, "White");
    place_hexagon_cover_element_led(12, 2, "White");
    place_hexagon_cover_element_led(12, 3, "White");
    place_hexagon_cover_element_led(12, 4, "White");
    place_hexagon_cover_element_led(12, 5, "Yellow");
    place_hexagon_cover_element_led(12, 6, "Red");
    place_hexagon_cover_element(12, 7);

    place_hexagon_cover_element(13, -1);
    place_hexagon_cover_element_led(13, 0, "Yellow");
    place_hexagon_cover_element_led(13, 1, "White");
    place_hexagon_cover_element_led(13, 2, "White");
    place_hexagon_cover_element_led(13, 3, "White");
    place_hexagon_cover_element_led(13, 4, "White");
    place_hexagon_cover_element_led(13, 5, "White");
    place_hexagon_cover_element_led(13, 6, "Yellow");
    place_hexagon_cover_element(13, 7);

    place_hexagon_cover_element(14, -2);
    place_hexagon_cover_element_led(14, -1, "Red");
    place_hexagon_cover_element_led(14, 0, "Yellow");
    place_hexagon_cover_element_led(14, 1, "White");
    place_hexagon_cover_element_led(14, 2, "White");
    place_hexagon_cover_element_led(14, 3, "White");
    place_hexagon_cover_element_led(14, 4, "White");
    place_hexagon_cover_element_led(14, 5, "Yellow");
    place_hexagon_cover_element_led(14, 6, "Red");
    place_hexagon_cover_element(14, 7);

    place_hexagon_cover_element(15, -1);
    place_hexagon_cover_element_led(15, 0, "Red");
    place_hexagon_cover_element_led(15, 1, "Yellow");
    place_hexagon_cover_element_led(15, 2, "White");
    place_hexagon_cover_element_led(15, 3, "White");
    place_hexagon_cover_element_led(15, 4, "White");
    place_hexagon_cover_element_led(15, 5, "Yellow");
    place_hexagon_cover_element_led(15, 6, "Red");
    place_hexagon_cover_element(15, 7);

    place_hexagon_cover_element(16, -2);
    place_hexagon_cover_element_led(16, -1, "Red");
    place_hexagon_cover_element_led(16, 0, "Red");
    place_hexagon_cover_element_led(16, 1, "Yellow");
    place_hexagon_cover_element_led(16, 2, "Yellow");
    place_hexagon_cover_element_led(16, 3, "Yellow");
    place_hexagon_cover_element_led(16, 4, "Yellow");
    place_hexagon_cover_element_led(16, 5, "Red");
    place_hexagon_cover_element_led(16, 6, "Red");
    place_hexagon_cover_element(16, 7);

    place_hexagon_cover_element(17, -1);
    place_hexagon_cover_element_led(17, 0, "Red");
    place_hexagon_cover_element_led(17, 1, "Red");
    place_hexagon_cover_element_led(17, 2, "Yellow");
    place_hexagon_cover_element_led(17, 3, "Yellow");
    place_hexagon_cover_element_led(17, 4, "Yellow");
    place_hexagon_cover_element_led(17, 5, "Red");
    place_hexagon_cover_element_led(17, 6, "Red");
    place_hexagon_cover_element(17, 7);

    place_hexagon_cover_element(18, -1);
    place_hexagon_cover_element_led(18, 0, "Red");
    place_hexagon_cover_element_led(18, 1, "Red");
    place_hexagon_cover_element_led(18, 2, "Red");
    place_hexagon_cover_element_led(18, 3, "Red");
    place_hexagon_cover_element_led(18, 4, "Red");
    place_hexagon_cover_element_led(18, 5, "Red");
    place_hexagon_cover_element(18, 6);

    place_hexagon_cover_element(19, 0);
    place_hexagon_cover_element_led(19, 1, "Red");
    place_hexagon_cover_element_led(19, 2, "Red");
    place_hexagon_cover_element_led(19, 3, "Red");
    place_hexagon_cover_element_led(19, 4, "Red");
    place_hexagon_cover_element_led(19, 5, "Red");
    place_hexagon_cover_element(19, 6);

    *place_hexagon_cover_element(20, 0);
    place_hexagon_cover_element(20, 1);
    place_hexagon_cover_element(20, 2);
    place_hexagon_cover_element(20, 3);
    place_hexagon_cover_element(20, 4);
    *place_hexagon_cover_element(20, 5);

    // mounts
    place_hexagon_cover_element_m3_mount(0, 0);
    place_hexagon_cover_element_m3_mount(0, 5);
    place_hexagon_cover_element_m3_mount(10, -2);
    place_hexagon_cover_element_m3_mount(10, 7);
    place_hexagon_cover_element_m3_mount(20, 0);
    place_hexagon_cover_element_m3_mount(20, 5);
}

// - display ------------------
// red leds: 8*4 + 4*5 + 2 + 7 = 61
// control individualy
// white leds: 37 
// control together
module display_backlight_cover2() {
    place_hexagon_cover_element(0, 0);
    place_hexagon_cover_element(0, 1);
    *place_hexagon_cover_element(0, 2);
    
    place_hexagon_cover_element(1, -1);
    place_hexagon_cover_element(1, 0);
    place_hexagon_cover_element_led(1, 1, "white");
    place_hexagon_cover_element_led(1, 2, "white");
    place_hexagon_cover_element(1, 3);
    place_hexagon_cover_element(1, 4);
    place_hexagon_cover_element(1, 5);

    place_hexagon_cover_element(2, -1);
    place_hexagon_cover_element_led(2, 0, "white");
    place_hexagon_cover_element_led(2, 1);
    place_hexagon_cover_element_led(2, 2);
    place_hexagon_cover_element_led(2, 3);
    place_hexagon_cover_element_led(2, 4);
    place_hexagon_cover_element(2, 5);

    place_hexagon_cover_element(3, -1);
    place_hexagon_cover_element_led(3, 0, "white");
    place_hexagon_cover_element_led(3, 1);
    place_hexagon_cover_element_led(3, 2);
    place_hexagon_cover_element_led(3, 3);
    place_hexagon_cover_element_led(3, 4);
    place_hexagon_cover_element_led(3, 5);
    place_hexagon_cover_element(3, 6);

    place_hexagon_cover_element(4, -2);
    place_hexagon_cover_element_led(4, -1);
    place_hexagon_cover_element_led(4, 0, "white");
    place_hexagon_cover_element_led(4, 1);
    place_hexagon_cover_element_led(4, 2);
    place_hexagon_cover_element_led(4, 3);
    place_hexagon_cover_element_led(4, 4);
    place_hexagon_cover_element(4, 5);

    *place_hexagon_cover_element(5, -2);
    place_hexagon_cover_element(5, -1);
    place_hexagon_cover_element_led(5, 0, "white");
    place_hexagon_cover_element_led(5, 1, "white");
    place_hexagon_cover_element_led(5, 2, "white");
    place_hexagon_cover_element_led(5, 3, "white");
    place_hexagon_cover_element_led(5, 4, "white");
    place_hexagon_cover_element(5, 5);

    place_hexagon_cover_element(6, -2);
    place_hexagon_cover_element_led(6, -1);
    place_hexagon_cover_element_led(6, 0, "white");
    place_hexagon_cover_element_led(6, 1);
    place_hexagon_cover_element_led(6, 2);
    place_hexagon_cover_element_led(6, 3);
    place_hexagon_cover_element_led(6, 4);
    place_hexagon_cover_element(6, 5);

    place_hexagon_cover_element(7, -1);
    place_hexagon_cover_element_led(7, 0, "white");
    place_hexagon_cover_element_led(7, 1);
    place_hexagon_cover_element_led(7, 2);
    place_hexagon_cover_element_led(7, 3);
    place_hexagon_cover_element_led(7, 4);
    place_hexagon_cover_element_led(7, 5);
    place_hexagon_cover_element(7, 6);

    place_hexagon_cover_element(8, -2);
    place_hexagon_cover_element_led(8, -1);
    place_hexagon_cover_element_led(8, 0, "white");
    place_hexagon_cover_element_led(8, 1);
    place_hexagon_cover_element_led(8, 2);
    place_hexagon_cover_element_led(8, 3);
    place_hexagon_cover_element_led(8, 4);
    place_hexagon_cover_element(8, 5);

    place_hexagon_cover_element(9, -2);
    place_hexagon_cover_element_led(9, -1, "white");
    place_hexagon_cover_element_led(9, 0, "white");
    place_hexagon_cover_element_led(9, 1, "white");
    place_hexagon_cover_element_led(9, 2, "white");
    place_hexagon_cover_element_led(9, 3, "white");
    place_hexagon_cover_element_led(9, 4, "white");
    place_hexagon_cover_element(9, 5);

    place_hexagon_cover_element(10, -2);
    place_hexagon_cover_element_led(10, -1);
    place_hexagon_cover_element_led(10, 0, "white");
    place_hexagon_cover_element_led(10, 1);
    place_hexagon_cover_element_led(10, 2, "white");
    place_hexagon_cover_element_led(10, 3);
    place_hexagon_cover_element(10, 4);
    *place_hexagon_cover_element(10, 5);

    place_hexagon_cover_element(11, -1);
    place_hexagon_cover_element_led(11, 0, "white");
    place_hexagon_cover_element_led(11, 1, "white");
    place_hexagon_cover_element_led(11, 2, "white");
    place_hexagon_cover_element_led(11, 3, "white");
    place_hexagon_cover_element_led(11, 4, "white");
    place_hexagon_cover_element(11, 5);

    place_hexagon_cover_element(12, -2);
    place_hexagon_cover_element_led(12, -1);
    place_hexagon_cover_element_led(12, 0, "white");
    place_hexagon_cover_element_led(12, 1);
    place_hexagon_cover_element_led(12, 2);
    place_hexagon_cover_element_led(12, 3);
    place_hexagon_cover_element_led(12, 4);
    place_hexagon_cover_element(12, 5);

    *place_hexagon_cover_element(13, -2);
    place_hexagon_cover_element(13, -1);
    place_hexagon_cover_element_led(13, 0, "white");
    place_hexagon_cover_element_led(13, 1);
    place_hexagon_cover_element_led(13, 2);
    place_hexagon_cover_element_led(13, 3);
    place_hexagon_cover_element_led(13, 4);
    place_hexagon_cover_element_led(13, 5);
    place_hexagon_cover_element(13, 6);

    place_hexagon_cover_element(14, -2);
    place_hexagon_cover_element_led(14, -1);
    place_hexagon_cover_element_led(14, 0, "white");
    place_hexagon_cover_element_led(14, 1);
    place_hexagon_cover_element_led(14, 2);
    place_hexagon_cover_element_led(14, 3);
    place_hexagon_cover_element_led(14, 4);
    place_hexagon_cover_element(14, 5);

    place_hexagon_cover_element(15, -1);
    place_hexagon_cover_element_led(15, 0, "white");
    place_hexagon_cover_element_led(15, 1, "white");
    place_hexagon_cover_element_led(15, 2, "white");
    place_hexagon_cover_element_led(15, 3, "white");
    place_hexagon_cover_element_led(15, 4, "white");
    place_hexagon_cover_element(15, 5);

    place_hexagon_cover_element(16, -2);
    place_hexagon_cover_element_led(16, -1);
    place_hexagon_cover_element_led(16, 0, "white");
    place_hexagon_cover_element_led(16, 1);
    place_hexagon_cover_element_led(16, 2);
    place_hexagon_cover_element_led(16, 3);
    place_hexagon_cover_element_led(16, 4);
    place_hexagon_cover_element(16, 5);

    place_hexagon_cover_element(17, -1);
    place_hexagon_cover_element_led(17, 0, "white");
    place_hexagon_cover_element_led(17, 1);
    place_hexagon_cover_element_led(17, 2);
    place_hexagon_cover_element_led(17, 3);
    place_hexagon_cover_element_led(17, 4);
    place_hexagon_cover_element_led(17, 5);
    place_hexagon_cover_element(17, 6);

    place_hexagon_cover_element(18, -1);
    place_hexagon_cover_element(18, 0);
    place_hexagon_cover_element_led(18, 1);
    place_hexagon_cover_element_led(18, 2);
    place_hexagon_cover_element_led(18, 3);
    place_hexagon_cover_element_led(18, 4);
    place_hexagon_cover_element(18, 5);

    place_hexagon_cover_element(19, 1);
    place_hexagon_cover_element(19, 2);
    place_hexagon_cover_element_led(19, 3, "white");
    place_hexagon_cover_element_led(19, 4, "white");
    place_hexagon_cover_element(19, 5);

    place_hexagon_cover_element(20, 2);
    place_hexagon_cover_element(20, 3);
    place_hexagon_cover_element(20, 4);
    
    // mounts
    place_hexagon_cover_element_m3_mount(0, 2);
    place_hexagon_cover_element_m3_mount(5, -2);
    place_hexagon_cover_element_m3_mount(5, 6);
    place_hexagon_cover_element_m3_mount(10, 5);
    place_hexagon_cover_element_m3_mount(13, -2);
    place_hexagon_cover_element_m3_mount(15, 6);
    place_hexagon_cover_element_m3_mount(20, 4);
}


// - spacer ---------------------------
module led_spacer() {
    *place_hexagon_rest_element(0, 0);
    place_hexagon_rest_element(0, 1);
    place_hexagon_rest_element(0, 2);
    place_hexagon_rest_element(0, 3);
    place_hexagon_rest_element(0, 4);
    *place_hexagon_rest_element(0, 5);

    place_hexagon_rest_element(1, 0);
    place_hexagon_rest_element(1, 1);
    place_hexagon_rest_element(1, 2);
    place_hexagon_rest_element(1, 3);
    place_hexagon_rest_element(1, 4);
    place_hexagon_rest_element(1, 5);
    place_hexagon_rest_element(1, 6);

    place_hexagon_rest_element(2, -1);
    place_hexagon_rest_element(2, 0);
    place_hexagon_rest_element(2, 1);
    place_hexagon_rest_element(2, 2);
    place_hexagon_rest_element(2, 3);
    place_hexagon_rest_element(2, 4);
    place_hexagon_rest_element(2, 5);
    place_hexagon_rest_element(2, 6);

    place_hexagon_rest_element(3, -1);
    place_hexagon_rest_element(3, 0);
    place_hexagon_rest_element(3, 1);
    place_hexagon_rest_element(3, 2);
    place_hexagon_rest_element(3, 3);
    place_hexagon_rest_element(3, 4);
    place_hexagon_rest_element(3, 5);
    place_hexagon_rest_element(3, 6);
    place_hexagon_rest_element(3, 7);

    place_hexagon_rest_element(4, -2);
    place_hexagon_rest_element(4, -1);
    place_hexagon_rest_element(4, 0);
    place_hexagon_rest_element(4, 1);
    place_hexagon_rest_element(4, 2);
    place_hexagon_rest_element(4, 3);
    place_hexagon_rest_element(4, 4);
    place_hexagon_rest_element(4, 5);
    place_hexagon_rest_element(4, 6);
    place_hexagon_rest_element(4, 7);

    place_hexagon_rest_element(5, -1);
    place_hexagon_rest_element(5, 0);
    place_hexagon_rest_element(5, 1);
    place_hexagon_rest_element(5, 2);
    place_hexagon_rest_element(5, 3);
    place_hexagon_rest_element(5, 4);
    place_hexagon_rest_element(5, 5);
    place_hexagon_rest_element(5, 6);
    place_hexagon_rest_element(5, 7);

    place_hexagon_rest_element(6, -2);
    place_hexagon_rest_element(6, -1);
    place_hexagon_rest_element(6, 0);
    place_hexagon_rest_element(6, 1);
    place_hexagon_rest_element(6, 2);
    place_hexagon_rest_element(6, 3);
    place_hexagon_rest_element(6, 4);
    place_hexagon_rest_element(6, 5);
    place_hexagon_rest_element(6, 6);
    place_hexagon_rest_element(6, 7);

    place_hexagon_rest_element(7, -1);
    place_hexagon_rest_element(7, 0);
    place_hexagon_rest_element(7, 1);
    place_hexagon_rest_element(7, 2);
    place_hexagon_rest_element(7, 3);
    place_hexagon_rest_element(7, 4);
    place_hexagon_rest_element(7, 5);
    place_hexagon_rest_element(7, 6);
    place_hexagon_rest_element(7, 7);

    place_hexagon_rest_element(8, -2);
    place_hexagon_rest_element(8, -1);
    place_hexagon_rest_element(8, 0);
    place_hexagon_rest_element(8, 1);
    place_hexagon_rest_element(8, 2);
    place_hexagon_rest_element(8, 3);
    place_hexagon_rest_element(8, 4);
    place_hexagon_rest_element(8, 5);
    place_hexagon_rest_element(8, 6);
    place_hexagon_rest_element(8, 7);

    place_hexagon_rest_element(9, -1);
    place_hexagon_rest_element(9, 0);
    place_hexagon_rest_element(9, 1);
    place_hexagon_rest_element(9, 2);
    place_hexagon_rest_element(9, 3);
    place_hexagon_rest_element(9, 4);
    place_hexagon_rest_element(9, 5);
    place_hexagon_rest_element(9, 6);
    place_hexagon_rest_element(9, 7);

    place_hexagon_rest_element(10, -2);
    place_hexagon_rest_element(10, -1);
    place_hexagon_rest_element(10, 0);
    place_hexagon_rest_element(10, 1);
    place_hexagon_rest_element(10, 2);
    place_hexagon_rest_element(10, 3);
    place_hexagon_rest_element(10, 4);
    place_hexagon_rest_element(10, 5);
    place_hexagon_rest_element(10, 6);
    place_hexagon_rest_element(10, 7);

    place_hexagon_rest_element(11, -1);
    place_hexagon_rest_element(11, 0);
    place_hexagon_rest_element(11, 1);
    place_hexagon_rest_element(11, 2);
    place_hexagon_rest_element(11, 3);
    place_hexagon_rest_element(11, 4);
    place_hexagon_rest_element(11, 5);
    place_hexagon_rest_element(11, 6);
    place_hexagon_rest_element(11, 7);

    place_hexagon_rest_element(12, -2);
    place_hexagon_rest_element(12, -1);
    place_hexagon_rest_element(12, 0);
    place_hexagon_rest_element(12, 1);
    place_hexagon_rest_element(12, 2);
    place_hexagon_rest_element(12, 3);
    place_hexagon_rest_element(12, 4);
    place_hexagon_rest_element(12, 5);
    place_hexagon_rest_element(12, 6);
    place_hexagon_rest_element(12, 7);

    place_hexagon_rest_element(13, -1);
    place_hexagon_rest_element(13, 0);
    place_hexagon_rest_element(13, 1);
    place_hexagon_rest_element(13, 2);
    place_hexagon_rest_element(13, 3);
    place_hexagon_rest_element(13, 4);
    place_hexagon_rest_element(13, 5);
    place_hexagon_rest_element(13, 6);
    place_hexagon_rest_element(13, 7);

    place_hexagon_rest_element(14, -2);
    place_hexagon_rest_element(14, -1);
    place_hexagon_rest_element(14, 0);
    place_hexagon_rest_element(14, 1);
    place_hexagon_rest_element(14, 2);
    place_hexagon_rest_element(14, 3);
    place_hexagon_rest_element(14, 4);
    place_hexagon_rest_element(14, 5);
    place_hexagon_rest_element(14, 6);
    place_hexagon_rest_element(14, 7);

    place_hexagon_rest_element(15, -1);
    place_hexagon_rest_element(15, 0);
    place_hexagon_rest_element(15, 1);
    place_hexagon_rest_element(15, 2);
    place_hexagon_rest_element(15, 3);
    place_hexagon_rest_element(15, 4);
    place_hexagon_rest_element(15, 5);
    place_hexagon_rest_element(15, 6);
    place_hexagon_rest_element(15, 7);

    place_hexagon_rest_element(16, -2);
    place_hexagon_rest_element(16, -1);
    place_hexagon_rest_element(16, 0);
    place_hexagon_rest_element(16, 1);
    place_hexagon_rest_element(16, 2);
    place_hexagon_rest_element(16, 3);
    place_hexagon_rest_element(16, 4);
    place_hexagon_rest_element(16, 5);
    place_hexagon_rest_element(16, 6);
    place_hexagon_rest_element(16, 7);

    place_hexagon_rest_element(17, -1);
    place_hexagon_rest_element(17, 0);
    place_hexagon_rest_element(17, 1);
    place_hexagon_rest_element(17, 2);
    place_hexagon_rest_element(17, 3);
    place_hexagon_rest_element(17, 4);
    place_hexagon_rest_element(17, 5);
    place_hexagon_rest_element(17, 6);
    place_hexagon_rest_element(17, 7);

    place_hexagon_rest_element(18, -1);
    place_hexagon_rest_element(18, 0);
    place_hexagon_rest_element(18, 1);
    place_hexagon_rest_element(18, 2);
    place_hexagon_rest_element(18, 3);
    place_hexagon_rest_element(18, 4);
    place_hexagon_rest_element(18, 5);
    place_hexagon_rest_element(18, 6);

    place_hexagon_rest_element(19, 0);
    place_hexagon_rest_element(19, 1);
    place_hexagon_rest_element(19, 2);
    place_hexagon_rest_element(19, 3);
    place_hexagon_rest_element(19, 4);
    place_hexagon_rest_element(19, 5);
    place_hexagon_rest_element(19, 6);

    *place_hexagon_rest_element(20, 0);
    place_hexagon_rest_element(20, 1);
    place_hexagon_rest_element(20, 2);
    place_hexagon_rest_element(20, 3);
    place_hexagon_rest_element(20, 4);
    *place_hexagon_rest_element(20, 5);

    // mounts
    place_hexagon_rest_element_m3_mount(0, 0);
    place_hexagon_rest_element_m3_mount(0, 5);
    place_hexagon_rest_element_m3_mount(20, 0);
    place_hexagon_rest_element_m3_mount(20, 5);
}

*plain_display_cover();
*display_clock_cover2();
display_backlight_cover2();
*led_spacer();