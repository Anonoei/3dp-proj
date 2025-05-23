hf_uhf = 8.5;
b_hf = 4-45.5-6-2; // +4mm,-45.5 (hf),-6 (nozzle)
b_uhf = b_hf - hf_uhf;
d_he_hf = -47.5;
d_he_uhf = -56;
d_he_c = -21.5;

// ----- Carriage ----- //
d_max_w = 56;
d_max_h = 65;
d_max_d = 50;
d_cr_w = 40;
d_cr_wt = 48;
d_cr_wb = 40;
d_cr_d = 6;
d_cr_ht = 15.5;
d_cr_hb = 38;
d_cr_H = d_cr_ht + d_cr_hb;
// Hotend/Extruder mount holes
d_m_he_w = 42;
d_m_he_h = 13;
// Fan Housing mount holes
d_m_fh_w = 24.6;
d_m_fh_h = -25.5;
// Probe mount holes
d_m_pr_o = 4;
// Faceplate mount holes
d_m_fp_w = d_m_he_w/2-10;
d_m_fp_h = d_m_he_h-3;
// Extruder mount
d_cr_em_o = 3;
d_cr_em_w = d_cr_w;
d_cr_em_h = 5;
d_cr_em_d = d_cr_d-d_cr_em_o;
// Probe
d_cr_pr_o = 49;
d_cr_pr_w = 9;
d_cr_pr_h = 9;
d_cr_pr_d = 8;
d_cr_pr_off = -(d_cr_hb - 18);
d_cr_pr_wire = 4;
