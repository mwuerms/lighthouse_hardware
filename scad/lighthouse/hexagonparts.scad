/**
 * Martin Egli
 * 2024-05-25
 */

use <ledparts.scad>

hex_rad = 8/2;
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


module hexagon_element(hex_rad1 = 10/2, hex_hi1 = 1, hex_res = 6) {
    cylinder(r = hex_rad1, h = hex_hi1, $fn = hex_res);
}

module place_hexagon_element(x_pos = 0, y_pos = 0) {
    if((x_pos % 2) == 0) {
        // even column
        translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0])
        hexagon_element(hex_rad1 = hex_rad);
    }
    else {
        // odd column
        translate([x_pos*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0])
        hexagon_element(hex_rad1 = hex_rad);
    }
}

module hexagon_edge_element(hex_rad1 = 10/2, hex_hi1 = 1, hex_res = 6) {
    //translate([-hex_rad1, -hex_rad1*cos(30), 0])
    //cube([2*hex_rad1, 2*hex_rad1*cos(30), hex_hi1]);
    translate([-hex_rad1, -hex_rad1, 0])
    cube([2*hex_rad1, 2*hex_rad1, hex_hi1]);
}

module place_hexagon_edge_element(x_pos = 0, y_pos = 0) {
    if((x_pos % 2) == 0) {
        // even column
        translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0])
        hexagon_edge_element(hex_rad1 = hex_rad);
    }
    else {
        // odd column
        translate([x_pos*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0])
        hexagon_edge_element(hex_rad1 = hex_rad);
    }
}

module hexagon_upper_round_edge_element(hex_rad1 = 10/2, hex_hi1 = 1, loc_res = 32) {
    translate([-hex_rad1, +hex_rad1, hex_hi1/2])
    rotate([0, 90, 0])
    cylinder(d = hex_hi1, h = hex_rad1*2, $fn = loc_res);
}
hexagon_upper_round_edge_element();

module place_hexagon_upper_round_edge_element(x_pos = 0, y_pos = 0) {
    if((x_pos % 2) == 0) {
        // even column
        translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0])
        hexagon_upper_round_edge_element(hex_rad1 = hex_rad);
    }
    else {
        // odd column
        translate([x_pos*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0])
        hexagon_upper_round_edge_element(hex_rad1 = hex_rad);
    }
}

module hexagon_lower_round_edge_element(hex_rad1 = 10/2, hex_hi1 = 1, loc_res = 32) {
    translate([-hex_rad1, -hex_rad1, hex_hi1/2])
    rotate([0, 90, 0])
    cylinder(d = hex_hi1, h = hex_rad1*2, $fn = loc_res);
}
hexagon_lower_round_edge_element();

module place_hexagon_lower_round_edge_element(x_pos = 0, y_pos = 0) {
    if((x_pos % 2) == 0) {
        // even column
        translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0])
        hexagon_lower_round_edge_element(hex_rad1 = hex_rad);
    }
    else {
        // odd column
        translate([x_pos*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0])
        hexagon_lower_round_edge_element(hex_rad1 = hex_rad);
    }
}

module hexagon_cover_element(hex_rad1 = 10/2, hex_hi1 = 0.6, hex_res = 6) {
    cylinder(r = hex_rad1, h = hex_hi1, $fn = hex_res);
    cylinder(r = hex_rad1-0.8, h = hex_hi1+0.2, $fn = hex_res);
}

module place_hexagon_cover_element(x_pos = 0, y_pos = 0) {
    if((x_pos % 2) == 0) {
        // even column
        translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0])
        hexagon_cover_element(hex_rad1 = hex_rad);
    }
    else {
        // odd column
        translate([x_pos*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0])
        hexagon_cover_element(hex_rad1 = hex_rad);
    }
}

module hexagon_cover_middle_element(hex_rad1 = 10/2, hex_hi1 = 0.6, hex_res = 6) {
    cylinder(r = hex_rad1-0.8, h = hex_hi1+0.2, $fn = hex_res);
}

module place_hexagon_cover_middle_element(x_pos = 0, y_pos = 0) {
    if((x_pos % 2) == 0) {
        // even column
        translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0])
        hexagon_cover_middle_element(hex_rad1 = hex_rad);
    }
    else {
        // odd column
        translate([x_pos*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0])
        hexagon_cover_middle_element(hex_rad1 = hex_rad);
    }
}

module hexagon_cover_element_cut(hex_rad1 = 10/2, hex_hi1 = 20, hex_res = 6) {
    translate([0, 0, -10])
    cylinder(r = hex_rad1+0.15, h = hex_hi1, $fn = hex_res);
}

module place_hexagon_cover_element_cut(x_pos = 0, y_pos = 0) {
    if((x_pos % 2) == 0) {
        // even column
        translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0])
        hexagon_cover_element_cut(hex_rad1 = hex_rad);
    }
    else {
        // odd column
        translate([x_pos*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0])
        hexagon_cover_element_cut(hex_rad1 = hex_rad);
    }
}

