/**
 * Martin Egli
 * 2024-05-15
 */

// origin: center
module rgbled2427(loc_res = 32) {
    color("White")
    difference() {
        translate([-2.7/2, -2.4/2, 0])
        cube([2.7, 2.4, 1.1]);
        translate([0, 0, 1.0])
        cylinder(d = 2, h = 0.5, $fn = loc_res);
        translate([0, 2, 1])
        rotate([0, 0, -45])
        cube([4, 4, 1]);
    }
}

// origin: center
module rgbled2427_cut(cut_hi = 2) {
    translate([-2.9/2, -2.4/2, -2])
    cube([2.9, 2.4, 2.5]);
    translate([-2.7/2, -2.4/2, 0])
    cube([2.7, 2.4, cut_hi]);
}
*rgbled2427();
*rgbled2427_cut();

module hexagon_element(hex_rad1 = 10/2, hex_hi1 = 1, hex_res = 6) {
    cylinder(r = hex_rad1, h = hex_hi1, $fn = hex_res);
}

module hexagon_edge_element(hex_rad1 = 10/2, hex_hi1 = 1, hex_res = 6) {
    //translate([-hex_rad1, -hex_rad1*cos(30), 0])
    //cube([2*hex_rad1, 2*hex_rad1*cos(30), hex_hi1]);
    translate([-hex_rad1, -hex_rad1, 0])
    cube([2*hex_rad1, 2*hex_rad1, hex_hi1]);
}

module hexagon_upper_round_edge_element(hex_rad1 = 10/2, hex_hi1 = 1, loc_res = 32) {
    translate([-hex_rad1, +hex_rad1, hex_hi1/2])
    rotate([0, 90, 0])
    cylinder(d = hex_hi1, h = hex_rad1*2, $fn = loc_res);
}
hexagon_upper_round_edge_element();

module hexagon_lower_round_edge_element(hex_rad1 = 10/2, hex_hi1 = 1, loc_res = 32) {
    translate([-hex_rad1, -hex_rad1, hex_hi1/2])
    rotate([0, 90, 0])
    cylinder(d = hex_hi1, h = hex_rad1*2, $fn = loc_res);
}
hexagon_lower_round_edge_element();

module hexagon_cover_element(hex_rad1 = 10/2, hex_hi1 = 0.6, hex_res = 6) {
    cylinder(r = hex_rad1, h = hex_hi1, $fn = hex_res);
    cylinder(r = hex_rad1-0.8, h = hex_hi1+0.2, $fn = hex_res);
}

module hexagon_cover_element_cut(hex_rad1 = 10/2, hex_hi1 = 20, hex_res = 6) {
    translate([0, 0, -10])
    cylinder(r = hex_rad1+0.15, h = hex_hi1, $fn = hex_res);
}

module hexagon_cover_element_led(hex_rad1 = 10/2, hex_hi1 = 0.6, col = "Red", hex_res = 6) {
    cylinder(r = hex_rad1, h = hex_hi1, $fn = hex_res);
    cylinder(r = hex_rad1-0.8, h = hex_hi1+0.2, $fn = hex_res);
    color(col)
    cylinder(r = hex_rad1-2, h = hex_hi1+0.4, $fn = hex_res);
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

module hexagon_cover_element_m3_mount_cut(hex_rad1 = 10/2, hex_hi1 = 10, hex_res = 6, loc_res = 32) {
    cylinder(r = hex_rad1+0.15, h = hex_hi1, $fn = hex_res);
    translate([0, 0, -10])
    cylinder(r = (5+0.3)/2, h = 10.5, $fn = loc_res);
}

module m3_mount_cut(m3_dia = 3.2, hi1 = 10, loc_res = 32) {
    translate([0, 0, -10])
    cylinder(d = m3_dia, h = 15, $fn = loc_res);
}

module hexagon_rest_element(hex_rad = 10/2, hex_hi = 6, wallth = 0.5, hex_res = 6) {
    difference() {
        cylinder(r = hex_rad + (wallth/2), h = hex_hi, $fn = hex_res);
        translate([0, 0, -1])
        cylinder(r = hex_rad - (wallth/2), h = hex_hi+2, $fn = hex_res);
    }
}

module hexagon_rest_element_led2427_cut(hex_rad = 10/2, hex_hi = 6, wallth = 0.5, hex_res = 6) {
    difference() {
        cylinder(r = hex_rad + (wallth/2), h = hex_hi, $fn = hex_res);
        translate([0, 0, 0.4])
        cylinder(r = hex_rad - (wallth/2), h = hex_hi+2, $fn = hex_res);
        
        rgbled2427_cut();
    }
}

module hexagon_rest_element_m3_mount(hex_rad = 10/2, hex_hi = 1, wallth = 0.5, hex_res = 6, loc_res = 32) {
    difference() {
        cylinder(r = hex_rad + (wallth/2), h = hex_hi, $fn = hex_res);
        translate([0, 0, -1])
        cylinder(r = 3.2/2, h = hex_hi+2, $fn = loc_res);
    }
}
