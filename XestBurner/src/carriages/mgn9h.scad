include <../carriage.scad>

module xb_cr_mgn9h() {
    // c=16,b=15

    module mgn12h_bolts() {
        translate([0,-3,0])
        rotate([270,90,0]) {
            translate([15/2,16/2,0])
                bolt_shcs_m3(h=5);
            translate([-15/2,16/2,0])
                bolt_shcs_m3(h=5);
            translate([15/2,-16/2,0])
                bolt_shcs_m3(h=5);
            translate([-15/2,-16/2,0])
                bolt_shcs_m3(h=5);
        }
    }
    difference() {
        xb_cr();
        mgn12h_bolts();
    }
}
