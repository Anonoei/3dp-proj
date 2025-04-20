include <src/main.scad>

rotate([180,0,0])
translate([0,0,-15]) {
    translate([-10,0,0])
    color(c_rl) male_ecas();
    translate([10,0,0])
    color(c_rl) male_press();
}

translate([0,0,5]) {
    translate([-10,0,0])
        color(c_bl) female_ecas();
    translate([10,0,0])
        color(c_bl) female_funnel();
}
