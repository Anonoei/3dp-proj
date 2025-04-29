include <./dimensions.scad>

module mi50_body_rear_mount() {
    translate([18,0,mi50_h-3-8])
        cube([15,5,8]);

    translate([11.5,0,mi50_h-3-3-5])
        cube([10,5,5]);

    translate([11.5,0,mi50_h-3-3-49])
        cube([5,5,49]);

    translate([11.5,0,mi50_h-3-3-49])
        cube([18,5,5]);

    translate([mi50_w-6-8,0,0])
        cube([8,5,47]);
}

module mi50_body_rear_bolts() {
    translate([0,10-1,0])
    rotate([90,0,0]) {
        translate([28,6,0])
            cylinder(d=3,h=10);
        translate([28,6+16.5,0])
            cylinder(d=3,h=10);
        translate([28,6+16.5+16.5,0])
            cylinder(d=3,h=10);

        translate([25,mi50_h-1.5-4,0])
            cylinder(d=3,h=10);
    }
}

module mi50_body() {
    color(c_G) difference() {
        union() {
            translate([-1.5,0,-1.5])
                cube([mi50_w,mi50_d,mi50_h]);
            translate([mi50_w-6-1.5,0,-1.5-2])
                cube([6,mi50_d,mi50_h+4]);
        }
        translate([0,-1,0])
            cube([mi50_w-1.5-4.5,mi50_d+2,mi50_h-1.5*2]);
    }
}

module mi50_body_rear() {
    difference() {
        mi50_body_rear_mount();
        mi50_body_rear_bolts();
    }
}

module amd_mi50() {
    mi50_body();
    mi50_body_rear();
}
