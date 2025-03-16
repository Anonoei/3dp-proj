include <src/main.scad>

rotate([90,0,0]) {
translate([0,0,-10])
tb_mount();

translate([-20,-5,5])
    adapter_PC4_M6();
translate([20,-5,5])
    adapter_passthrough();
translate([0,20, 5])
    adapter_ecas04();
}
