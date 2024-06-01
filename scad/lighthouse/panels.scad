/**
 * Martin Egli
 * 2024-05-29
 * lighthouse panels
 */
use <display.scad>
use <buttons.scad>
use <pcbs.scad>
use <hexagonparts.scad>
use <m3screw.scad>

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

// - bare side panels -------------------------------------
module case_bare_wide_side_panel() {
    //translate([hex_rad, hex_rad, 0])
    hull() {
        place_hexagon_lower_edge_element(0, 0);
        place_hexagon_upper_edge_element(0, 11);
        place_hexagon_lower_edge_element(22, 0);
        place_hexagon_upper_edge_element(22, 11);
    }
}

module case_bare_lower_side_panel() {
    //translate([hex_rad, hex_rad, 0])
    hull() {
        place_hexagon_lower_edge_element(0, -4);
        translate([0, -2*hex_rad, 0])
        place_hexagon_upper_edge_element(0, 0);
        place_hexagon_lower_edge_element(22, -4);
        translate([0, -2*hex_rad, 0])
        place_hexagon_upper_edge_element(22, 0);
    }
}

module case_bare_wide_base_panel() {
    //translate([hex_rad, hex_rad, 0])
    hull() {
        place_hexagon_lower_edge_element(0, 0);
        place_hexagon_upper_edge_element(0, 11-2);
        place_hexagon_lower_edge_element(22, 0);
        place_hexagon_upper_edge_element(22, 11-2);
    }
}

module case_bare_top_panel2() {
    //translate([hex_rad, hex_rad, 0])
    hull() {
        place_hexagon_lower_edge_element(0, -2);
        translate([0, -2*hex_rad, 0])
        place_hexagon_upper_edge_element(0, 0);
        place_hexagon_lower_edge_element(22, -2);
        translate([0, -2*hex_rad, 0])
        place_hexagon_upper_edge_element(22, 0);
    }
}

module case_bare_top_panel() {
    //translate([hex_rad, hex_rad, 0])
    hull() {
        place_hexagon_lower_edge_element(0, 0);
        translate([0, -2*hex_rad, 0])
        place_hexagon_upper_edge_element(0, 2);
        place_hexagon_lower_edge_element(22, 0);
        translate([0, -2*hex_rad, 0])
        place_hexagon_upper_edge_element(22, 2);
    }
}

