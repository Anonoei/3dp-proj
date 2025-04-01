module xb_fh_bolts() {
    module _xb_fh_bolt() {
        translate([-d_m_fh_w/2+2,-14,d_m_fh_h-5.5])
        rotate([-90,90,0])
        translate([-5.5,2,0]) {
            bolt_shcs_m3(10);
        }
    }
    _xb_fh_bolt();
    mirror([-d_max_w/2,0,0])
        _xb_fh_bolt();
}

module xb_du_bolts() {
    module _du_bolt() {
        translate([d_max_w/2+2.5,4,-36.5+4])
        rotate([0,-90,0]) {
            bolt_shcs_m3(16);
            translate([0,32,-0])
                bolt_shcs_m3(16);
        }
    }
    translate([0,-42.01 - d_cr_d,0]) {
        _du_bolt();
        mirror([1,0,0])
            _du_bolt();
    }
}

module xb_fh_bolt_cut() {
    module _xb_fh_bolt() {
        translate([-d_max_w/2,0,d_m_fh_h-5])
        translate([14,40,0])
        rotate([90,90,0])
        translate([-5.5,2,0]) {
            bolt(d=3);
            translate([0,0,28+0.001])
            bolt(d=6, h=50);
        }
    }
    _xb_fh_bolt();
    mirror([-d_max_w/2,0,0])
        _xb_fh_bolt();
}

module xb_fh_2510_cut() {
    rotate([90,90,0]) {
        for (i=[10,-10]) {
            translate([i,i,0]) {
                bolt(d=3,h=20);
            }
            translate([i,-i,0]) {
                bolt(d=3,h=20);
            }
        }
        translate([0,0,-10])
        cylinder(d=21,h=20);
    }
    translate([0,0,0])
        cube([25.5,10.5,25.5],center=true); // Fan
}

module xb_fh_4010_cut() {
    module _4010_base() {
        translate([d_max_w/2-12,40.5,4.5])
        rotate([90,90,0]) {
            difference() {
                translate([0,0,-4])
                    cube([40.5,10.5,44.5]); // Main body
                translate([-0.01,4,40.5-5 + 0.01]) { // Top corner
                    translate([2.5,0,2.5])
                    rotate([-90,0,0])
                        cylinder(d=5,h=8);
                    translate([-.5,0,0])
                        cube([3,10,5]);
                    translate([0,0,2.5])
                        cube([5,10,3]);
                }
                translate([35.5+0.01,5,40.5-5 + 0.01]) {
                    translate([2.5,0,2.5])
                    rotate([-90,0,0])
                        cylinder(d=5,h=8);
                    translate([2.5,0,0])
                        cube([5,10,3]);
                    translate([0,0,2.5])
                        cube([5,10,3]);
                }
            }
            translate([2.5,10,0])
                cube([40-4,10,40-4]); // Fan blades
            translate([40,1.25,10/2-7])
                cube([10,8,37]);
        }
    }
    _4010_base();
    mirror([d_max_w,0,0])
        _4010_base();
}

module xb_fh() {
    module _xb_fh_4010() {
        module _xb_4010_mount() {
            translate([-14,37,d_m_fh_h-4])
            rotate([0,0,-45])
            difference() {
                rotate([0,0,45])
                    cube([5,5,8]);
                translate([-0.01, -0.01, -0.01])
                cube([10,10,10]);
            }
        }
        module _xb_4010_base() {
            translate([d_max_w/2-14,42+0.01,6.5])
            rotate([90,90,0]) {
                difference() {
                    cube([44,2+10,42]);
                    translate([40.01,3,-0.01])
                        cube([20,12,42-5]);
                }
            }
            _xb_4010_mount();
        }

        difference() {
            union() {
                _xb_4010_base();
                mirror([d_max_w,0,0])
                    _xb_4010_base();
            }
            xb_fh_4010_cut();
            xb_fh_bolt_cut();
        }
    }
    module _xb_fh_2510() {
        w = 25.5+3.5;
        h = 25.5 + 3;
        module _xb_2510_base() {
            translate([0,0,0])
                cube([w,11+1.2-0.01,h], center=true);
        }
        difference() {
            _xb_2510_base();
            translate([0,1,1.5+0.01])
                xb_fh_2510_cut();
        }
    }

    difference() {
        translate([0,-42.01 - d_cr_d,-.5])
        union() {
            _xb_fh_4010();
            translate([0,6.1,-7.75])
                _xb_fh_2510();
        }
        xb_du_bolts();
    }
}
