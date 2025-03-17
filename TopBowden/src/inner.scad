include <../../lib/threads.scad>

module tb_inner_PC4_M6() {
    ScrewHole(6, d_tb_h, pitch=0, tooth_angle=30, tolerance=0.4)
        tb_outer();
}

module tb_inner_passthrough() {
    difference() {
        tb_outer();
        translate([0,0,-1])
        cylinder(h=10, d=4+0.4);
    }
}

module tb_inner_ecas04() {
    module _tb_outer() {
        tb_outer();
        cylinder(h=9-0.001,d=12);
    }
    difference() {
        _tb_outer();
        translate([0,0,-1])
            cylinder(h=20,d=3);
        translate([0,0,1])
            ecas04();
    }
}

module tb_inner_ecas04_pc4_m6() {
    module _tb_outer() {
        tb_inner_PC4_M6();
        translate([0,0,5])
            cylinder(h=8,d=12);
    }

    difference() {
        _tb_outer();
        // translate([0,0,-3])
        //     cylinder(h=20,d=3);
        translate([0,0,5.001])
            ecas04();
    }
}