// - define all side panels ------------------------------------
module case_display_side_panel(show_display_cover = 1, show_led_spacer = 1, show_pcb = 1, loc_res = 32) {
    translate([hex_rad, hex_rad, 0])
    color("LightBlue") {
        difference() {
            union() {
                case_bare_wide_side_panel();
                // add decoration
                translate([0, 0, 0.4]) {
                    place_hexagon_cover_middle_element(0, 2);
                    place_hexagon_cover_middle_element(0, 3);
                    place_hexagon_cover_middle_element(0, 4);
                    place_hexagon_cover_middle_element(0, 5);
                    place_hexagon_cover_middle_element(0, 6);
                    
                    place_hexagon_cover_middle_element(1, 1);
                    place_hexagon_cover_middle_element(1, 2);
                    place_hexagon_cover_middle_element(1, 3);
                    place_hexagon_cover_middle_element(1, 7);
                    place_hexagon_cover_middle_element(1, 8);
                    place_hexagon_cover_middle_element(1, 9);
                    place_hexagon_cover_middle_element(1, 10);
                    
                    place_hexagon_cover_middle_element(2, 1);
                    place_hexagon_cover_middle_element(2, 8);
                    place_hexagon_cover_middle_element(2, 9);
                    
                    place_hexagon_cover_middle_element(3, 1);
                    place_hexagon_cover_middle_element(3, 2);
                    place_hexagon_cover_middle_element(3, 10);
                    
                    place_hexagon_cover_middle_element(4, 0);
                    place_hexagon_cover_middle_element(4, 1);
                    place_hexagon_cover_middle_element(4, 10);
                    
                    place_hexagon_cover_middle_element(5, 1);
                    place_hexagon_cover_middle_element(5, 10);
                    place_hexagon_cover_middle_element(5, 11);
                    
                    place_hexagon_cover_middle_element(6, 0);
                    place_hexagon_cover_middle_element(6, 10);
                    
                    place_hexagon_cover_middle_element(7, 1);
                    place_hexagon_cover_middle_element(7, 10);
                    place_hexagon_cover_middle_element(7, 11);
                    
                    place_hexagon_cover_middle_element(8, 1);
                    place_hexagon_cover_middle_element(8, 10);
                    
                    place_hexagon_cover_middle_element(9, 1);
                    place_hexagon_cover_middle_element(9, 2);
                    place_hexagon_cover_middle_element(9, 10);
                    
                    place_hexagon_cover_middle_element(10, 0);
                    place_hexagon_cover_middle_element(10, 1);
                    place_hexagon_cover_middle_element(10, 9);
                    place_hexagon_cover_middle_element(10, 10);
                    
                    place_hexagon_cover_middle_element(11, 1);
                    place_hexagon_cover_middle_element(11, 10);
                    place_hexagon_cover_middle_element(11, 11);
                    
                    place_hexagon_cover_middle_element(12, 0);
                    place_hexagon_cover_middle_element(12, 1);
                    place_hexagon_cover_middle_element(12, 9);
                    place_hexagon_cover_middle_element(12, 10);
                    
                    place_hexagon_cover_middle_element(13, 1);
                    place_hexagon_cover_middle_element(13, 10);
                    
                    place_hexagon_cover_middle_element(14, 0);
                    place_hexagon_cover_middle_element(14, 10);
                    
                    place_hexagon_cover_middle_element(15, 1);
                    place_hexagon_cover_middle_element(15, 10);
                    place_hexagon_cover_middle_element(15, 11);
                    
                    place_hexagon_cover_middle_element(16, 0);
                    place_hexagon_cover_middle_element(16, 1);
                    place_hexagon_cover_middle_element(16, 10);
                    
                    place_hexagon_cover_middle_element(17, 1);
                    place_hexagon_cover_middle_element(17, 10);
                    
                    place_hexagon_cover_middle_element(18, 1);
                    place_hexagon_cover_middle_element(18, 10);
                    
                    place_hexagon_cover_middle_element(19, 1);
                    place_hexagon_cover_middle_element(19, 2);
                    place_hexagon_cover_middle_element(19, 10);
                    place_hexagon_cover_middle_element(19, 11);
                    
                    place_hexagon_cover_middle_element(20, 2);
                    place_hexagon_cover_middle_element(20, 3);
                    place_hexagon_cover_middle_element(20, 9);
                    place_hexagon_cover_middle_element(20, 10);
                    
                    place_hexagon_cover_middle_element(21, 2);
                    place_hexagon_cover_middle_element(21, 3);
                    place_hexagon_cover_middle_element(21, 4);
                    place_hexagon_cover_middle_element(21, 5);
                    place_hexagon_cover_middle_element(21, 9);

                    place_hexagon_cover_middle_element(22, 4);
                    place_hexagon_cover_middle_element(22, 5);
                    place_hexagon_cover_middle_element(22, 6);
                    place_hexagon_cover_middle_element(22, 7);
                    place_hexagon_cover_middle_element(22, 8);
                } // decoration
            } // difference()
            translate([0, 0, 0.4])
            place_plain_display_cover_cut(1, 4);
        }
    }
    if(show_display_cover) {
        translate([hex_rad, hex_rad, 0.4])
        place_display_backlight_cover(1, 4);
    }
    if(show_led_spacer) {
        color("LightGreen")
        translate([hex_rad, hex_rad, -6])
        place_led_spacer(1, 4);
    }
    if(show_pcb) {
        translate([hex_rad, hex_rad, -8]) {
            place_display_pcb(1, 4);
        }
        color("Red")
        translate([hex_rad, hex_rad, 0]) {    
            // mounts
            place_led_spacer_mount(1, 4);
        }
    }
}
case_display_side_panel(1, 1, 1);

