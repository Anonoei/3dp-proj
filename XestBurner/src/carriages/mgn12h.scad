include <../carriage.scad>

module xb_cr_mgn12h() {
    // c=20, b=20
    difference() {
        xb_cr();
        union() {
            translate([0,-d_cr_d,0])
            rotate([270,90,0]) {
                translate([20/2,20/2,0])
                    bolt_shcs_m3(h=20,v=true);
                translate([-20/2,20/2,0])
                    bolt_shcs_m3(h=20,v=true);
                translate([20/2,-20/2,0])
                    bolt_shcs_m3(h=20,v=true);
                translate([-20/2,-20/2,0])
                    bolt_shcs_m3(h=20,v=true);
            }
        }
    }
    module _top_press() {
        difference() {
            translate([-d_m_he_w/2+5,0,d_cr_ht-2])
                cube([d_m_he_w-10,4,4]);
            translate([-d_cr_pr_wire/2,0-0.01,d_cr_ht-2-0.01])
                cube([d_cr_pr_wire,6,8]);
        }
    }

    module _btm_press() {
        module _left() {
            translate([10,0,-15.5])
                cube([4,4,2]);
        }
        _left();
        mirror([1,0,0])
            _left();
    }

    _top_press();
    _btm_press();
}
