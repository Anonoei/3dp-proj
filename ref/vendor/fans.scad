module ven_fan4010() {
    module _4010_corner() {
        difference() {
            cube([20,20,10]);
            translate([32/2+1.5,32/2+1.5,4]) { // Top corner
                cylinder(d=5,h=10);
                translate([-2.5,0,0])
                    cube([5,10,10]);
                translate([0,-2.5,0])
                    cube([10,5,10]);
                translate([2.5,2.5,0])
                    cube([7.5,7.5,10]);
            }
        }
    }
    difference() {
        union() {
            _4010_corner();
            mirror([1,0,0])
                _4010_corner();
            mirror([0,1,0])
                _4010_corner();
            mirror([1,1,0])
                _4010_corner();
        }
        translate([0,5,2.01])
            cylinder(d=28, h=8);
    }
}

module ven_fan(w,s,d,cut=false,bolt=false) {
    module _fan() {
        cube([w,d,w], center=true);
    }
    module _cuts() {
        translate([0,d/2+1,0])
        rotate([90,0,0])
            cylinder(d=w-2,h=d+2);
    }
    module _bolts() {
        translate([0,d/2+1,0])
        rotate([90,0,0]) {
            translate([s/2,s/2,0])
                cylinder(d=3,h=d+2);
            translate([s/2,-s/2,0])
                cylinder(d=3,h=d+2);
            translate([-s/2,s/2,0])
                cylinder(d=3,h=d+2);
            translate([-s/2,-s/2,0])
                cylinder(d=3,h=d+2);
        }
    }
    if (cut) {
        translate([w/2,d/2,w/2]) {
            _cuts();
            _bolts();
        }
    } else if (bolt) {
        translate([w/2,d/2,w/2])
            _bolts();
    } else {
        translate([w/2,d/2,w/2])
            _fan();
    }
}

module ven_fan2510(cut=false,bolt=false) {
    ven_fan(25,20,10,cut);
}

module ven_fan4020(cut=false,bolt=false) {
    ven_fan(40,32,20,cut);
}
