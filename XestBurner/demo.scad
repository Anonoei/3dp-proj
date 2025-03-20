include <src/main.scad>
// translate([0,10,0])
//     mgn9h();
// xb_cr_mgn9h();

translate([0,11.2,0])
    ven_mgn12h();
xb_cr_mgn12h();

// xb_cr();

// xb_fh();

translate([0,-17,-50])
    color([0.5,0.1,0.1,0.2]) cylinder(h=60, d=25.4);

// Bounds
translate([0,12,-5.5])
    color([0.6,0.2,0.2,0.1]) cube([d_max_w, 0.001, d_max_h], center=true);
