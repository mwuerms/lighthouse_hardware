/**
 * Martin Egli
 * 2024-03-20
 * buoy: sender on the wrist
 */
use <parts.scad>

translate([-14, 0, 0])
rotate([0, 0, 90])
sip1907();

translate([0, 0, -4])
cr2032();

translate([-4, -13, -1])
rotate([0, 90, 0])
vibrasensorAdafruit2384(con_len = 4);

translate([-10, 12, 0])
rotate([-90, 0, 0])
swd50milHeader();

buttonPTS526();