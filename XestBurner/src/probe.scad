module xb_pr() {
    module _xb_pr_bolt() {
        translate([(d_cr_pr_o-d_cr_pr_w)/2, d_cr_d/2+d_cr_pr_d-d_m_pr_o,(-d_cr_hb + d_cr_pr_h)]) {
            translate([0,-3,5])
                bolt(d=3,h=20);
            translate([0,-3,-8])
                bolt(d=6,h=20);
        }
    }
    module _xb_pr_mount() {
        t = d_cr_pr_off + d_cr_pr_h/2;
        b = d_cr_pr_off - d_cr_pr_h/2;
        r = d_cr_pr_o/2-d_cr_pr_w;
        l = d_cr_pr_o/2;
        translate([0,d_cr_pr_d,0])
        rotate([90,0,0])
        linear_extrude(d_cr_pr_d) polygon(
            points=[
                [r-5,-d_cr_hb+7],
                [0,-d_cr_hb+7], [0,-d_cr_hb],
                [d_cr_wb/2-3, -d_cr_hb],
                [l,b-2],
                [l,b],[r,b],
                [r,t], [r-2,t],
            ]
        );
    }
    difference() {
        union() {
            _xb_pr_mount();
            mirror([d_cr_pr_o,0,0])
                _xb_pr_mount();
            xb_cr_pr_cut();
        }
        _xb_pr_bolt();
        mirror([(d_cr_pr_o-d_cr_pr_w)/2,0,0])
            _xb_pr_bolt();
    }
}