module hexagon_cover_element_led(hex_rad1 = 10/2, hex_hi1 = 0.6, col = "Red", hex_res = 6) {
    cylinder(r = hex_rad1, h = hex_hi1, $fn = hex_res);
    cylinder(r = hex_rad1-0.8, h = hex_hi1+0.2, $fn = hex_res);
    color(col)
    cylinder(r = hex_rad1-2, h = hex_hi1+0.4, $fn = hex_res);
}

module place_hexagon_cover_element_led(x_pos = 0, y_pos = 0, col = "Red") {
    if((x_pos % 2) == 0) {
        // even column
        translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0])
        hexagon_cover_element_led(hex_rad1 = hex_rad, col = col);
    }
    else {
        // odd column
        translate([x_pos*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0])
        hexagon_cover_element_led(hex_rad1 = hex_rad, col = col);
    }
}

module hexagon_cover_element_m3_mount(hex_rad1 = 10/2, hex_hi1 = 0.6, hex_hi2 = 5, hex_res = 6, loc_res = 32) {
    cylinder(r = hex_rad1, h = hex_hi1, $fn = hex_res);
    cylinder(r = hex_rad1-0.8, h = hex_hi1+0.2, $fn = hex_res);
    translate([0, 0, -5])
    difference() {
        cylinder(r = 5/2, h = hex_hi2, $fn = loc_res);
        translate([0, 0, -1])
        cylinder(r = 2.5/2, h = hex_hi2, $fn = loc_res);
    }
}

module place_hexagon_cover_element_m3_mount(x_pos = 0, y_pos = 0) {
    if((x_pos % 2) == 0) {
        // even column
        translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0])
        hexagon_cover_element_m3_mount(hex_rad1 = hex_rad);
    }
    else {
        // odd column
        translate([x_pos*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0])
        hexagon_cover_element_m3_mount(hex_rad1 = hex_rad);
    }
}

module m3_mount_cut(m3_dia = 3.2, hi1 = 10, loc_res = 32) {
    translate([0, 0, -10])
    cylinder(d = m3_dia, h = 15, $fn = loc_res);
}

module place_m3_mount_cut(x_pos = 0, y_pos = 0) {
    if((x_pos % 2) == 0) {
        // even column
        translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0])
        m3_mount_cut();
    }
    else {
        // odd column
        translate([x_pos*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0])
        m3_mount_cut();
    }
}

module hexagon_cover_element_m3_mount_cut(hex_rad1 = 10/2, hex_hi1 = 10, hex_res = 6, loc_res = 32) {
    cylinder(r = hex_rad1+0.15, h = hex_hi1, $fn = hex_res);
    translate([0, 0, -10])
    cylinder(r = (5+0.3)/2, h = 10.5, $fn = loc_res);
}

module place_hexagon_cover_element_m3_mount_cut(x_pos = 0, y_pos = 0) {
    if((x_pos % 2) == 0) {
        // even column
        translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0])
        hexagon_cover_element_m3_mount_cut(hex_rad1 = hex_rad);
    }
    else {
        // odd column
        translate([x_pos*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0])
        hexagon_cover_element_m3_mount_cut(hex_rad1 = hex_rad);
    }
}
module hexagon_spacer_element(hex_rad1 = 10/2, hex_hi = 6, wallth = 0.5, hex_res = 6) {
    difference() {
        cylinder(r = hex_rad1 + (wallth/2), h = hex_hi, $fn = hex_res);
        translate([0, 0, -1])
        cylinder(r = hex_rad1 - (wallth/2), h = hex_hi+2, $fn = hex_res);
    }
}

module hexagon_spacer_element_led2427_cut(hex_rad1 = 10/2, hex_hi = 6, wallth = 0.5, hex_res = 6) {
    difference() {
        cylinder(r = hex_rad1 + (wallth/2), h = hex_hi, $fn = hex_res);
        translate([0, 0, 0.4])
        cylinder(r = hex_rad1 - (wallth/2), h = hex_hi+2, $fn = hex_res);
        
        rgbled2427_cut();
    }
}

module place_hexagon_spacer_element(x_pos = 0, y_pos = 0) {
    if((x_pos % 2) == 0) {
        // even column
        translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0])
        hexagon_spacer_element(hex_rad1 = hex_rad);
        //hexagon_spacer_element_led2427_cut(hex_rad1 = hex_rad);
    }
    else {
        // odd column
        translate([x_pos*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0])
        hexagon_spacer_element(hex_rad1 = hex_rad);
        //hexagon_spacer_element_led2427_cut(hex_rad1 = hex_rad);
    }
}

module hexagon_spacer_element_m3_mount(hex_rad1 = 10/2, hex_hi = 1, wallth = 0.5, hex_res = 6, loc_res = 32) {
    difference() {
        cylinder(r = hex_rad1 + (wallth/2), h = hex_hi, $fn = hex_res);
        translate([0, 0, -1])
        cylinder(r = 3.2/2, h = hex_hi+2, $fn = loc_res);
    }
}

module place_hexagon_spacer_element_m3_mount(x_pos = 0, y_pos = 0) {
    if((x_pos % 2) == 0) {
        // even column
        translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0])
        hexagon_spacer_element_m3_mount(hex_rad1 = hex_rad);
    }
    else {
        // odd column
        translate([x_pos*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0])
        hexagon_spacer_element_m3_mount(hex_rad1 = hex_rad);
    }
}

