module xb_fh_2510_cut() {
    translate([0,-20,-2.5])
    rotate([90,90,0]) {
        for (i=[10,-10]) {
            echo(i);
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
}

module xb_fh() {
    module _xb_fh_4010() {
        module _xb_fh_4010_base() {
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
                translate([14,40,0])
                    cube([5,2,8]);
            }
        }
        module _xb_fh_mount() {
            translate([-d_max_w/2,0,d_cr_fh_h-5])
            translate([14,40,0])
            rotate([90,90,0])
            translate([-5.5,2,0]) {
                bolt(d=3);
                translate([0,0,25+0.001])
                bolt(d=5.5, h=50);
            }
        }
        difference() {
            _xb_fh_4010_base();
            _xb_fh_mount();
        }
    }
    translate([0,-42.01 - d_cr_d,-.5]) {
        _xb_fh_4010();
        mirror([d_max_w,0,0])
            _xb_fh_4010();
    }

    module _xb_fh_2510() {
        difference() {
            translate([0,-20.25,-2.5])
                cube([25,1.5,25], center=true);
            xb_fh_2510_cut();
        }
        module _xb_fh_retain() {
            translate([-14,-15.25,-2.5])
                cube([4,11.5,25], center=true);
        }
        _xb_fh_retain();
        mirror([-14,0,0])
            _xb_fh_retain();
        translate([0,-15.25,-16.5])
        cube([28,11.5,3], center=true);
    }

    translate([0,-27,-4]) {
        _xb_fh_2510();
    }

}
