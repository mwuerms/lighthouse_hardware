/**
 * Martin Egli
 * 2024-05-23
 * lighthouse case
 */
use <display.scad>
use <hexagonparts.scad>

hex_rad = 10/2;
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

module case1(show_display_cover = 1, show_led_spacer = 1, show_pcb = 1) {
    color("LightBlue") {
        difference() {
            union() {
                *hull() {
                    place_hexagon_edge_element(0, 0);
                    place_hexagon_edge_element(0, 11);
                    place_hexagon_edge_element(22, 0);
                    place_hexagon_edge_element(22, 11);
                }
                hull() {
                    place_hexagon_lower_round_edge_element(0, 0);
                    place_hexagon_upper_round_edge_element(0, 11);
                    place_hexagon_lower_round_edge_element(22, 0);
                    place_hexagon_upper_round_edge_element(22, 11);
                }
                // add decoration
                *translate([0, 0, 0.4]) {
                    place_hexagon_cover_element(0, 2);
                    place_hexagon_cover_element(0, 3);
                    place_hexagon_cover_element(0, 4);
                    place_hexagon_cover_element(0, 5);
                    place_hexagon_cover_element(0, 6);
                    
                    place_hexagon_cover_element(1, 1);
                    place_hexagon_cover_element(1, 2);
                    place_hexagon_cover_element(1, 3);
                    place_hexagon_cover_element(1, 7);
                    place_hexagon_cover_element(1, 8);
                    place_hexagon_cover_element(1, 9);
                    place_hexagon_cover_element(1, 10);
                    
                    place_hexagon_cover_element(2, 1);
                    place_hexagon_cover_element(2, 8);
                    place_hexagon_cover_element(2, 9);
                    
                    place_hexagon_cover_element(3, 1);
                    place_hexagon_cover_element(3, 2);
                    place_hexagon_cover_element(3, 10);
                    
                    place_hexagon_cover_element(4, 0);
                    place_hexagon_cover_element(4, 1);
                    place_hexagon_cover_element(4, 10);
                    
                    place_hexagon_cover_element(5, 1);
                    place_hexagon_cover_element(5, 10);
                    place_hexagon_cover_element(5, 11);
                    
                    place_hexagon_cover_element(6, 0);
                    place_hexagon_cover_element(6, 10);
                    
                    place_hexagon_cover_element(7, 1);
                    place_hexagon_cover_element(7, 10);
                    place_hexagon_cover_element(7, 11);
                    
                    place_hexagon_cover_element(8, 1);
                    place_hexagon_cover_element(8, 10);
                    
                    place_hexagon_cover_element(9, 1);
                    place_hexagon_cover_element(9, 2);
                    place_hexagon_cover_element(9, 10);
                    
                    place_hexagon_cover_element(10, 0);
                    place_hexagon_cover_element(10, 1);
                    place_hexagon_cover_element(10, 9);
                    place_hexagon_cover_element(10, 10);
                    
                    place_hexagon_cover_element(11, 1);
                    place_hexagon_cover_element(11, 10);
                    place_hexagon_cover_element(11, 11);
                    
                    place_hexagon_cover_element(12, 0);
                    place_hexagon_cover_element(12, 1);
                    place_hexagon_cover_element(12, 9);
                    place_hexagon_cover_element(12, 10);
                    
                    place_hexagon_cover_element(13, 1);
                    place_hexagon_cover_element(13, 10);
                    
                    place_hexagon_cover_element(14, 0);
                    place_hexagon_cover_element(14, 10);
                    
                    place_hexagon_cover_element(15, 1);
                    place_hexagon_cover_element(15, 10);
                    place_hexagon_cover_element(15, 11);
                    
                    place_hexagon_cover_element(16, 0);
                    place_hexagon_cover_element(16, 1);
                    place_hexagon_cover_element(16, 10);
                    
                    place_hexagon_cover_element(17, 1);
                    place_hexagon_cover_element(17, 10);
                    
                    place_hexagon_cover_element(18, 1);
                    place_hexagon_cover_element(18, 10);
                    
                    place_hexagon_cover_element(19, 1);
                    place_hexagon_cover_element(19, 2);
                    place_hexagon_cover_element(19, 10);
                    place_hexagon_cover_element(19, 11);
                    
                    place_hexagon_cover_element(20, 2);
                    place_hexagon_cover_element(20, 3);
                    place_hexagon_cover_element(20, 9);
                    place_hexagon_cover_element(20, 10);
                    
                    place_hexagon_cover_element(21, 2);
                    place_hexagon_cover_element(21, 3);
                    place_hexagon_cover_element(21, 4);
                    place_hexagon_cover_element(21, 5);
                    place_hexagon_cover_element(21, 9);

                    place_hexagon_cover_element(22, 4);
                    place_hexagon_cover_element(22, 5);
                    place_hexagon_cover_element(22, 6);
                    place_hexagon_cover_element(22, 7);
                    place_hexagon_cover_element(22, 8);
                }
            }
            *translate([0, 0, 0.4])
            place_plain_display_cover_cut(1, 4);
        }
    }
    if(show_display_cover) {
        translate([0, 0, 0.4])
        place_display_backlight_cover(1, 4);
    }
    if(show_led_spacer) {
        color("LightGreen")
        translate([0, 0, -6])
        place_led_spacer(1, 4);
    }
    if(show_pcb) {
        translate([0, 0, -8])
        place_display_pcb(1, 4);
        *place_display_m3_mount_cut(1, 4);
    }
}

case1(0, 0, 0);

translate([0, -5, 1/2])
rotate([60, 0, 0])
translate([0, 5, -1/2])
hull() {
    place_hexagon_lower_round_edge_element(0, -4);
    place_hexagon_lower_round_edge_element(0, 0);
    place_hexagon_lower_round_edge_element(22, -4);
    place_hexagon_lower_round_edge_element(22, 0);
}
*hull() {
    place_hexagon_edge_element(0, 0);
    place_hexagon_edge_element(0, 3);
    place_hexagon_edge_element(22, 0);
    place_hexagon_edge_element(22, 3);
}
