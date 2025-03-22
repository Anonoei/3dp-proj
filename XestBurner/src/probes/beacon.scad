module xb_pr_beacon() {
    translate([0,d_cr_pr_d,-40]) {
        difference() {
            cube([31.6+4, 12*2, 1], center=true);
            translate([31.6/2, 3.5,-3])
                cylinder(h=5,d=3);
            translate([-31.6/2, 3.5,-3])
                cylinder(h=5,d=3);
        }
        color([0.8,0,0, 0.2]) cylinder(h=15, d=20);
        color([0.8,0,0, 0.2]) cylinder(h=30, d=20);
        translate([0,0,-2])
            color([0.8,0,0, 0.2]) cube([31.6+4, 12*2, 3], center=true);
    }
}
