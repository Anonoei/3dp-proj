include <../../lib/threads.scad>

module adapter_PC4_M6() {
    ScrewHole(6, d_tb_h, pitch=0, tooth_angle=30, tolerance=0.4)
        tb_center();
}

module adapter_passthrough() {
    difference() {
        tb_center();
        translate([0,0,-1])
        cylinder(h=10, d=4+0.4);
    }
}

module adapter_ecas04() {
    ecas04_d = 8.1;
    ecas04_d_1 = 10;
    ecas04_h = 8;
    ecas04_h_1 = 2.4;
    module ecas04() {
        cylinder(d=ecas04_d + 0.3, h=ecas04_h);
        translate([0,0,0])
            cylinder(d=ecas04_d+1, h=ecas04_h-ecas04_h_1);
    }
    module _tb_center() {
        tb_center();
        cylinder(h=9-0.001,d=12);
    }
    difference() {
        _tb_center();
        translate([0,0,-1])
            cylinder(h=20,d=3);
        translate([0,0,1])
            ecas04();
    }
}
