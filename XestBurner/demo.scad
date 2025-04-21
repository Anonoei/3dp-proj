include <src/main.scad>

include <src/bounds.scad>

module xb_hardware() {
    color(c_yl) xb_he_bolts();
    color(c_yl) xb_du_bolts();
    color(c_yl) xb_fh_bolts();
    color(c_yl) xb_cr_belt_pin();
    color(c_yl) xb_fp_bolts();

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

module xb_base() {
    color(c_gl) xb_em();
    color(c_rl) xb_he();
    color(c_cl) xb_fh();
    color(c_y) xb_fh_brace();
    color(c_ol) xb_du_hf();
    color(c_ll) xb_pr();
    color(c_sl) xb_fp();
    color(c_pl) xb_cr();
    xb_hardware();
}

module xb_pfa() {
    color(c_gl) xb_em_sherpa_mini();
    color(c_rl) xb_he_dragonfly_bmo();
    color(c_cl) xb_fh();
    color(c_y)  xb_fh_brace();
    color(c_ol) xb_du_hf();
    color(c_ll) xb_pr_klicky_pcb_hf();
    color(c_sl) xb_fp_led_hf();
    color(c_sl) xb_fp();
    mgn9();
    xb_hardware();
    translate([0,d_he_c,d_he_hf])
        color([0.8,0.1,0.1,0.5]) ven_hotend_phaetus_dragonfly_bmo();
    xb_b_hf();
}

module mercury() {
    color(c_gl) xb_em_sherpa_mini();
    color(c_rl) xb_he_rapido();
    color(c_cl) xb_fh();
    color(c_y)  xb_fh_brace();
    color(c_ol) xb_du_hf();
    color(c_ll) xb_pr_klicky_pcb_hf();
    color(c_sl) xb_fp_cam_hf();
    color(c_sl) xb_fp_led_hf();
    color(c_sl) xb_fp();
    mgn9();
    xb_hardware();
    translate([0,d_he_c,d_he_hf])
    rotate([0,0,90])
        color([0.8,0.1,0.1,0.5]) ven_hotend_phaetus_rapido();
    xb_b_hf();
}

module palladium() {
    color(c_gl) xb_em_sherpa_mini();
    color(c_rl) xb_he_chube();
    color(c_cl) xb_fh();
    color(c_y)  xb_fh_brace();
    color(c_ol) xb_du_uhf();
    color(c_ll) xb_pr_klicky_pcb_uhf();
    color(c_sl) xb_fp_cam_uhf();
    color(c_sl) xb_fp_led_uhf();
    color(c_sl) xb_fp();
    mgn12();
    xb_hardware();
    translate([0,d_he_c,d_he_uhf])
    rotate([0,0,90])
        color([0.8,0.1,0.1,0.5]) ven_hotend_chube();
    xb_b_uhf();
}

module demo() {
    translate([32,0,0])
        xb_base();
    translate([-32,0,0])
        palladium();
}
demo();
