/**
 * Martin Egli
 * 2024-05-23
 * lighthouse case
 */
use <display.scad>
use <displayparts.scad>

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
 */
dx_even_factor = 3/2*hex_rad; // see dxeven = m*3*r
dy_even_factor = 2*hex_rad*cos(30); // see dyeven = n*2*r*cos(30)
dx_odd_factor = 3/2*hex_rad; // see dxodd = m*3/2*r
dy_odd_factor = hex_rad*cos(30); // see dyodd = (2n+1)*r*cos(30)

dx_1 = hex_rad * (1 + sin(30));



color("LightGreen")
cube([(2+21+1)*dx_1, (1+9+1)*hex_rad, 0.1]);
translate([2*dx_even_factor, 4*dy_even_factor, 0.9])
display_backlight_cover();

module case1() {
    color("LightBlue") {
        place_hexagon_cover_element(0, 0);
        place_hexagon_cover_element(0, 1);
        place_hexagon_cover_element(0, 2);
        place_hexagon_cover_element(0, 3);
        place_hexagon_cover_element(0, 4);
        place_hexagon_cover_element(0, 5);
        place_hexagon_cover_element(0, 6);
        place_hexagon_cover_element(0, 7);
        place_hexagon_cover_element(0, 8);
        place_hexagon_cover_element(0, 9);
        place_hexagon_cover_element(0, 10);
        place_hexagon_cover_element(0, 11);
        
        place_hexagon_cover_element(1, 1);
        place_hexagon_cover_element(1, 2);
        place_hexagon_cover_element(1, 3);
        place_hexagon_cover_element(1, 4);
        place_hexagon_cover_element(1, 5);
        place_hexagon_cover_element(1, 6);
        place_hexagon_cover_element(1, 7);
        place_hexagon_cover_element(1, 8);
        place_hexagon_cover_element(1, 9);
        place_hexagon_cover_element(1, 10);
        place_hexagon_cover_element(1, 11);
        
        place_hexagon_cover_element(2, 0);
        place_hexagon_cover_element(2, 1);
        place_hexagon_cover_element(2, 2);
        place_hexagon_cover_element(2, 3);
        place_hexagon_cover_element(2, 7);
        place_hexagon_cover_element(2, 8);
        place_hexagon_cover_element(2, 9);
        place_hexagon_cover_element(2, 10);
        place_hexagon_cover_element(2, 11);
        
        place_hexagon_cover_element(3, 1);
        place_hexagon_cover_element(3, 2);
        place_hexagon_cover_element(3, 10);
        place_hexagon_cover_element(3, 11);
        
        place_hexagon_cover_element(4, 0);
        place_hexagon_cover_element(4, 1);
        place_hexagon_cover_element(4, 2);
        place_hexagon_cover_element(4, 10);
        place_hexagon_cover_element(4, 11);
        
        place_hexagon_cover_element(5, 1);
        place_hexagon_cover_element(5, 2);
        place_hexagon_cover_element(5, 11);
        
        place_hexagon_cover_element(6, 0);
        place_hexagon_cover_element(6, 1);
        place_hexagon_cover_element(6, 10);
        place_hexagon_cover_element(6, 11);
        
        place_hexagon_cover_element(7, 1);
        place_hexagon_cover_element(7, 11);
        
        place_hexagon_cover_element(8, 0);
        place_hexagon_cover_element(8, 1);
        place_hexagon_cover_element(8, 10);
        place_hexagon_cover_element(8, 11);
        
        place_hexagon_cover_element(9, 1);
        place_hexagon_cover_element(9, 2);
        place_hexagon_cover_element(9, 11);
        
        place_hexagon_cover_element(10, 0);
        place_hexagon_cover_element(10, 1);
        place_hexagon_cover_element(10, 10);
        place_hexagon_cover_element(10, 11);
        
        place_hexagon_cover_element(11, 1);
        place_hexagon_cover_element(11, 10);
        place_hexagon_cover_element(11, 11);
        
        place_hexagon_cover_element(12, 0);
        place_hexagon_cover_element(12, 1);
        place_hexagon_cover_element(12, 10);
        place_hexagon_cover_element(12, 11);
        
        place_hexagon_cover_element(13, 1);
        place_hexagon_cover_element(13, 2);
        place_hexagon_cover_element(13, 10);
        place_hexagon_cover_element(13, 11);
        
        place_hexagon_cover_element(14, 0);
        place_hexagon_cover_element(14, 1);
        place_hexagon_cover_element(14, 10);
        place_hexagon_cover_element(14, 11);
        
        place_hexagon_cover_element(15, 1);
        place_hexagon_cover_element(15, 11);
        
        place_hexagon_cover_element(16, 0);
        place_hexagon_cover_element(16, 1);
        place_hexagon_cover_element(16, 10);
        place_hexagon_cover_element(16, 11);
        
        place_hexagon_cover_element(17, 1);
        place_hexagon_cover_element(17, 2);
        place_hexagon_cover_element(17, 11);
        
        place_hexagon_cover_element(18, 0);
        place_hexagon_cover_element(18, 1);
        place_hexagon_cover_element(18, 10);
        place_hexagon_cover_element(18, 11);
        
        place_hexagon_cover_element(19, 1);
        place_hexagon_cover_element(19, 2);
        place_hexagon_cover_element(19, 11);
        
        place_hexagon_cover_element(20, 0);
        place_hexagon_cover_element(20, 1);
        place_hexagon_cover_element(20, 2);
        place_hexagon_cover_element(20, 10);
        place_hexagon_cover_element(20, 11);
        
        place_hexagon_cover_element(21, 1);
        place_hexagon_cover_element(21, 2);
        place_hexagon_cover_element(21, 3);
        place_hexagon_cover_element(21, 4);
        place_hexagon_cover_element(21, 10);
        place_hexagon_cover_element(21, 11);
        
        place_hexagon_cover_element(22, 0);
        place_hexagon_cover_element(22, 1);
        place_hexagon_cover_element(22, 2);
        place_hexagon_cover_element(22, 3);
        place_hexagon_cover_element(22, 4);
        place_hexagon_cover_element(22, 5);
        place_hexagon_cover_element(22, 9);
        place_hexagon_cover_element(22, 10);
        place_hexagon_cover_element(22, 11);
        
        place_hexagon_cover_element(23, 1);
        place_hexagon_cover_element(23, 2);
        place_hexagon_cover_element(23, 3);
        place_hexagon_cover_element(23, 4);
        place_hexagon_cover_element(23, 5);
        place_hexagon_cover_element(23, 6);
        place_hexagon_cover_element(23, 7);
        place_hexagon_cover_element(23, 8);
        place_hexagon_cover_element(23, 9);
        place_hexagon_cover_element(23, 10);
        place_hexagon_cover_element(23, 11);
        
    }
}
case1();
