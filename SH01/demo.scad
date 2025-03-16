include <src/main.scad>

rotate([180,0,0])
translate([0,0,-15]) {
    male_ecas();
}

translate([0,0,5]) {
    translate([-10,0,0])
        female_ecas();
    translate([10,0,0])
        female_funnel();
}
