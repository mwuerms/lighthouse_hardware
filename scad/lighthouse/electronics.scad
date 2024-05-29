/**
* Martin Egli
* 2024-05-29
* electronic parts
*/
module origin(col = "Red", len = 10, loc_res = 4) {
    color(col)
    cylinder(d2 = .8, d1 = 0, h = len, $fn = loc_res);
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
buttonPTS526();
