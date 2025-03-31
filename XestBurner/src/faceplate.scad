module xb_fp() {
    t = d_m_he_h+2;
    l = d_cr_wt/2-8;
    r = -l;
    b = d_m_fh_h-5;
    module _fp() {
        translate([0,-48,0])
        rotate([90,0,0])
        linear_extrude(2, convexity=2) polygon(
            points=[
                [l-8,t], [l,t],
                [l,t-10], [l+8,t-10],
                [l,t-30],
                [l,b/2], [l+8,b+5],
                [l+8,b], [l-2,b],
                [l-2,b+8], [r+10,b+15],
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
    }
}
