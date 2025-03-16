module xb_fh() {
    module _xb_fh_4010() {
        translate([-d_max_w/2,0,d_cr_fh_h-5]) {
            difference() {
                translate([0,0,0])
                    cube([14,42,44]);
                translate([1,-1,2])
                    cube([11,44,40+0.001]);
                translate([-1,-1,4])
                    cube([12,44,36]);
            }
            translate([0,0,2])
                cube([4,5,2]);
            translate([0,0,40])
                cube([4,5,2]);
        }
    }
    translate([0,-45,0]) {
        _xb_fh_4010();
        mirror([d_max_w,0,0])
            _xb_fh_4010();
    }

    module _xb_fh_2510() {
        difference() {
            translate([-25/2,-6,-25/2])
            cube([25,2,25], center=false);
            rotate([90,90,0]) {
                translate([10,10,0])
                    bolt(d=3,h=20);
                translate([-10,10,0])
                    bolt(d=3,h=20);
                translate([10,-10,0])
                    bolt(d=3,h=20);
                translate([-10,-10,0])
                    bolt(d=3,h=20);
            }
        }
    }

    translate([0,-27,0]) {
        _xb_fh_2510();
    }

}
