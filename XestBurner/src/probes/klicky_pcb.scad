module xb_pr_klicky_pcb() {
    module _xb_pr_klicky_cut() {
        translate([5.3,0.1,-1])
            cylinder(d=3, h=20);
        translate([-5.4,5.4,-1])
            cylinder(d=3, h=20);
        translate([-5.4,-5.4,-1])
            cylinder(d=3, h=20);
        translate([-4.15,-5.7,-1])
            cube([8.2,10.2,20]);
    }

    difference() {
        union() {
            xb_pr();
            translate([0,8+1,-d_cr_hb])
            translate([-9,-8,0])
                cube([18,16,5]);
        }
        translate([0,8+1,-d_cr_hb])
        _xb_pr_klicky_cut();
    }
}
