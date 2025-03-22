include <../carriage.scad>

module xb_cr_mgn12h() {
    // c=20, b=20
    difference() {
        xb_cr();
        union() {
            translate([0,-d_cr_d,0])
            rotate([270,90,0]) {
                translate([20/2,20/2,0])
                    bolt_shcs_m3(h=20);
                translate([-20/2,20/2,0])
                    bolt_shcs_m3(h=20);
                translate([20/2,-20/2,0])
                    bolt_shcs_m3(h=20);
                translate([-20/2,-20/2,0])
                    bolt_shcs_m3(h=20);
            }
        }
    }
}
