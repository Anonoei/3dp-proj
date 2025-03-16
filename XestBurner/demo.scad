include <src/main.scad>

translate([0,20,0])
    color([0.6,0.2,0.2,0.1]) cube([d_max_w, 0.01, d_max_h], center=true);

// translate([0,10,0])
//     mgn9h();
// xb_cr_mgn9h();

translate([0,11.2,0])
    mgn12h();
xb_cr_mgn12h();

xb_fh();