module case_lower_side_panel() {
    // lower edge, will be 60° folded in
    translate([hex_rad, hex_rad, 0])
    color("LightGreen") {
        union() {
            case_bare_lower_side_panel();
            // add decoration
            translate([0, 0, 0.4]) {
                place_hexagon_cover_middle_element(0, -2);
                place_hexagon_cover_middle_element(0, -3);
                
                place_hexagon_cover_middle_element(1, -1);
                place_hexagon_cover_middle_element(1, -2);
                place_hexagon_cover_middle_element(1, -3);
                
                place_hexagon_cover_middle_element(2, -2);
                place_hexagon_cover_middle_element(2, -4);
                
                place_hexagon_cover_middle_element(3, -1);
                place_hexagon_cover_middle_element(3, -2);
                place_hexagon_cover_middle_element(3, -3);
                
                place_hexagon_cover_middle_element(4, -1);
                place_hexagon_cover_middle_element(4, -4);
                
                place_hexagon_cover_middle_element(5, -1);
                place_hexagon_cover_middle_element(5, -2);
                place_hexagon_cover_middle_element(5, -3);
                
                place_hexagon_cover_middle_element(6, -2);
                place_hexagon_cover_middle_element(6, -3);
                
                place_hexagon_cover_middle_element(7, -1);
                place_hexagon_cover_middle_element(7, -3);
                
                place_hexagon_cover_middle_element(8, -2);
                place_hexagon_cover_middle_element(8, -3);
                place_hexagon_cover_middle_element(8, -4);
                
                place_hexagon_cover_middle_element(9, -1);
                place_hexagon_cover_middle_element(9, -2);
                
                place_hexagon_cover_middle_element(10, -1);
                place_hexagon_cover_middle_element(10, -2);
                place_hexagon_cover_middle_element(10, -4);
                
                place_hexagon_cover_middle_element(11, -1);
                place_hexagon_cover_middle_element(11, -3);
                
                place_hexagon_cover_middle_element(12, -2);
                place_hexagon_cover_middle_element(12, -4);
                
                place_hexagon_cover_middle_element(13, -1);
                place_hexagon_cover_middle_element(13, -2);
                place_hexagon_cover_middle_element(13, -3);
                
                place_hexagon_cover_middle_element(14, -2);
                place_hexagon_cover_middle_element(14, -3);
                place_hexagon_cover_middle_element(14, -4);
                
                place_hexagon_cover_middle_element(15, -1);
                place_hexagon_cover_middle_element(15, -2);
                place_hexagon_cover_middle_element(15, -3);
                
                place_hexagon_cover_middle_element(16, -2);
                place_hexagon_cover_middle_element(16, -4);
                
                place_hexagon_cover_middle_element(17, -1);
                place_hexagon_cover_middle_element(17, -2);
                place_hexagon_cover_middle_element(17, -3);
                
                place_hexagon_cover_middle_element(18, -1);
                place_hexagon_cover_middle_element(18, -3);
                
                place_hexagon_cover_middle_element(19, -1);
                place_hexagon_cover_middle_element(19, -2);
                place_hexagon_cover_middle_element(19, -3);
                
                place_hexagon_cover_middle_element(20, -2);
                place_hexagon_cover_middle_element(20, -3);
                
                place_hexagon_cover_middle_element(21, -1);
                place_hexagon_cover_middle_element(21, -2);
                place_hexagon_cover_middle_element(21, -3);
                
                place_hexagon_cover_middle_element(22, -2);
                place_hexagon_cover_middle_element(22, -4);
            }
        }
    }
}

// - side mounts stiffener ------------------
module panel_side_mount_stiffener60(rad_mount = 0.6/2, wid_mount = 10, len_mount = 6) {
    // 0°side
    hull() {
        translate([0, 0, 0])
        rotate([0, 90, 0])
        place_cylinder(0, 0, rad_mount, wid_mount);
        translate([0, len_mount, 0])
        rotate([0, 90, 0])
        place_cylinder(0, 0, rad_mount, wid_mount);
    }
    // 60° side
    hull() {
        translate([0, 0, 0])
        rotate([0, 90, 0])
        place_cylinder(0, 0, rad_mount, wid_mount);
        translate([0, -len_mount*cos(60), -len_mount*sin(60)])
        rotate([0, 90, 0])
        place_cylinder(0, 0, rad_mount, wid_mount);
    }
    // stiffener
    hull() {
        translate([0, 0, 0])
        rotate([0, 90, 0])
        place_cylinder(0, 0, rad_mount, rad_mount);
        translate([0, len_mount, 0])
        rotate([0, 90, 0])
        place_cylinder(0, 0, rad_mount, rad_mount);
        translate([0, -len_mount*cos(60), -len_mount*sin(60)])
        rotate([0, 90, 0])
        place_cylinder(0, 0, rad_mount, rad_mount);
    }
}
*panel_side_mount_stiffener60();

//0.4, 3, 10
module panel_side_mount_m3insert60(rad_mount = 0.6/2, wid_mount = 4.4, len_mount = 10, show_insert = 1, show_m3_cut = 1, loc_res = 32) {
    difference() {
        union() {
            // full stiffener from 0°side to 60° side
            hull() {
                translate([0, 0, 0])
                rotate([0, 90, 0])
                place_cylinder(0, 0, rad_mount, wid_mount);
                translate([0, len_mount, 0])
                rotate([0, 90, 0])
                place_cylinder(0, 0, rad_mount, wid_mount);
                translate([0, 0, 0])
                rotate([0, 90, 0])
                place_cylinder(0, 0, rad_mount, wid_mount);
                translate([0, -len_mount*cos(60), -len_mount*sin(60)])
                rotate([0, 90, 0])
                place_cylinder(0, 0, rad_mount, wid_mount);
            }
            // material to mount M3 press fit insert
            translate([0, 3.5/2, -3.5])
            rotate([0, 90, 0])
            cylinder(d = 6, h = wid_mount, $fn = loc_res);
        }
        // cut M3 press fit insert
        translate([wid_mount+0.1, 3.5/2, -3.5])
        rotate([0, 90, 0])
        pfla_m3_1_insert_cut();
    }
    // show M3 press fit insert
    if(show_insert) {
        color("LightGreen")
        translate([wid_mount+0.1, 3.5/2, -3.5])
        rotate([0, 90, 0])
        pfla_m3_1_insert();
    }
    // show M3 cut
    if(show_m3_cut) {
        translate([wid_mount+0.1, 3.5/2, -3.5])
        rotate([0, 90, 0])
        pfla_m3_cut(20);
    }
}
*panel_side_mount_m3insert60(show_insert = 1, show_m3_cut = 0);

