include <../src/main.scad>

rotate([90,0,0])
translate([0,d_cr_d,0])
    xb_cr_mgn9h();

translate([-d_cr_w/2,-d_cr_ht-d_cr_em_h,0])
    cube([d_cr_w,d_cr_em_h-0.4,d_cr_em_d-0.4], center=false);
