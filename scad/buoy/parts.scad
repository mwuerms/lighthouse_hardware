/**
* Martin Egli
* 2024-03-20
* a mockup for a SIP1907 (nRF52811) module with CR2032
*/
module origin(col = "Red", len = 10, loc_res = 4) {
    color(col)
    cylinder(d2 = .8, d1 = 0, h = len, $fn = loc_res);
}

module sip1907(loc_res = 32) {
    // MCU part, with connections, light part
    color("DarkGray")
    translate([-4, 0, 0])
    cube([8, 4, 1]);
    // antenna part
    color("Gray")
    translate([-4, -4, 0])
    cube([8, 4, 1]);
}

module sip1907_cut() {
    translate([-8.6/2, -8.6/2, 0])
    cube([8.6, 8.6, 3]);
}

module cr2032(loc_res = 32) {
    color("Silver") {
        cylinder(d = 17.7, h = 3.2, $fn = loc_res);
        cylinder(d = 20.0, h = 2.5, $fn = loc_res);
        translate([0, 0, 2.5])
        cylinder(d1 = 20.0, d2 = 19.0, h = 0.5, $fn = loc_res);
        // +
        translate([-5, -1, -0.1])
        cube([10, 2, 1]);
        translate([-1, -5, -0.1])
        cube([2, 10, 1]);
    }
}

module cr2032_cut(loc_res = 32) {
    cylinder(d = 20.6, h = 3.2+0.4, $fn = loc_res);
}

module tiltsensorRB231x2(show_origin = 1, loc_res = 32) {
    if(show_origin) {
        origin();
    }
    rotate([0, 90, 0]) 
    translate([-5/2, 0, -1]) {
        color("Silver") {
            hull() {
                translate([0, 0, 0])
                cylinder(d = 4, h = 11.4, $fn = loc_res);
                translate([0, 0, 11.4])
                cylinder(d1 = 4, d2 = 3, h = 1, $fn = loc_res);
            }
            translate([1, -2.5/2, 1])
            cube([4, 2.5, 0.5]);
        }
        color("Black")
        translate([0, 0, 0])
        cylinder(d = 5, h = 1, $fn = loc_res);
        color("Gold") {
        translate([-1, -0.8/2, -4.2])
        cube([10.7-5/2, 0.8, 0.8]);
        translate([-1, -0.8/2, -4.2])
        cube([0.8, 0.8, 5]);
        }
    }
}

module vibrasensorAdafruit2384(show_origin= 1, con_len = 12, loc_res = 32) {
    if(show_origin) {
        origin();
    }
    color("DarkBlue")
    translate([0, 0, 0])
    cylinder(d = 5, h = 11, $fn = loc_res);
    translate([-1.2, -0.4/2,  -con_len])
    cube([0.4, 0.4, con_len]);
    translate([+0.8, -0.4/2,  -con_len])
    cube([0.4, 0.4, con_len]);
}
module vibrasensorAdafruit2384_cut(loc_res = 32) {
    translate([0, 0, -4])
    cylinder(d = 5.6, h = 11+4, $fn = loc_res);
}

module swd50milHeader(loc_res = 32) {
    color("Silver")
    for(n = [0: 1: 4])
    translate([n*1.27, 0, -2])
    cylinder(d = 0.6, h = 4, $fn = loc_res);
    color("Black")
    translate([-1.27/2, -1.27/2, 0])
    cube([1.27*5, 1.27, 1.9]);
}

module swd50milHeader_cut() {
    translate([-1.27/2-0.15, -1.27/2-0.15, -(4-1.9)])
    cube([1.27*5+0.3, 1.27+0.3, 4.5]); // h = 1.9
}

module buttonPTS526(col = "Silver", loc_res = 32) {
// origin in the middle, at the bottom
    color(col) {
        hull() {
            translate([-3/2, -4.8/2, 0])
            cube([3, 4.8, 1]);
            translate([-4.8/2, -3/2, 0])
            cube([4.8, 3, 1]);
        }
        translate([0, 0, 0])
        cylinder(d =2, h = 1.5, $fn = loc_res);
    }
}
*buttonPTS526();

// origin: center
// detailed version
module led1206_detailed(col = "Red", loc_res = 32) {
    difference() {
        union() {
            color(col)
            translate([-2/2, -1.6/2, 0.3])
            cube([2, 1.6, 0.4]);
            color("White")
            translate([-3.2/2, -1.6/2, 0])
            cube([3.2, 1.6, 0.3]);
            translate([-3.25/2, -1.5/2, -0.01])
            cube([0.6, 1.5, 0.32]);
            translate([+(3.25/2-0.6), -1.5/2, -0.01])
            cube([0.6, 1.5, 0.32]);
        }
        translate([-3.2/2, 0, -0.2])
        cylinder(d = 0.4, h = 1, $fn = loc_res);
        translate([+3.2/2, 0, -0.2])
        cylinder(d = 0.4, h = 1, $fn = loc_res);
    }
}
