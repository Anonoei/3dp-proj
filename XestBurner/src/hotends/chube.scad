module xb_he_chube() {
    // module _xb_he_mount() {
    //     n = 6;
    //     r = 9;
    //     delta = 360/n;
    //     translate([0,-21.5,0])
    //     for (i=[0:n-1]) {
    //         phi = i * delta;
    //         translate([r*cos(phi), r*sin(phi), 15.5])
    //             rotate([180,0,0])
    //             bolt_shcs_m3(v=true);
    //     }
    // }
    difference() {
        xb_he();
        translate([0,d_he_c,-55.7])
        rotate([0,0,90])
            ven_hotend_chube(true);
    }

}
