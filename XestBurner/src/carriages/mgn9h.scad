include <../carriage.scad>

module xb_cr_mgn9h() {
    // c=16,b=15
    difference() {
        xb_cr();
        union() {
            translate([0,-d_cr_d,0])
            rotate([270,90,0]) {
                translate([15/2,16/2,0])
                    bolt_shcs_m3(h=20);
                translate([-15/2,16/2,0])
                    bolt_shcs_m3(h=20);
                translate([15/2,-16/2,0])
                    bolt_shcs_m3(h=20);
                translate([-15/2,-16/2,0])
                    bolt_shcs_m3(h=20);
            }
        }
    }
}
