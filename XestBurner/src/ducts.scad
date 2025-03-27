module xb_du_duct() {
    module _duct_cyd() {
        translate([d_max_w/2-2-10,-d_cr_d,-38])
        rotate([90,0,0])
        difference() {
            cylinder(d=20, h=44);
            translate([0,0,6])
                cylinder(d=18, h=31);
            translate([0,10,16])
                cube([32,20,60], center=true);
            translate([-17,0,16])
                cube([32,20,60], center=true);
        }
    }
    module _duct_ext() {
        difference() {
            translate([11,-28,-43])
                cube([9,44,10], center=true);
            translate([12,-27.5,-43])
                cube([12,31,8], center=true);
        }
    }
    _duct_cyd();
    _duct_ext();
}

module xb_du() {
    module _xb_du_mount() {
        difference() {
            translate([8,-50,-38])
                cube([6,10,10]);
            translate([8,-45,-34])
            rotate([0,90,0])
                heatset_m3x4(H=4);
            // translate([0,-42.01 - d_cr_d,-.5])
            //     xb_fh_bolts();
        }

    }
    xb_du_duct();
    _xb_du_mount();
    mirror([1,0,0]) {
        xb_du_duct();
        _xb_du_mount();
    }
}
