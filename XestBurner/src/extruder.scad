module xb_em_cut() {
    translate([0,-21.5,0])
    cylinder(h=50,d=4.5);
}

module xb_em() {
    module _em_mount() {
        module _em_base() {
            translate([0,-21,d_cr_ht]) {
                cube([d_cr_wt/2+2,18,5]);
                translate([10,13-0.01,-9.5])
                    cube([d_cr_wt/2-8, 2, 9.5]);
                translate([0,13,-5])
                    cube([10, 2, 5]);
                translate([0,-0.5,0])
                    cylinder(h=5,d=10);
                translate([-16,d_cr_w/2-2,-0.01])
                    cylinder(h=5, d=3);
                translate([-d_cr_w/2-4,18,0])
                    cube([4,d_cr_d/2,5]);
                // translate([0,14,5])
                // cube([d_cr_wt/2,5,5]);
            }
        }
        difference() {
            _em_base();
            xb_em_cut();
            xb_cr_hs_he();
            xb_cr_pr_wire_cut();
            translate([0,-21.5,0.5])
                cylinder(d=32,h=10);
        }
    }

    union() {
    _em_mount();
    mirror([d_cr_wt,0,0])
        _em_mount();
        translate([d_cr_wt/2+0.01,-d_cr_d-2-4,d_cr_ht-9.5])
            cube([2,4,10]);
        translate([-d_cr_wt/2-2-0.01,-d_cr_d-2-4,d_cr_ht-9.5])
            cube([2,4,10]);
    }
}