// - bottom panel --------------------------------------
module panel_base_mount_m3insert_whole_side_stiffener60(rad_mount = 0.6/2, wid_mount = 140, len_mount = 10, insert_wid = 4.4, show_insert = 1, show_m3_cut = 1, loc_res = 32) {
    // 60° side
    hull() {
        translate([0, 0, 0])
        rotate([0, 90, 0])
        place_cylinder(0, 0, rad_mount, wid_mount);
        translate([0, -len_mount*cos(60), -len_mount*sin(60)])
        rotate([0, 90, 0])
        place_cylinder(0, 0, rad_mount, wid_mount);
    }
    // left + right mount M3 press fit insert + stiffener
    for(n = [0:1:1])
    translate([n*(140-insert_wid), 0, 0])
    difference() {
        union() {
            hull() {
                translate([0, 0, 0])
                rotate([0, 90, 0])
                place_cylinder(0, 0, rad_mount, insert_wid);
                translate([0, len_mount, 0])
                rotate([0, 90, 0])
                place_cylinder(0, 0, rad_mount, insert_wid);
                translate([0, -len_mount*cos(60), -len_mount*sin(60)])
                rotate([0, 90, 0])
                place_cylinder(0, 0, rad_mount, insert_wid);
            }
            // material to mount M3 press fit insert
            translate([0, 3.5/2, -3.5])
            rotate([0, 90, 0])
            cylinder(d = 6, h = insert_wid, $fn = loc_res);
        }
        // cut M3 press fit insert
        translate([insert_wid+0.1, 3.5/2, -3.5])
        rotate([0, 90, 0])
        pfla_m3_1_insert_cut();
    }
    // place stiffeners
    for(n = [1:1:6])
    translate([n*20, 0, 0])
    hull() {
        translate([0, 0, 0])
        rotate([0, 90, 0])
        place_cylinder(0, 0, rad_mount, rad_mount);
        translate([0, 0.2*len_mount, 0])
        rotate([0, 90, 0])
        place_cylinder(0, 0, rad_mount, rad_mount);
        translate([0, -len_mount*cos(60), -len_mount*sin(60)])
        rotate([0, 90, 0])
        place_cylinder(0, 0, rad_mount, rad_mount);
    }
    
    // show M3 press fit insert
    if(show_insert) {
        // left
        color("LightGreen")
        translate([insert_wid+0.1, 3.5/2, -3.5])
        rotate([0, 90, 0])
        pfla_m3_1_insert();
        // right
        color("LightGreen")
        translate([140-insert_wid+0.1, 3.5/2, -3.5])
        rotate([0, 0, 180])
        rotate([0, 90, 0])
        pfla_m3_1_insert();
    }
    // show M3 cut
    if(show_m3_cut) {
        // left
        translate([insert_wid+0.1, 3.5/2, -3.5])
        rotate([0, 90, 0])
        pfla_m3_cut(20);
        // right
        translate([140-insert_wid+0.1, 3.5/2, -3.5])
        rotate([0, 0, 180])
        rotate([0, 90, 0])
        pfla_m3_cut(20);
    }
}

