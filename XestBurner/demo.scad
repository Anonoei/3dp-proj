include <src/main.scad>

module xb() {
    color(c_he) xb_he_chube();
    xb_he_bolts();
    color(c_du) xb_du();
    color(c_fh) xb_fh();
    color(c_em) xb_em_sherpa_mini();
    color(c_pr) xb_pr_klicky_pcb();

    // translate([0,8,0])
    //     ven_mgn9h();
    // xb_cr_mgn9h();

    translate([0,8.5,0])
        ven_mgn12h(100);
    color(c_cr) xb_cr_mgn12h();

    // color(c_cr) xb_cr();
    xb_cr_belt_pin();
}

// translate([0,0,25])
// difference() {
    xb();
//     translate([0,-100,-100])
//         color([1,0,1]) cube([200,200,200]);
// }

// translate([-25.6,-15.3,18])
// rotate([90,0,0]) {
//     import("/Users/anonoei/Downloads/housing_core_x1_rev16.STL");
//     translate([0,-2,-7])
//     import("/Users/anonoei/Downloads/housing_rear_x1_rev17.STL");
//     translate([47.5,29.7,-28])
//     cylinder(h=20,d=5);
// }

include <src/bounds.scad>
// xb_b_he();
