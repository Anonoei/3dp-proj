// ----- Bounds ----- //
// Carriage
module xb_b_cr() {
    translate([0,12,-5.5])
        color([0.8,0.1,0.1,0.2]) cube([d_max_w, 0.001, d_max_h], center=true);
}

// Hotend
module xb_b_he() {
    translate([0,-15.5-d_cr_d,0]) {
        translate([0,0,-50])
            color([0.8,0.1,0.1,0.2]) cylinder(h=60, d=30);
        translate([0,0,10])
            color([0.3,0.3,0.3,0.2]) cylinder(h=20, d=4);
    }
}

// Fan Housing
module xb_b_fh() {
    translate([0,-21.5,-4])
    translate([0,-20.25,-2.5])
        color([0.1,0.1,0.1,0.4]) cube([25,10,25], center=true);
}
