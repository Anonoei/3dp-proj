include <../carriage.scad>

module xb_cr_mgn12h() {
    // c=20, b=20

    module mgn12h_bolts() {
        translate([0,-3,0])
        rotate([270,90,0]) {
            translate([20/2,20/2,0])
                bolt_shcs_m3(h=5);
            translate([-20/2,20/2,0])
                bolt_shcs_m3(h=5);
            translate([20/2,-20/2,0])
                bolt_shcs_m3(h=5);
            translate([-20/2,-20/2,0])
                bolt_shcs_m3(h=5);
        }
    }
    difference() {
        xb_cr();
        mgn12h_bolts();
    }
}
