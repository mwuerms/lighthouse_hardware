/**
 * Martin Egli
 * 2024-05-28
 * buttons for lighthouse
 */
use <hexagonparts.scad>

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
 * /
dx_even_factor = 3/2*hex_rad; // see dxeven = m*3*r
dy_even_factor = 2*hex_rad*cos(30); // see dyeven = n*2*r*cos(30)
dx_odd_factor = 3/2*hex_rad; // see dxodd = m*3/2*r
dy_odd_factor = hex_rad*cos(30); // see dyodd = (2n+1)*r*cos(30)
*/
dx_even_factor = 3/2*hex_rad; // see dxeven = m*3*r
dy_even_factor = 2*hex_rad*cos(30); // see dyeven = n*2*r*cos(30)
dx_odd_factor = 3/2*hex_rad; // see dxodd = m*3/2*r
dy_odd_factor = hex_rad*cos(30); // see dyodd = (2n+1)*r*cos(30)

module place_button(x_pos = 0, y_pos = 0) {
    if((x_pos % 2) == 0) {
        // even column
        translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0]) {
            hexagon_element(hex_rad1 = 12/2, hex_hi1 = 1);
            hull() {
                hexagon_element(hex_rad1 = 10/2, hex_hi1 = 2.5);
                hexagon_element(hex_rad1 = 8/2, hex_hi1 = 3);
            }
        }
    }
    else {
        // odd column
        translate([x_pos*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0]) {
            hexagon_element(hex_rad1 = 12/2, hex_hi1 = 1);
            hull() {
                hexagon_element(hex_rad1 = 10/2, hex_hi1 = 2.5);
                hexagon_element(hex_rad1 = 8/2, hex_hi1 = 3);
            }
        }
    }
}
*place_button(1, 0);

module place_long_button(x_pos = 0, y_pos = 0, x_wid = 1) {
    if((x_pos % 2) == 0) {
        // even column
        hull() {
            translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0])
            hexagon_element(hex_rad1 = 12/2, hex_hi1 = 1);
            translate([(x_pos+x_wid)*dx_even_factor, y_pos*dy_even_factor, 0])
            hexagon_element(hex_rad1 = 12/2, hex_hi1 = 1);
        }
        hull() {
            translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0]) {
                hexagon_element(hex_rad1 = 10/2, hex_hi1 = 2.5);
                hexagon_element(hex_rad1 = 8/2, hex_hi1 = 3);
            }
            translate([(x_pos+x_wid)*dx_even_factor, y_pos*dy_even_factor, 0]) {
                hexagon_element(hex_rad1 = 10/2, hex_hi1 = 2.5);
                hexagon_element(hex_rad1 = 8/2, hex_hi1 = 3);
            }
        }
    }
    else {
        // odd column
        hull() {
            translate([x_pos*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0])
            hexagon_element(hex_rad1 = 12/2, hex_hi1 = 1);
            translate([(x_pos+x_wid)*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0])
            hexagon_element(hex_rad1 = 12/2, hex_hi1 = 1);
        }
        hull() {
            translate([x_pos*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0]) {
                hexagon_element(hex_rad1 = 10/2, hex_hi1 = 2.5);
                hexagon_element(hex_rad1 = 8/2, hex_hi1 = 3);
            }
            translate([(x_pos+x_wid)*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0]) {
                hexagon_element(hex_rad1 = 10/2, hex_hi1 = 2.5);
                hexagon_element(hex_rad1 = 8/2, hex_hi1 = 3);
            }
        }
    }
}

place_long_button(3, -2, 3);

module place_button_cutout(x_pos = 0, y_pos = 0) {
    if((x_pos % 2) == 0) {
        // even column
        translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0])
        hexagon_element(hex_rad1 = 10.5/2, hex_hi1 = 10);
    }
    else {
        // odd column
        translate([x_pos*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0])
        hexagon_element(hex_rad1 = 10.5/2, hex_hi1 = 10);
    }
}
