module xb_em_cut() {
    translate([0,-21.5,0])
    cylinder(h=50,d=4.5);
}

module xb_em() {
    module _em_mount() {
        module _em_base() {
            translate([0,-21,d_cr_ht]) {
                cube([d_cr_wt/2,18,5]);
                translate([0,13,-10])
                    cube([d_cr_wt/2, 2, 10]);
                translate([0,-0.5,0])
                    cylinder(h=5,d=10);
                // translate([0,14,5])
                // cube([d_cr_wt/2,5,5]);
            }
        }
        difference() {
            _em_base();
            xb_em_cut();
            xb_cr_hs_he();
            xb_cr_pr_wire_cut();
        }
    }

    union() {
    _em_mount();
    mirror([d_cr_wt,0,0])
        _em_mount();
    }
}
