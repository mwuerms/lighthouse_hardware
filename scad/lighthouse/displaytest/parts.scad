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
