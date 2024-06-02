/**
 * Martin Egli
 * 2024-05-23
 * lighthouse case
 */
use <buttons.scad>
use <panels.scad>
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

// - testing panels -------------------------------
*case_display_side_panel();
*case_lower_side_panel();
*case_bottom_base_panel();
*case_top_button_panel();

// - put panels together to get a case ------------
module case_put_side_panels_together() {
    // display panel
    case_display_side_panel(0, 0, 0);
    
    // lower side panel
    rotate([60, 0, 0])
    case_lower_side_panel();
    
    // side mounts are added parts, so put them here
    // side mounts to fix lower side panel
    translate([1, 0.2, -0.6/2])
    panel_side_mount_m3insert60(show_insert = 0, show_m3_cut = 0);
    translate([140-1, 0.2, -0.6/2])
    rotate([0, 0, 180])
    rotate([-60, 0, 0])
    panel_side_mount_m3insert60(show_insert = 0, show_m3_cut = 0);    
    translate([20, 0.2, -0.6/2])
    panel_side_mount_stiffener60();
    translate([100, 0.2, -0.6/2])
    panel_side_mount_stiffener60();
}
*case_put_side_panels_together();

module put_case_together() {
    // display side
    translate([0, -84*cos(60)-14/2, 0])
    rotate([60, 0, 0])
    case_put_side_panels_together();
    
    // backlight side
    translate([140, 0, 0])
    rotate([0, 0, 180])
    translate([0, -84*cos(60)-14/2, 0])
    rotate([60, 0, 0])
    case_put_side_panels_together();
    
    // top side with buttons
    translate([0, -14/2, 84*cos(30)+0.2])
    case_top_button_panel(show_insert = 0, show_m3_cut = 0);
    
    // bottom base plate
    translate([0, -(-70/2), -28*cos(30)+0.2])
    rotate([180, 0, 0])
    case_bottom_base_panel(show_insert = 0, show_m3_cut = 0, show_pcb = 0);
    
}
*difference() {
    put_case_together();
    translate([4, -80, -40])
    cube([160, 160, 160]);
}
translate([-1, 0, 0])
case_side_panel();

put_case_together();