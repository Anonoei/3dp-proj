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
    }
}
