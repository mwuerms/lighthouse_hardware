/**
 * Martin Egli
 * 2024-05-15
 * testing honey comb structure to create the display
 * wall thickness: 0.5 mm
 * printing: 0.2 mm layer height
 */

use <parts.scad>

module hexagon_cover_element(hex_rad1 = 5/2, hex_hi1 = 0.2, hex_rad2 = 4/2, hex_hi2 = 0.4, hex_res = 6) {
    rotate([0, 0, 30]) {
        cylinder(r = hex_rad1, h = hex_hi1, $fn = hex_res);
        cylinder(r = hex_rad2, h = hex_hi2, $fn = hex_res);
    }
}

module hexagon_rest_element(hex_rad = 5/2, hex_hi = 4, wallth = 0.5, hex_res = 6) {
    rotate([0, 0, 30])
    difference() {
        cylinder(r = hex_rad + (wallth/2), h = hex_hi, $fn = hex_res);
        translate([0, 0, -1])
        cylinder(r = hex_rad - (wallth/2), h = hex_hi+2, $fn = hex_res);
    }
}

hex_rad = 5/2;
/* calculate hexagon center positions
 * r: radius, use "hex_rad"
 * n: index in x axis
 * m: index in y axis
 * even rows
 * dxeven = n*2*r*cos(30)
 * dyeven = m*3/2*r
 * odd rows
 * dxodd = (2n+1)*r*cos(30)
 * dyodd = (m)*3/2*r
 */
dx_even_factor = 2*hex_rad*cos(30); // see dxeven = n*2*r*cos(30)
dy_even_factor = 3/2*hex_rad; // see dyeven = m*3*r
dx_odd_factor = hex_rad*cos(30); // see dxodd = (2n+1)*r*cos(30)
dy_odd_factor = 3/2*hex_rad; // see dyodd = (m+1/2)*3*r
module disp_hexagon_cover_element(x_pos = 0, y_pos = 0) {
    if((y_pos % 2) == 0) {
        // even
        translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0])
        hexagon_cover_element();
    }
    else {
        translate([(2*x_pos+1)*dx_odd_factor, y_pos*dy_odd_factor, 0])
        hexagon_cover_element();
    }
}

disp_hexagon_cover_element(0, 0);
disp_hexagon_cover_element(0, 1);


/*

translate([0, 0, -1])
rotate([0, 0, 30])
cylinder(d = 4.75, h = 1.5, $fn = 6);

rgbled2427();
*/