module case_bottom_base_panel(show_insert = 0, show_m3_cut = 0, show_pcb = 0, loc_res = 32) {
    // this panel will be upside down!
    color("LightCoral") {
        translate([hex_rad, hex_rad, 0]) {
            difference() {
                union() {
                    case_bare_wide_base_panel();
                    // 2 mm standoffs
                    translate([0, 0, -2]) {
                        place_cylinder(1, 1, 8/2, 2);
                        place_cylinder(1, 9, 8/2, 2);
                        place_cylinder(11, 1, 8/2, 2);
                        place_cylinder(11, 9, 8/2, 2);
                        place_cylinder(21, 1, 8/2, 2);
                        place_cylinder(21, 9, 8/2, 2);
                    }
                }
                // add bottom cut outs
                translate([0, 0, -1]) {
                    for(n = [2:2:20]) {
                        place_hexagon_cutout(n, 1);
                    }
                    for(n = [1:1:21]) {
                        for(m = [2:1:8]) {
                            place_hexagon_cutout(n, m);
                        }
                    }
                }
                // m3 mounts
                translate([0, 0, -3]) {
                    place_cylinder(1, 1, 3.3/2, 5);
                    place_cylinder(1, 9, 3.3/2, 5);
                    place_cylinder(11, 1, 3.3/2, 5);
                    place_cylinder(11, 9, 3.3/2, 5);
                    place_cylinder(21, 1, 3.3/2, 5);
                    place_cylinder(21, 9, 3.3/2, 5);
                }
                place_cylinder(1, 1, 6/2, 2);
                place_cylinder(1, 9, 6/2, 2);
                place_cylinder(11, 1, 6/2, 2);
                place_cylinder(11, 9, 6/2, 2);
                place_cylinder(21, 1, 6/2, 2);
                place_cylinder(21, 9, 6/2, 2);
            }
        }
        // these side mounts are already fixed to this panel, so add them here
        // side mounts to fix to lower side panel
        translate([0, 0.52, 0.6/2])
        panel_base_mount_m3insert_whole_side_stiffener60(show_insert = show_insert, show_m3_cut = show_m3_cut);
        translate([140, 70-0.3, 0.6/2])
        rotate([0, 0, 180])
        panel_base_mount_m3insert_whole_side_stiffener60(show_insert = show_insert, show_m3_cut = show_m3_cut);
    }
    if(show_pcb) {
        translate([hex_rad, hex_rad, -(2+1.6)])
        place_base_pcb();
    }
}
*case_bottom_base_panel(show_pcb = 1);

// - top panel --------------------------------------------------
module panel_top_mount_stiffener(rad_mount = 0.6/2, len_mount = 6) {
    hull() {
        translate([0, 0, 0])
        rotate([0, 90, 0])
        place_cylinder(0, 0, rad_mount, rad_mount);
        translate([0, 2, 0])
        rotate([0, 90, 0])
        place_cylinder(0, 0, rad_mount, rad_mount);
        translate([0, -len_mount*cos(60), -len_mount*sin(60)])
        rotate([0, 90, 0])
        place_cylinder(0, 0, rad_mount, rad_mount);
    }
}
module panel_top_mount_whole_side_stiffener60(rad_mount = 0.6/2, wid_mount = 140, len_mount = 6, insert_wid = 4.4, show_insert = 1, show_m3_cut = 1, loc_res = 32) {
    // 60° side
    hull() {
        translate([0, 0, 0])
        rotate([0, 90, 0])
        place_cylinder(0, 0, rad_mount, wid_mount);
        translate([0, -len_mount*cos(60), -len_mount*sin(60)])
        rotate([0, 90, 0])
        place_cylinder(0, 0, rad_mount, wid_mount);
    }
    // place stiffeners
    translate([20, 0, 0])
    panel_top_mount_stiffener(rad_mount = rad_mount, len_mount = len_mount);
    translate([40, 0, 0])
    panel_top_mount_stiffener(rad_mount = rad_mount, len_mount = len_mount);
    translate([100, 0, 0])
    panel_top_mount_stiffener(rad_mount = rad_mount, len_mount = len_mount);
    translate([120, 0, 0])
    panel_top_mount_stiffener(rad_mount = rad_mount, len_mount = len_mount);
    
    difference() {
        union() {
            // material to mount M3 press fit insert
            hull() {
                translate([0, 12/2, -4])
                rotate([0, 90, 0])
                cylinder(d = 6, h = insert_wid, $fn = loc_res);
                translate([0, 12/2-(6/2-rad_mount), 0])
                rotate([0, 90, 0])
                place_cylinder(0, 0, rad_mount, insert_wid);
                translate([0, 12/2+(6/2-rad_mount), 0])
                rotate([0, 90, 0])
                place_cylinder(0, 0, rad_mount, insert_wid);
            }
        }    
        // cut M3 press fit insert
        translate([insert_wid+0.1, 12/2, -4])
        rotate([0, 90, 0])
        pfla_m3_1_insert_cut();
    }
    // show M3 press fit insert
    if(show_insert) {
        color("LightGreen")
        translate([insert_wid+0.1, 12/2, -4])
        rotate([0, 90, 0])
        pfla_m3_1_insert();
    }
    // show M3 cut
    if(show_m3_cut) {
        translate([insert_wid+0.1, 12/2, -4])
        rotate([0, 90, 0])
        pfla_m3_cut(20);
    }
}

