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

module ven_fan2510() {
    cube([25, 25, 10]);
}
