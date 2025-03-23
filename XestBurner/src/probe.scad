module xb_pr() {
    module _xb_pr_base() {
        difference() {
            translate([0,d_cr_pr_d,d_cr_pr_off-4.5])
            rotate([90,0,0])
                cylinder(d=d_cr_pr_o, h=d_cr_pr_d, $fn=6);
            translate([0,0.02,0])
                cube([d_cr_pr_o,d_cr_pr_d*2,d_cr_pr_o], center=true);
            translate([0,d_cr_pr_d+0.02,d_cr_pr_off-4.5])
            rotate([90,0,0])
                cylinder(d=d_cr_pr_o-d_cr_pr_w*2, h=d_cr_pr_d*2, $fn=6);
            translate([0,d_cr_pr_d/2,d_cr_pr_off-d_cr_pr_h-13.5])
                cube([d_cr_pr_o,d_cr_pr_d*2,d_cr_pr_h], center=true);
        }
        translate([0,d_cr_pr_d/2,d_cr_pr_off-d_cr_pr_h-6.5])
            cube([30,d_cr_pr_d,5], center=true);
        xb_cr_pr_cut();
    }
    module _xb_pr_bolt() {
        translate([(d_cr_pr_o-d_cr_pr_w)/2, d_cr_d/2+2,(-d_cr_hb + d_cr_pr_h)]) {
            translate([0,0,5])
                bolt(d=3,h=20);
            translate([0,0,-8])
                bolt(d=6,h=20);
        }
    }
    union() {
        difference() {
            _xb_pr_base();
            _xb_pr_bolt();
            mirror([(d_cr_pr_o-d_cr_pr_w)/2,0,0])
                _xb_pr_bolt();
        }
    }
}
