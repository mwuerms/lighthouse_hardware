/**
 * Martin Egli
 * 2021-11-01
 * M3 screw cut outs
 */

module m3ScrewCut(len = 10, cut_d = 3.2, loc_res = 32) {
    translate([0, 0, 0])
    cylinder(d = cut_d, h = len, $fn = loc_res);
}
*m3ScrewCut();

module m3SinkHeadCut(len = 4, loc_res = 32) {
    translate([0, 0, 0])
    cylinder(d1 = 3.2, d2 = 6.6, h = 2, $fn = loc_res);
    translate([0, 0, 2])
    cylinder(d = 6.6, h = len, $fn = loc_res);
}
*m3SinkHeadCut();

module m3CylinderHeadCut(len = 4, loc_res = 32) {
    translate([0, 0, 0])
    cylinder(d = 6, h = len, $fn = loc_res);
}
*m3CylinderHeadCut();

module m3ScrewSinkHeadCut(len = 4, loc_res = 32) {
    translate([0, 0, 0])
    m3ScrewCut(len = len, loc_res);
    translate([0, 0, len])
    m3SinkHeadCut(len = len, loc_res);
}
m3ScrewSinkHeadCut();

module m3NutCut() {
    translate([0, 0, 0])
    cylinder(d = 6.7, h = 4, $fn = 6);
}
*m3NutCut();

module m3SinkHeadScewNutCut(len = 10, loc_res = 32) {
    translate([0, 0, len])
    m3SinkHeadCut(4, loc_res);
    m3ScrewCut(len+1, loc_res);
    m3NutCut();
}

module m3CylinderHeadScewNutCut(len = 10, loc_res = 32) {
    translate([0, 0, len])
    m3CylinderHeadCut(4, loc_res);
    m3ScrewCut(len+1, loc_res);
    m3NutCut();
}

*m3SinkHeadScewNutCut(20);
*m3CylinderHeadScewNutCut(15);


// M3 press-fit insert "PFLA-M3-1"
module pfla_m3_1_insert(len = 10, m3_dia = 3.2, loc_res = 32) {
    difference() {
        union() {
            cylinder(d = 5.56, h = 0.56, $fn = loc_res);
            translate([0, 0, -4.2])
            cylinder(d = 4.2, h = 3.5, $fn = loc_res);
            translate([0, 0, -4.2])
            cylinder(d = 4, h = 4.2, $fn = loc_res);
        }
        // m3 thread
        translate([0, 0, -4.5])
        cylinder(d = 3, h = 6, $fn = loc_res);
        // cut
        translate([-5/2, -0.5/2, -4.3])
        cube([5, 0.5, 3.6]);
    }
}

*pfla_m3_1_insert();

module pfla_m3_1_insert_cut(len = 10, m3_dia = 3.2, loc_res = 32) {
    // m3 cut
    translate([0, 0, -(len)])
    cylinder(d = m3_dia, h = len+1, $fn = loc_res);
    // insert cut
    translate([0, 0, -5.3])
    cylinder(d = 4, h = 5.3, $fn = loc_res); // cut dia: 3.96mm, cut depth: 5.24 mm
}

*pfla_m3_1_insert_cut();

module pfla_m3_cut(len = 10, m3_dia = 3.2, loc_res = 32) {
    // only m3 cut
    translate([0, 0, -(len)])
    cylinder(d = m3_dia, h = len+1, $fn = loc_res);
}
*pfla_m3_cut();
