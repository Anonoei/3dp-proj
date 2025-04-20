module ven_hotend_phaetus_dragonfly_bmo(bolts=false,he=0) {
    // _ptfe_length = 33;
    z_tot = 62.3;
    z_ad = 16.7;
    z_ct = 42.4;
    z_hb = 58.3;

    z_use = 45.6;

    h_t = z_use;
    h_ct = z_ct-z_ad;
    h_hb = z_hb-z_ct;

    d_hb = 18;
    w_hb = 26.5;
    l_hb = d_hb;
    module _mount() {
        n = 4;
        r = 8.1;
        delta = 360/n;
        rotate([0,0,-24])
        for (i=[0:n-1]) {
            phi = i * delta;
            translate([r*cos(phi), r*sin(phi), h_t+2.5+2])
                rotate([180,0,0])
                bolt_shcs_m2_5(v=true,he=he);
        }
    }
    module _dragonfly() {
        module _body() {
            translate([0,0,0])
                nozzle_v6();
            translate([0,-1.5,4+h_hb/2])
                cube([l_hb,w_hb, h_hb], center=true);
            translate([0,0,4+h_hb])
            rotate([0,0,45/2])
                cylinder(d=d_hb+2, h=h_ct, $fa=45);
                // cube([d_hb, d_hb, hb_h], center=true);
        }
        _body();
        translate([0,0,h_t])
            cylinder(d=4,h=8);

    }
    if (bolts) {
        _mount();
    } else {
        _dragonfly();
    }
}
