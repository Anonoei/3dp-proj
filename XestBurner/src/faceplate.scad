module xb_fp_cut() {
    module _fp_cut() {
        translate([d_m_fp_w,-50,d_m_fp_h])
        rotate([90,0,0])
            bolt(d=3);
    }
    _fp_cut();
    mirror([1,0,0])
        _fp_cut();
}

module xb_fp_bolts() {
    module _fp_bolt() {
        translate([d_m_fp_w,-50-3,d_m_fp_h])
        rotate([-90,0,0])
            bolt_shcs_m3(h=6);
    }
    _fp_bolt();
    mirror([1,0,0])
        _fp_bolt();
}

module xb_fp() {
    t = d_m_he_h+2;
    l = d_cr_wt/2-6.5;
    b = d_m_fh_h-12;
    r = -l;
    module _fp() {
        translate([0,-48,0])
        rotate([90,0,0])
        linear_extrude(2, convexity=2) polygon(
            points=[
                [l-8,t], [l,t],
                [l,t-10], [l+8,t-10],
                [l,t-30],
                [l,b/2], [l+8,b+5],
                [l+8,b], [l-3,b],
                [l-3,b+8.5], [r+10,b+15],
                [r+10,b+20], [l-20,b+20]
            ]
        );
    }
    difference() {
        union() {
            _fp();
            mirror([1,0,0])
                _fp();
        }
        translate([0,-41,-7])
            xb_fh_2510_cut();
        xb_fp_cut();
    }
}
