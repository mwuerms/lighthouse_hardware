/**
 * Martin Egli
 * 2024-05-15
 * testing honey comb structure to create the display
 * wall thickness: 0.5 mm
 * printing: 0.2 mm layer height
 */

use <parts.scad>

module hexagon_cover_element(hex_rad1 = 5/2, hex_hi1 = 2*0.2, hex_rad2 = 4/2, hex_hi2 = 2*0.4, hex_res = 6) {
    cylinder(r = hex_rad1, h = hex_hi1, $fn = hex_res);
    cylinder(r = hex_rad2, h = hex_hi2, $fn = hex_res);
}

module hexagon_rest_element(hex_rad = 5/2, hex_hi = 4, wallth = 0.5, hex_res = 6) {
    difference() {
        cylinder(r = hex_rad + (wallth/2), h = hex_hi, $fn = hex_res);
        translate([0, 0, -1])
        cylinder(r = hex_rad - (wallth/2), h = hex_hi+2, $fn = hex_res);
    }
}

module hexagon_rest_element_led2427_cut(hex_rad = 5/2, hex_hi = 4, wallth = 0.5, hex_res = 6) {
    difference() {
        cylinder(r = hex_rad + (wallth/2), h = hex_hi, $fn = hex_res);
        translate([0, 0, 0.4])
        cylinder(r = hex_rad - (wallth/2), h = hex_hi+2, $fn = hex_res);
        
        rgbled2427_cut();
    }
}

hex_rad = 5/2;
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

//translate([0, 0, 10]) {
place_hexagon_cover_element(0, 0);
place_hexagon_cover_element(0, 1);
place_hexagon_cover_element(0, 2);
place_hexagon_cover_element(0, 3);
place_hexagon_cover_element(0, 4);
place_hexagon_cover_element(1, 0);
place_hexagon_cover_element(1, 1);
place_hexagon_cover_element(1, 2);
place_hexagon_cover_element(1, 3);
place_hexagon_cover_element(1, 4);
place_hexagon_cover_element(1, 5);
place_hexagon_cover_element(2, 0);
place_hexagon_cover_element(2, 1);
place_hexagon_cover_element(2, 2);
place_hexagon_cover_element(2, 3);
place_hexagon_cover_element(2, 4);
/*}

place_hexagon_rest_element(0, 0);
place_hexagon_rest_element(0, 1);
place_hexagon_rest_element(0, 2);
place_hexagon_rest_element(0, 3);
place_hexagon_rest_element(0, 4);
place_hexagon_rest_element(1, 0);
place_hexagon_rest_element(1, 1);
place_hexagon_rest_element(1, 2);
place_hexagon_rest_element(1, 3);
place_hexagon_rest_element(1, 4);
place_hexagon_rest_element(1, 5);
place_hexagon_rest_element(2, 0);
place_hexagon_rest_element(2, 1);
place_hexagon_rest_element(2, 2);
place_hexagon_rest_element(2, 3);
place_hexagon_rest_element(2, 4);
*/