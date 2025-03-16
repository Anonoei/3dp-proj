include <src/main.scad>

module ex_ecas() {
    tb_mount();
    adapter_ecas04();
}

rotate([90,0,0]) {
    translate([0,0,-10])
    difference() {
        ex_ecas();
        translate([0,0,-1])
            cube([50,50,20]);
    }

    translate([-20,-5,5])
        adapter_PC4_M6();
    translate([20,-5,5])
        adapter_passthrough();
    translate([0,20, 5])
        adapter_ecas04();
}
