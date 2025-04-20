module xb_em_sherpa_mini() {
    m_w = 52;
    m_o = 21.75;
    module _em_mount() {
        translate([0,-m_o,d_cr_ht+5]) {
            translate([m_o-2.75,-3,-5])
                cube([5+2,4,5]);
        }
    }

    module _em_hs() {
        translate([m_o,d_he_c,d_cr_ht])
            heatset_m3x4(H=2);
    }

    difference() {
        union() {
            xb_em();
            _em_mount();
            mirror([m_o,0,0])
                _em_mount();
        }
        _em_hs();
        mirror([m_o,0,0])
            _em_hs();
    }
}
