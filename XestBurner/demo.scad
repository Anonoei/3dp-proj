include <src/main.scad>

module xb_hardware() {
    color(c_yl) xb_he_bolts();
    color(c_yl) xb_du_bolts();
    color(c_yl) xb_fh_bolts();
    color(c_yl) xb_cr_belt_pin();
}

module xb() {
    color(c_gl) xb_em_sherpa_mini();
    color(c_rl) xb_he_chube();
    color(c_cl) xb_fh();
    color(c_ol) xb_du_uhf();
    color(c_ll) xb_pr_klicky_pcb();
    color(c_sl) xb_fp();

    // color(c_pl) xb_cr();
    // color(c_pl) xb_cr_mgn9h();
    color(c_pl) xb_cr_mgn12h();

    xb_hardware();

    translate([0,-21.5,-56])
    color([0.8,0.1,0.1,0.5]) ven_hotend_chube();
}

translate([0,8.5,0])
    ven_mgn12h(100);

// translate([0,8,0])
//     ven_mgn9h(100);


difference() {
    xb();
    // translate([-10,-100,-80])
    // rotate([0,0,-10])
    //     color([0.4,0,0.4,0.4]) cube([200,200,200]);
}

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
