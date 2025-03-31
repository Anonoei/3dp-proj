module xb_du_duct() {
    module _duct_cyd() {
        translate([d_max_w/2-2-10,-d_cr_d,-38])
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
        translate([12,-44-6,-40])
            cube([4,44,2]);
        translate([15.5,-28,-44-0.1])
            cube([8,44,10], center=true);
        // translate([8,-50,-49.1])
        //     cube([6,10,10]);
    }
    module _duct_top() {
        translate([24,-50,-40])
            cube([2,44,8]);
        translate([17.25,-12,-38])
            cube([8,6,1.5]);
    }
    module _duct_path() {
        od = 12;
        id = od-6;
        oa = -70;
        op = 16;
        points = [
            [id,0],
            for (a = [0:op]) [od*cos(a*(oa/op)), od*sin(a*(oa/op))],
            [2,-12],
            [-4,-14],
            [-4,-6],
            for (a = [0:op]) [id*cos((op-a)*(oa/op)), id*sin((op-a)*(oa/op))],
        ];

        translate([12.5,-12,-35])
        rotate([90,0,0])
            linear_extrude(31, convexity=2)
            polygon(points);
    }
    difference() {
        union() {
            _duct_cyd();
            _duct_ext();
            _duct_top();
        }
        _duct_path();
        translate([0.2,0,0])
        xb_du_bolts();
    }
    // translate([0,-27.5,-55])
    // cylinder(d=24, h=5);

}

module xb_du_mount() {
    module _du_mount() {
        difference() {
            translate([12,-50,-39.1])
                cube([2,10,8]);
            translate([8,-43,-34.5])
            rotate([0,90,0])
                bolt(d=2.5,h=20);
        }
        difference() {
            translate([12,-20,-39.1])
                cube([2,14,8]);
            translate([8,-11,-34.5])
            rotate([0,90,0])
                bolt(d=2.5,h=20);
            translate([11.01,-20,-40])
            rotate([45,0,0])
                cube([3,14,8]);
        }
    }
    _du_mount();
}

module xb_du_hf() {
    union() {
        xb_du_duct();
        xb_du_mount();
        mirror([1,0,0]) {
            xb_du_duct();
            xb_du_mount();
        }
    }
}

module xb_du_uhf() {
    module _du_ext() {
        translate([12,-50,-46])
            cube([2,10,10]);
        difference() {
            translate([12,-24,-45])
                cube([2,18,8]);
            translate([11.01,-30,-50])
                rotate([45,0,0])
                    cube([3,30,8]);
        }
        difference() {
            translate([14,-50,-44])
                cube([12,44,6]);
            translate([17.5,-42.5,-44.1])
                cube([7,30,8]);
        }
    }

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
}
