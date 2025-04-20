module _fp_cam() {
    // difference() {
    //     translate([0,-45,-40])
    //         cube([10,10,10], center=true);
    // }
    c_a = [-20,0,0];
    c_t = [0,-45.4,-1];
    module _cam_cut() {
        translate(c_t + [0,2.1,4.5])
            cube([7,6,6], center=true);
        translate(c_t + [0,3.1,2])
            cube([7,4,2], center=true);
        translate(c_t + [0,4,7.5])
        rotate([45,0,0])
            cube([7,5,5], center=true);
        translate(c_t)
        rotate(c_a) {
            cube([7,3.5,7], center=true);
            translate([0,3.5/2,0])
                cube([6,5,7], center=true);
        }

        translate(c_t)
        rotate(c_a)
        rotate([-90,0,0])
            cylinder(h=25,d=0.5);
    }
    module _cam_body() {
        translate(c_t + [0,-2.5-0.1,4-0.1])
            cube([8,4,15], center=true);
        translate(c_t + [0,0,0])
        rotate(c_a)
            cube([8,6,10], center=true);
    }
    difference() {
        _cam_body();
        _cam_cut();
    }
}

module xb_fp_cam_hf(i=false) {
    if (i) {
        xb_fp();
    }
    translate([0,-49,-35])
        cube([8,2,8], center=true);
    translate([0,0,b_hf+10])
        _fp_cam();
}

module xb_fp_cam_uhf(i=false) {
    if (i) {
        xb_fp();
    }
    translate([0,0,-hf_uhf])
    xb_fp_cam_hf();
    translate([0,-49,-28])
        cube([8,2,8], center=true);
}
