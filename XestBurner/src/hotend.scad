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

module xb_fp_hs() {
    module _xb_fp_hs() {
        translate([d_m_fp_w,-48,d_m_fp_h])
        rotate([-90,0,0])
            heatset_m3x4(H=4);
    }
    _xb_fp_hs();
    mirror([1,0,0])
        _xb_fp_hs();
}

module xb_he_led() {
    translate([-10/2,-50,d_m_he_h-7-0.01])
    cube([10,10,8]);
}

module xb_he_mount() {
    module _xb_he_mount() {
        translate([d_m_he_w/2-5,-54,d_m_he_h+5])
        rotate([0,75,0])
            cube([15,24,12]);
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
        translate([0,-28-d_cr_d-2,d_cr_ht-5])
            cube([d_cr_wt/2+2+2,28,5]); // Top
        translate([d_cr_wt/2-12,-28-d_cr_d-2,d_cr_ht-5-4.5])
            cube([10+4+2,28,4.5]); // Bottom
        translate([d_cr_wt/2+2,-22-d_cr_d-2,d_cr_ht-5-10])
            cube([2,22,6]); // Side
        difference() { // 2510 Press
            translate([0,-36,d_cr_ht-5-8])
                cube([14,5,8]);
            translate([0,-38,d_cr_ht-5-10])
                cube([8,8,10]);
        }
        translate([0,-48,d_cr_ht-9.5])
            cube([14,16,9.5]); // Front
        translate([16.5,-36,d_cr_ht-9.5])
            cylinder(h=9.5,d=15); // Front side
        translate([14,-42,d_cr_ht-9.5])
            cylinder(h=9.5,d=12); // Front chamfer
    }
    difference() {
        union() {
            _xb_he_base();
            mirror([d_cr_wt/2,0,0])
                _xb_he_base();
        }
        xb_em_cut();
        translate([0,-21.5,0.5-0.01])
            cylinder(d=32,h=10);
        xb_cr_hs_he();
        xb_he_mount();
        xb_fp_hs();
        xb_he_led();
        translate([d_cr_wt/2+0.01,-d_cr_d-2-4+0.01,d_cr_ht-10-0.01])
            cube([2,4,12]); // Right EM cutout
        translate([-d_cr_wt/2-2.01,-d_cr_d-2-4+0.01,d_cr_ht-10-0.01])
            cube([2,4,12]); // Left EM cutout
        translate([-d_cr_wt/2-6,-d_cr_d-20,d_cr_ht-15-0.01])
            cube([d_cr_wt+12,6,10]); // Wire cutout
    }
}