module case_top_button_panel(show_insert = 0, show_m3_cut = 0, show_buttons = 1, show_pcb = 1) {
    translate([hex_rad, hex_rad, 0]) {
        color("Teal") {
            difference() {
                union() {
                    case_bare_top_panel();
                    
                    // 2 mm standoffs, mounting points
                    /* not enough room yet
                    translate([-1*hex_rad, 3/2*hex_rad, -2])
                    difference() {
                        place_cylinder(3, 0, 5.5/2, 2);
                        translate([0, 0, -1])
                        place_cylinder(3, 0, 2.5/2, 4);
                    }*/
                    translate([hex_rad/2, 3/2*hex_rad, -2])
                    difference() {
                        place_cylinder(5, 0, 5.5/2, 2);
                        translate([0, 0, -1])
                        place_cylinder(5, 0, 2.5/2, 4);
                    }
                    translate([-hex_rad/2, 3/2*hex_rad, -2])
                    difference() {
                        place_cylinder(17, 0, 5.5/2, 2);
                        translate([0, 0, -1])
                        place_cylinder(17, 0, 2.5/2, 4);
                    }
                    /* not enough room yet
                    translate([+1*hex_rad, 3/2*hex_rad, -2])
                    difference() {
                        place_cylinder(19, 0, 5.5/2, 2);
                        translate([0, 0, -1])
                        place_cylinder(19, 0, 2.5/2, 4);
                    }*/
                }
                // button cut outs
                translate([0, 3/2*hex_rad, -2]) {
                    place_button_cutout(1, 0);
                    translate([hex_rad, 0, 0])
                    place_button_cutout(3, 0);
                    hull() {
                        place_button_cutout(7, 0);
                        place_button_cutout(15, 0);
                    }
                    translate([-hex_rad, 0, 0])
                    place_button_cutout(19, 0);
                    place_button_cutout(21, 0);
                }
            }
            // side mounts belong to this part
            translate([-hex_rad, -hex_rad, 0]) {
                translate([0, 0.5, 0.6/2])
                panel_top_mount_whole_side_stiffener60(show_insert = show_insert, show_m3_cut = show_m3_cut);

                translate([140, 14-0.7, 0.6/2])
                rotate([0, 0, 180])
                panel_top_mount_whole_side_stiffener60(show_insert = show_insert, show_m3_cut = show_m3_cut);
            }
        }
        // buttons
        if(show_buttons) {
            color("White")
            translate([0, 3/2*hex_rad, -0.5]) {
                place_button(1, 0);
                translate([hex_rad, 0, 0])
                place_button(3, 0);
                place_long_button(7, 0, 8);
                translate([-hex_rad, 0, 0])
                place_button(19, 0);
                place_button(21, 0);
            }
        }
        // pcb
        if(show_pcb) {
            translate([0, 0, -(2+1.6)])
            place_button_pcb(0, 0);
        }
    }
    
}
*case_top_button_panel();

