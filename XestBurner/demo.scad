include <src/main.scad>

module xb() {
    color(c_gl) xb_em_sherpa_mini();
    color(c_rl) xb_he_chube();
    color(c_cl) xb_fh();
    // color(c_ol) xb_du();
    // color(c_ll) xb_pr_klicky_pcb();
    color([0.6,0,0.6,0.5]) xb_fp();

    color(c_yl) xb_he_bolts();
    color(c_yl) xb_du_bolts();
    color(c_yl) xb_fh_bolts();
    color(c_yl) xb_cr_belt_pin();

    // translate([0,8,0])
    //     ven_mgn9h();
    // xb_cr_mgn9h();

    translate([0,8.5,0])
        ven_mgn12h(100);
    color(c_pl) xb_cr_mgn12h();

    // color(c_cr) xb_cr();


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
