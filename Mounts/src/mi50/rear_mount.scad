include <./dimensions.scad>
include <./body.scad>

module amd_mi50_rear_mount() {
    d = 3;
    module _base() {
        translate([-2,-d,-1.5])
            cube([40,d,48.5]);
        translate([-2,-d,40])
            cube([16,d,55.5]);
        translate([-2,-d,86])
            cube([40,d,9.5]);
        translate([34,-d,46])
            cube([4,d,40]);


        translate([0,0,3])
            cube([25,5,40]);
    }
    difference() {
        _base();
        translate([0,-5,0])
        mi50_body_rear_bolts();
        translate([-1.5,-5,0])
            ven_fan4020(cut=true);
    }
}
