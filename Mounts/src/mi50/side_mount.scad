include <./dimensions.scad>
include <./body.scad>

module amd_mi50_side_mount() {
    translate([mi50_w-1.5,0,-1.5-4])
        cube([2,120,mi50_h+4+(2*2)]);
    translate([mi50_w-1.5,120,-1.5])
        cube([2,mi50_d-120-1.5,mi50_h]);

    translate([mi50_w-10,0,mi50_h-1.5+2])
        cube([10,120,2]);
    translate([-1.5-2,0,mi50_h-1.5])
        cube([mi50_w-4,120,2]);

    translate([mi50_w-10,0,-1.5-4])
        cube([10,120,2]);
    translate([-1.5-2,0,-1.5-2])
        cube([mi50_w-4,120,2]);

    translate([-1.5-2,0,-1.5-4])
        cube([2,120,mi50_h+(2*2)]);
}
