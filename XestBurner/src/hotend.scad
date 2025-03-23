module xb_he_bolts() {
    module _xb_he_bolt() {
        translate([d_m_he_w/2,-31-2,d_m_he_h])
        rotate([-90,-90,0])
            bolt_shcs_m3(h=30);
    }
    union() {
        _xb_he_bolt();
        mirror([d_m_he_w,0,0])
            _xb_he_bolt();
    }
}

module xb_he_mount() {
    module _xb_he_mount() {
        translate([d_m_he_w/2-5,-54,d_m_he_h+5])
        rotate([0,75,0])
            cube([15,24,10]);
    }
    union() {
        _xb_he_mount();
        mirror([d_m_he_w,0,0])
            _xb_he_mount();
        xb_he_bolts();
    }
}

module xb_he() {
    module _xb_he_base() {
        translate([0,-30-d_cr_d,d_cr_ht-5])
            cube([d_cr_wt/2,28,5]);
        translate([d_cr_wt/2-10,-30-d_cr_d,d_cr_ht-5-4.5])
            cube([10,28,4.5]);
        translate([0,-36,d_cr_ht-5-8])
            cube([14,2,8]);
        translate([0,-48,d_cr_ht-9.5])
            cube([14,12,9.5]);
        translate([16.5,-36,d_cr_ht-9.5])
            cylinder(h=9.5,d=15);
        translate([14,-42,d_cr_ht-9.5])
            cylinder(h=9.5,d=12);
    }
    difference() {
        union() {
            _xb_he_base();
            mirror([d_cr_wt/2,0,0])
                _xb_he_base();
        }
        xb_em_cut();
        translate([0,-21.5,0])
            cylinder(d=30.5,h=10);
        xb_cr_hs_he();
        xb_he_mount();
    }
    // xb_he_mount();
}
