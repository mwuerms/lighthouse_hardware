/**
 * Martin Egli
 * 2024-05-29
 * lighthouse pcbs
 */
use <display.scad>
use <hexagonparts.scad>
use <electronics.scad>

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

module place_buttonPTS526(x_pos = 0, y_pos = 0) {
    if((x_pos % 2) == 0) {
        // even column
        translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0])
        buttonPTS526();
    }
    else {
        // odd column
        translate([x_pos*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0])
        buttonPTS526();
    }
}

module button_pcb(th1 = 1.6) {
    color("ForestGreen")
    difference() {
        union() {
            hull() {
                place_cylinder(0, 0, 2, th1);
                // needs some cheating, dont know why
                translate([0, -0.6*hex_rad, 0])
                place_cylinder(0, 1, 2, th1);
                place_cylinder(22, 0, 2, th1);
                translate([0, -0.6*hex_rad, 0])
                place_cylinder(22, 1, 2, th1);
            }
        }
        // 2 mm standoffs, mounting points -> M3 holes
        translate([-1*hex_rad, 3/2*hex_rad, -1])
        place_cylinder(3, 0, 3.3/2, 4);
        translate([hex_rad/2, 3/2*hex_rad, -1])
        place_cylinder(5, 0, 3.3/2, 4);
        translate([-hex_rad/2, 3/2*hex_rad, -1])
        place_cylinder(17, 0, 3.3/2, 4);
        translate([+1*hex_rad, 3/2*hex_rad, -1])
        place_cylinder(19, 0, 3.3/2, 4);
    }
    // add electronics
    translate([0, 3/2*hex_rad, th1])
    place_buttonPTS526(1, 0);
    translate([hex_rad, 3/2*hex_rad, th1])
    place_buttonPTS526(3, 0);
    // middle buttons: 3 buttons
    translate([hex_rad/2, 3/2*hex_rad, th1])
    place_buttonPTS526(7, 0);
    translate([hex_rad/2, 0.6*hex_rad, th1])
    place_buttonPTS526(10, 0);
    translate([hex_rad/2, 3/2*hex_rad, th1])
    place_buttonPTS526(13, 0);
    
    translate([-hex_rad, 3/2*hex_rad, th1])
    place_buttonPTS526(19, 0);
    translate([0, 3/2*hex_rad, th1])
    place_buttonPTS526(21, 0);
}

*button_pcb();

module place_button_pcb(x_pos = 0, y_pos = 0) {
    if((x_pos % 2) == 0) {
        // even column
        translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0])
        button_pcb();
    }
    else {
        // odd column
        translate([x_pos*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0])
        button_pcb();
    }
}

*place_button_pcb(0, 0);



module display_pcb(th1 = 1.6, col = "ForestGreen", loc_res = 32) {
    color(col)
    difference() {
        hull() {
            translate([-hex_rad, 0, 0])
            place_cylinder(0, -3, 2, th1);
            translate([-hex_rad, 0, 0])
            place_cylinder(0, 6, 2, th1);
            translate([+hex_rad, 0, 0])
            place_cylinder(20, -3, 2, th1);
            translate([+hex_rad, 0, 0])
            place_cylinder(20, 6, 2, th1);
        }
        place_display_m3_mount_cut(0, 0);
    }
    /*translate([0, 0, th1])
    place_led_spacer(0, 0);
    place_display_m3_mount_cut(0, 0);
    */
}

module place_display_pcb(x_pos = 0, y_pos = 0) {
    if((x_pos % 2) == 0) {
        // even column
        translate([x_pos*dx_even_factor, y_pos*dy_even_factor, 0])
        display_pcb();
    }
    else {
        // odd column
        translate([x_pos*dx_odd_factor, (2*y_pos-1)*dy_odd_factor, 0])
        display_pcb();
    }
}

place_display_pcb();