module side_panel_hex_element(r1 = 1, h1 = 1) {
    rotate([0, 90, 0])
    rotate([0, 0, 30])
    cylinder(r = r1, h = h1, $fn = 6);
}
//hexagon_element(hex_rad1 = r1, hex_hi1 = h1);
module case_side_panel() {
    translate([-1, 0, 0]) {
        difference() {
            union() {
                hull() {
                    translate([0, +14/2, 84*cos(30)])
                    side_panel_hex_element();
                    translate([0, -14/2, 84*cos(30)])
                    side_panel_hex_element();
                    translate([0, +(84*cos(60)+14/2), 0])
                    side_panel_hex_element();
                    translate([0, -(84*cos(60)+14/2), 0])
                    side_panel_hex_element();
                    translate([0, -(-70/2), -28*cos(30)+0.2])
                    side_panel_hex_element();
                    translate([0, +(-70/2), -28*cos(30)+0.2])
                    side_panel_hex_element();
                }
                hull() {
                    translate([0, +14/2, 84*cos(30)]) {
                        side_panel_hex_element();
                        translate([-0.2, 0, 0])
                        side_panel_hex_element(r1 = 1/2, h1 = 1.2);
                    }
                    translate([0, -14/2, 84*cos(30)]) {
                        side_panel_hex_element();
                        translate([-0.2, 0, 0])
                        side_panel_hex_element(r1 = 1/2, h1 = 1.2);
                    }
                }
                hull() {
                    translate([0, +14/2, 84*cos(30)]) {
                        side_panel_hex_element();
                        translate([-0.2, 0, 0])
                        side_panel_hex_element(r1 = 1/2, h1 = 1.2);
                    }
                    translate([0, +(84*cos(60)+14/2), 0]) {
                        side_panel_hex_element();
                        translate([-0.2, 0, 0])
                        side_panel_hex_element(r1 = 1/2, h1 = 1.2);
                    }
                }
                hull() {
                    translate([0, +(84*cos(60)+14/2), 0]) {
                        side_panel_hex_element();
                        translate([-0.2, 0, 0])
                        side_panel_hex_element(r1 = 1/2, h1 = 1.2);
                    }
                    translate([0, +(70/2), -28*cos(30)+0.2]) {
                        side_panel_hex_element();
                        translate([-0.2, 0, 0])
                        side_panel_hex_element(r1 = 1/2, h1 = 1.2);
                    }
                }
                hull() {
                    translate([0, +(70/2), -28*cos(30)+0.2]) {
                        side_panel_hex_element();
                        translate([-0.2, 0, 0])
                        side_panel_hex_element(r1 = 1/2, h1 = 1.2);
                    }
                    translate([0, -(70/2), -28*cos(30)+0.2]) {
                        side_panel_hex_element();
                        translate([-0.2, 0, 0])
                        side_panel_hex_element(r1 = 1/2, h1 = 1.2);
                    }
                }
                hull() {
                    translate([0, -(70/2), -28*cos(30)+0.2]) {
                        side_panel_hex_element();
                        translate([-0.2, 0, 0])
                        side_panel_hex_element(r1 = 1/2, h1 = 1.2);
                    }
                    translate([0, -(84*cos(60)+14/2), 0]) {
                        side_panel_hex_element();
                        translate([-0.2, 0, 0])
                        side_panel_hex_element(r1 = 1/2, h1 = 1.2);
                    }
                }
                hull() {
                    translate([0, -(84*cos(60)+14/2), 0]) {
                        side_panel_hex_element();
                        translate([-0.2, 0, 0])
                        side_panel_hex_element(r1 = 1/2, h1 = 1.2);
                    }
                    translate([0, -14/2, 84*cos(30)]) {
                        side_panel_hex_element();
                        translate([-0.2, 0, 0])
                        side_panel_hex_element(r1 = 1/2, h1 = 1.2);
                    }
                }
                translate([0.6, 0, 0])
                rotate([0, -90, 0]) 
                rotate([0, 0, 30]) {
                    place_hexagon_cover_middle_element(0, -1);
                    place_hexagon_cover_middle_element(0, 1);                
                    place_hexagon_cover_middle_element(1, 1);
                    place_hexagon_cover_middle_element(1, 0);
                    place_hexagon_cover_middle_element(-1, 1);
                    place_hexagon_cover_middle_element(-1, 0);
                    
                    place_hexagon_cover_middle_element(0, 2);
                    place_hexagon_cover_middle_element(-1, 3);
                    place_hexagon_cover_middle_element(-2, 1);
                    place_hexagon_cover_middle_element(-3, 0);
                    place_hexagon_cover_middle_element(2, 2);
                    place_hexagon_cover_middle_element(0, 3);

                    place_hexagon_cover_middle_element(0, 4);
                    place_hexagon_cover_middle_element(0, 5);
                    place_hexagon_cover_middle_element(1, 3);
                    place_hexagon_cover_middle_element(2, 3);
                    place_hexagon_cover_middle_element(3, 4);
                    place_hexagon_cover_middle_element(4, 3);
                    place_hexagon_cover_middle_element(5, 2);
                    place_hexagon_cover_middle_element(4, 4);
                    place_hexagon_cover_middle_element(4, 5);
                    place_hexagon_cover_middle_element(2, 5);
                    place_hexagon_cover_middle_element(2, 4);
                    place_hexagon_cover_middle_element(1, 5);
                    place_hexagon_cover_middle_element(1, 6);
                    
                    place_hexagon_cover_middle_element(-3, 2);
                    place_hexagon_cover_middle_element(-4, 0);
                    place_hexagon_cover_middle_element(-4, -1);
                    place_hexagon_cover_middle_element(-2, 2);
                    place_hexagon_cover_middle_element(-1, 5);
                    place_hexagon_cover_middle_element(-2, 3);
                    
                    place_hexagon_cover_middle_element(-4, -2);
                    place_hexagon_cover_middle_element(-3, -3);
                    place_hexagon_cover_middle_element(-3, -2);
                    place_hexagon_cover_middle_element(-2, -2);
                    place_hexagon_cover_middle_element(-3, -1);
                    place_hexagon_cover_middle_element(-1, -1);
                    place_hexagon_cover_middle_element(-4, -4);
                    place_hexagon_cover_middle_element(-4, -5);
                    place_hexagon_cover_middle_element(-3, -4);
                    place_hexagon_cover_middle_element(-5, -1);
                    place_hexagon_cover_middle_element(-5, -2);
                    place_hexagon_cover_middle_element(-5, -3);
                    place_hexagon_cover_middle_element(-2, -5);
                    
                    place_hexagon_cover_middle_element(3, 2);
                    place_hexagon_cover_middle_element(4, 2);
                    place_hexagon_cover_middle_element(6, 2);
                    place_hexagon_cover_middle_element(7, 1);
                    place_hexagon_cover_middle_element(6, 1);
                    place_hexagon_cover_middle_element(5, 1);
                    place_hexagon_cover_middle_element(4, 1);
                    place_hexagon_cover_middle_element(3, 1);
                    place_hexagon_cover_middle_element(3, 6);
                    place_hexagon_cover_middle_element(6, -1);
                    place_hexagon_cover_middle_element(5, 0);
                    place_hexagon_cover_middle_element(5, -1);
                    place_hexagon_cover_middle_element(5, -2);
                    place_hexagon_cover_middle_element(5, -3);
                    place_hexagon_cover_middle_element(5, -5);
                    place_hexagon_cover_middle_element(6, -3);
                    place_hexagon_cover_middle_element(4, -1);
                    place_hexagon_cover_middle_element(4, -3);
                    place_hexagon_cover_middle_element(3, -1);
                    place_hexagon_cover_middle_element(2, -1);
                    place_hexagon_cover_middle_element(1, -2);
                    place_hexagon_cover_middle_element(0, -2);
                    place_hexagon_cover_middle_element(0, -3);
                    place_hexagon_cover_middle_element(1, -3);
                    place_hexagon_cover_middle_element(2, -2);
                    place_hexagon_cover_middle_element(2, -3);
                    place_hexagon_cover_middle_element(2, -4);
                    place_hexagon_cover_middle_element(2, -5);
                    place_hexagon_cover_middle_element(3, -2);
                    place_hexagon_cover_middle_element(4, -4);
                    place_hexagon_cover_middle_element(4, -5);
                    place_hexagon_cover_middle_element(7, -2);
                    place_hexagon_cover_middle_element(7, -3);
                    place_hexagon_cover_middle_element(7, 0);
                    place_hexagon_cover_middle_element(7, -4);
                    place_hexagon_cover_middle_element(7, -5);
                    place_hexagon_cover_middle_element(8, -1);
                    place_hexagon_cover_middle_element(8, -3);
                    place_hexagon_cover_middle_element(8, -4);
                    place_hexagon_cover_middle_element(9, -4);
                    place_hexagon_cover_middle_element(9, -2);
                    place_hexagon_cover_middle_element(9, -5);
                    place_hexagon_cover_middle_element(10, -4);
                    place_hexagon_cover_middle_element(0, -4);
                }
            }
            // M3 cuts
            translate([0, 0, 84*cos(30)-3.4])
            translate([6, 0, 0])
            rotate([0, -90, 0])
            m3ScrewSinkHeadCut();
            translate([0, +(84*cos(60)+14/2-4.2), 0.2])
            translate([6, 0, 0])
            rotate([0, -90, 0])
            m3ScrewSinkHeadCut();
            translate([0, -(84*cos(60)+14/2-4.2), -0.2])
            translate([6, 0, 0])
            rotate([0, -90, 0])
            m3ScrewSinkHeadCut();
            translate([0, -(70/2-2.1), -(28*cos(30)+0.2-3.6)])
            translate([6, 0, 0])
            rotate([0, -90, 0])
            m3ScrewSinkHeadCut();
            translate([0, +(70/2-2.3), -(28*cos(30)+0.2-3.6)])
            translate([6, 0, 0])
            rotate([0, -90, 0])
            m3ScrewSinkHeadCut();
        }
    }
}

