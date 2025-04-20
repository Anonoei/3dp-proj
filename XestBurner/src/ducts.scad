module xb_du_duct() {
    module _duct_cyd() {
        module _cyd_cut() {
            translate([5,-d_cr_d-45,-38])
                cube([25,46,20]); // Top
            translate([5,-d_cr_d-45,-50])
                cube([14,46,20]); // Inner
            translate([28,-d_cr_d-45,-50])
                cube([14,46,20]); // Outer
            translate([5,-d_cr_d-45,-51])
                cube([25,46,5]); // Bottom
        }

        difference() {
            translate([d_max_w/2-10,-d_cr_d,-36])
            rotate([90,0,0])
            translate([0,0,0])
                cylinder(d=22, h=44-0.01);
            _cyd_cut();
        }
    }
    module _duct_ext() {
        translate([14,-44-6,-40])
            cube([4,44,2]);
        translate([16.75,-28,-42])
            cube([9.5,44,8], center=true);
        translate([16.75,-28,b_hf+2+4])
            cube([9.5,44,4], center=true);
    }

    union() {
        _duct_cyd();
        _duct_ext();
    }
}

module xb_du_path() {
    od = 13;
    id = od-8.25;
    oa = -70;
    op = 16;
    t = 20;
    points = [
        [id,t], [od,t],
        for (a = [0:op]) [od*cos(a*(oa/op)), od*sin(a*(oa/op))],
        [2,-13],
        [-4,-14],
        // [-4,-14],
        for (a = [0:op]) [id*cos((op-a)*(oa/op)), id*sin((op-a)*(oa/op))-4],
    ];

    module _xb_path() {
        difference() {
            translate([12.5,-12+6,-35])
            rotate([90,0,0])
                linear_extrude(36, convexity=2)
                polygon(points);
            translate([13,-12,-38])
                cube([15,6+0.01,24]);
        translate([2,-1.8,-66])
        rotate([20,0,0])
            cube([30,20,30]);
        translate([2,-52,-70])
        rotate([20,0,0])
            cube([30,20,30]);
        }
    }
    _xb_path();
    mirror([1,0,0])
        _xb_path();
}

module xb_du_top() {
    difference() {
        union() {
            translate([26,-50,-40])
                cube([2,44,12]);
            translate([17.25,-12,-38])
                cube([10,6,1.5]);
        }
        translate([25,-37,-32]) {
            hull() {
                rotate([60,0,0])
                    cube([10,10,10]);
                translate([0,18,0])
                rotate([30,0,0])
                    cube([10,10,10]);
            }
        }
    }
}

module xb_du_mount() {
    module _du_mount() {
        difference() {
            translate([12,-50,-39.1])
                cube([2,10,9]);
            translate([8,-45.5,-34])
            rotate([0,90,0])
                bolt(d=2.8,h=20);
        }
        difference() {
            translate([12,-22,-39.1])
                cube([2,16,9]);
            translate([8,-45.5+35,-34])
            rotate([0,90,0])
                bolt(d=2.8,h=20);
            translate([11.01,-22,-39])
            rotate([45,0,0])
                cube([4,14,12]);
        }
        translate([25,-48+5,-38])
            cube([1,32,1.5]);
    }
    _du_mount();
    difference() {
        xb_du_top();
        translate([1,0,0])
            xb_du_bolts();
    }
}

module xb_du_hf() {
    difference() {
        union() {
            xb_du_duct();
            xb_du_mount();
            mirror([1,0,0]) {
                xb_du_duct();
                xb_du_mount();
            }
        }
        translate([0,0,-1.5])
        xb_du_path();
    }
}

module xb_du_uhf() {
    module _du_ext() {
        translate([12,-50,-48])
            cube([2,10,10]);
        difference() {
            translate([12,-30,-48])
                cube([2,24,10]);
            translate([11.01,-33,-50])
                rotate([45,0,0])
                    cube([4,30,20]);
        }
        translate([14,-50,-48])
            cube([12,44,10]); // Main extension
        translate([26,-50,-48])
            cube([2,44,8]); // Outer
    }

    difference() {
        union() {
            _du_ext();
            xb_du_mount();
            mirror([1,0,0])  {
                _du_ext();
                xb_du_mount();
            }

            translate([0,0,-hf_uhf]) {
                xb_du_duct();
                mirror([1,0,0]) {
                    xb_du_duct();
                }
            }
        }
        translate([0,0,-hf_uhf-1.5])
            xb_du_path();
    }
}
