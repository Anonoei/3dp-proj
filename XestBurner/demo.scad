include <src/main.scad>

module xb_hardware() {
    color(c_yl) xb_he_bolts();
    color(c_yl) xb_du_bolts();
    color(c_yl) xb_fh_bolts();
    color(c_yl) xb_cr_belt_pin();

}

module mgn12() {
    color(c_pl) xb_cr_mgn12h();
    translate([0,8.5,0])
        ven_mgn12h(100);
}

module mgn9() {
    color(c_pl) xb_cr_mgn9h();
    translate([0,8,0])
        ven_mgn9h(100);
}

module xb() {
    color(c_gl) xb_em();
    color(c_rl) xb_he();
    color(c_cl) xb_fh();
    color(c_y) xb_fh_brace();
    color(c_ol) xb_du_hf();
    color(c_ll) xb_pr();
    color(c_sl) xb_fp();
    color(c_pl) xb_cr();
    xb_hardware();
    include <src/bounds.scad>
    // xb_b_he();
}

module palladium() {
    color(c_gl) xb_em_sherpa_mini();
    color(c_rl) xb_he_chube();
    color(c_cl) xb_fh();
    color(c_y)  xb_fh_brace();
    color(c_ol) xb_du_uhf();
    color(c_ll) xb_pr_klicky_pcb();
    color(c_sl) xb_fp();
    mgn12();
    xb_hardware();
    translate([0,-21.5,-56])
        color([0.8,0.1,0.1,0.5]) ven_hotend_chube();
}

difference() {
    palladium();
    // translate([-10,-100,-80])
    // rotate([0,0,-10])
    //     color([0.4,0,0.4,0.4]) cube([200,200,200]);
}
