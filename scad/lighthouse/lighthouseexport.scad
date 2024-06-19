/**
 * Martin Egli
 * 2024-06-01
 * lighthouse case: print/export all necesary parts
 */
use <display.scad>
use <panels.scad>
use <buttons.scad>
use <pcbs.scad>

// - export panels and additional mounting parts -----------------------------

*case_display_side_panel(0, 0, 0); // 3d print 2 x
*plain_display_cover(); // 3d print 2 x
*led_spacer(0); // 3d print 2 x
*led_spacer_mount_element(); // 3d print 2 x 7
*case_lower_side_panel(); // 3d print 2 x
*panel_side_mount_stiffener60();// 3d print approx 2 x 3 (I don't know yet)
*panel_side_mount_m3insert60(show_insert = 0, show_m3_cut = 0); // 3d print 4 x

*case_bottom_base_panel(); // 3d print 1 x

*case_top_button_panel(show_insert = 0, show_m3_cut = 0, show_buttons = 0, show_pcb = 0); // 3d print 1 x
// 3d print 4 x
*place_long_button(7, 0, 8);// 3d print 1 x

// not 100 % done yet, maybe colide with some parts, check later
*place_button(0, 0);// 3d print 4 x

// not 100 % done yet, USB cutout still missing
*case_side_panel(); // usb cutout 3d print 1 x

*case_side_panel(); // 3d print 1 x



// - export dxf/svg -----------------------------
// export dxf/svg, add "mm" to dxf file

*projection() led_spacer(); // artwork/top overlay for display_pcb
*projection() place_display_pcb(); 
*projection() place_button_pcb();
*projection() place_base_pcb();

*projection() case_display_side_panel(0, 0, 0);
*projection() plain_display_cover();
*projection() case_lower_side_panel();
*projection() case_bottom_base_panel();
*projection() case_top_button_panel(show_insert = 0, show_m3_cut = 0, show_buttons = 0, show_pcb = 0);
*projection() rotate([0, 90, 0]) case_side_panel();
