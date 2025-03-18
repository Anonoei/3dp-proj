include <src/main.scad>

module ex_ecas() {
    tb_outer_hs();
    tb_inner_ecas04_pc4_m6();
    translate([0,-10,20])
            color([0.0,0.0,0.0]) text("outer hs", size=3);
}

rotate([90,0,0]) {
    translate([30,0,-10])
    difference() {
        ex_ecas();
        translate([0,0,-1])
            cube([50,50,20]);
    }
    translate([-30,-10,-10]) {
        tb_outer_m3();
        translate([-5,-10,20])
            color([0.0,0.0,0.0]) text("outer m3", size=3);
    }

    translate([-10,-5,5]) {
        tb_inner_PC4_M6();
        translate([-1,8,10])
            color([0.0,0.0,0.0]) text("inner", size=2);
        translate([-5,-3,10])
            color([0.0,0.0,0.0]) text("PC4-M6", size=2);
    }
    translate([15,-5,5]) {
        tb_inner_passthrough();
        translate([-1,8,10])
            color([0.0,0.0,0.0]) text("inner", size=2);
        translate([-5,-3,10])
            color([0.0,0.0,0.0]) text("passthrough", size=2);
    }
    translate([-10,20, 5]) {
        tb_inner_ecas04();
        translate([-1,8,10])
            color([0.0,0.0,0.0]) text("inner", size=2);
        translate([-5,-3,10])
            color([0.0,0.0,0.0]) text("ECAS04", size=2);
    }
    translate([15,20, 5]) {
        tb_inner_ecas04_pc4_m6();
        translate([-1,8,10])
            color([0.0,0.0,0.0]) text("inner", size=2);
        translate([-5,1,13])
            color([0.0,0.0,0.0]) text("ECAS04", size=2);
        translate([-5,-3,13])
            color([0.0,0.0,0.0]) text("PC4-M6", size=2);
    }
}
