module xb_du_duct() {
    module _duct_cyd() {
        translate([d_max_w/2-10,-d_cr_d,-38])
        rotate([90,0,0])
        difference() {
            translate([-1,-1,0])
            cylinder(d=22, h=44);
            translate([0,10,16])
                cube([32,20,60], center=true);
            translate([-17,0,16])
                cube([32,20,60], center=true);
            translate([-15,-11,20])
            rotate([0,0,30])
                cube([32,30,60], center=true);
        }
    }
    module _duct_ext() {
        translate([14,-44-6,-40])
            cube([4,44,2]);
        translate([16.75,-28,-44-0.1])
            cube([9.5,44,10], center=true);
        // translate([8,-50,-49.1])
        //     cube([6,10,10]);
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
        translate([12.5,-12,-35])
        rotate([90,0,0])
            linear_extrude(31, convexity=2)
            polygon(points);
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
            translate([8,-44,-32.5])
            rotate([0,90,0])
                bolt(d=2.8,h=20);
        }
        difference() {
            translate([12,-22,-39.1])
                cube([2,16,9]);
            translate([8,-12,-32.5])
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
        xb_du_path();
    }
}

module xb_du_uhf() {
    module _du_ext() {
        translate([12,-50,-46])
            cube([2,10,10]);
        difference() {
            translate([12,-28,-46])
                cube([2,22,8]);
            translate([11.01,-33,-50])
                rotate([45,0,0])
                    cube([4,30,20]);
        }
        translate([14,-50,-44])
            cube([12,44,6]);
        translate([26,-50,-44])
            cube([2,44,4]);
    }

    difference() {
        union() {
            _du_ext();
            xb_du_mount();
            mirror([1,0,0])  {
                _du_ext();
                xb_du_mount();
            }

            translate([0,0,-6]) {
                xb_du_duct();
                mirror([1,0,0]) {
                    xb_du_duct();
                }
            }
        }
        translate([0,0,-6])
            xb_du_path();
    }
}
