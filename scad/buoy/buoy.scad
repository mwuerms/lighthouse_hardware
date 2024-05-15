/**
 * Martin Egli
 * 2024-03-20
 * buoy: sender on the wrist
 */
use <parts.scad>

module buoy(show_parts = 1, loc_res = 32) {
    // create buoy case
    difference() {
        hull() {
            translate([0, 0, -7])
            cylinder(d = 22, h = 7, $fn = loc_res);
            translate([+(20+5)/2, -14/2, -7/2])
            rotate([-90, 0, 0])
            cylinder(d = 7, h = 14, $fn = loc_res);
            translate([-17, -8/2, -7])
            cylinder(d = 4, h = 7, $fn = loc_res);
            translate([-17, +8/2, -7])
            cylinder(d = 4, h = 7, $fn = loc_res);
        }
    
        // cut out parts
        translate([-15, 0, -2])
        rotate([0, 0, 90])
        sip1907_cut();
        
        // CR2032
        hull() {
            translate([0, 0, -3.4-2])
            cr2032_cut(loc_res);
            translate([0, -12, -3.4-2])
            cr2032_cut(loc_res);
        }
        // battery contacts
        hull() {
            translate([0, -12, -1.7])
            rotate([-90, 0, 0])
            cylinder(d = 1, h = 22, $fn = loc_res);
            translate([0, -12, -1.7-1])
            rotate([-90, 0, 0])
            cylinder(d = 1, h = 22, $fn = loc_res);
        }
        hull() {
            translate([5, -12, -1.7-2])
            rotate([-90, 0, 0])
            cylinder(d = 1, h = 20, $fn = loc_res);
            translate([5, -12, -1.7-3.8])
            rotate([-90, 0, 0])
            cylinder(d = 1, h = 20, $fn = loc_res);
        }
        // + on bottom
        translate([0, 0, -(8-0.2)]) {
            translate([-14/2, -4/2, 0])
            cube([14, 4, 1]);
            translate([-4/2, -14/2, 0])
            cube([4, 14, 1]);
        }
        
        translate([+(20+5)/2, -11/2+0.2, -7/2])
        rotate([0, 90, 90])
        vibrasensorAdafruit2384_cut(loc_res);
        
        translate([-17, -(2*1.27), -6.3])
        rotate([-90, 0, 90])
        swd50milHeader_cut();
        
        translate([-14, -(2*1.27), -6.3])
        rotate([-90, 0, 90])
        swd50milHeader_cut();
        // cut buttonPTS526
        translate([-6/2, -6/2, -0.5])
        cube([6, 6, 2]);
        
        // cut outs for wires
        hull() {
            translate([-11, -9/2, -(7+1)])
            cylinder(d = 2, h = 7+2, $fn = loc_res);
            translate([-11, +9/2, -(7+1)])
            cylinder(d = 2, h = 7+2, $fn = loc_res);
        }
        hull() {
            translate([-11, 0, -1])
            cylinder(d = 2, h = 2, $fn = loc_res);
            translate([+9, 0, -1])
            cylinder(d = 2, h = 2, $fn = loc_res);
        }
        translate([+9, 0, -7/2])
        cylinder(d = 2, h = 4, $fn = loc_res);
    }
    
    // show components
    if(show_parts) {
        translate([-15, 0, -2])
        rotate([0, 0, 90])
        sip1907();

        translate([0, 0, -3.2-2])
        cr2032();

        translate([+(20+5)/2, -11/2, -7/2])
        rotate([0, 90, 90])
        vibrasensorAdafruit2384(con_len = 4);

        translate([-17, -(2*1.27), -6.3])
        rotate([-90, 0, 90])
        swd50milHeader();

        translate([0, 0, -0.5])
        buttonPTS526();
    }
}
buoy(0, 64); // print 1x