*case_side_panel();

// - overall much simpler definitions for previews -----------------
/*
module case_front_part0() {
    color("Green")
    translate([hex_rad, hex_rad, 0])
    hull() {
        place_hexagon_lower_edge_element(0, 0);
        place_hexagon_upper_edge_element(0, 11);
        place_hexagon_lower_edge_element(22, 0);
        place_hexagon_upper_edge_element(22, 11);
    }
}
module case_lower_front_part0() {
    color("Blue")
    translate([hex_rad, hex_rad, 0])
    hull() {
        place_hexagon_lower_edge_element(0, -4);
        translate([0, -2*hex_rad, 0])
        place_hexagon_upper_edge_element(0, 0);
        place_hexagon_lower_edge_element(22, -4);
        translate([0, -2*hex_rad, 0])
        place_hexagon_upper_edge_element(22, 0);
    }
}

*case_front_part0();
*case_lower_front_part0();

module front_side0() {
    case_front_part0();
    rotate([60, 0, 0])
    case_lower_front_part0();
}
*front_side0();

module put_case_together0() {
    // front side
    translate([0, -84*cos(60)-28/2, 0])
    rotate([60, 0, 0])
    front_side0();
    
    // back side
    translate([140, 0, 0])
    rotate([0, 0, 180])
    translate([0, -84*cos(60)-28/2, 0])
    rotate([60, 0, 0])
    front_side0();
    
    // top side with buttons
    translate([0, +28/2-.1, 84*cos(30)+0.2])
    case_lower_front_part0();
    
    // under carridge
    translate([0, -(-84/2), -28*cos(30)+0.2])
    rotate([180, 0, 0])
    case_front_part0();
    
}
put_case_together0();
*/