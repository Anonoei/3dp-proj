mi50_h = 97;
mi50_d = 300;
mi50_w = 39;

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
        translate([29,6,0])
            cylinder(d=3,h=10);
        translate([29,6+16,0])
            cylinder(d=3,h=10);
        translate([29,6+16+16,0])
            cylinder(d=3,h=10);

        translate([26,mi50_h-1.5-4,0])
            cylinder(d=3,h=10);
    }
}

module mi50_body() {
    difference() {
        translate([-1.5,0,-1.5])
            color(c_G) cube([mi50_w,mi50_d,mi50_h]);
        translate([0,-1,0])
            color(c_G) cube([mi50_w-1.5-4.5,mi50_d+2,mi50_h-1.5*2]);
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

module amd_mi50_rear_mount() {
    module _base() {
        translate([-2,-2,-1.5])
            cube([40,2,48.5]);
        translate([-2,-2,40])
            cube([16,2,55.5]);
        translate([-2,-2,86])
            cube([40,2,9.5]);
        translate([34,-2,46])
            cube([4,2,40]);


        translate([0,0,10])
            cube([25,2,30]);
    }
    difference() {
        _base();
        translate([0,-5,0])
        mi50_body_rear_bolts();
        translate([-1.5,-5,0])
            ven_fan4020(cut=true);
    }
}
