module ven_hotend_phaetus_rapido(bolts=false,he=0) {
    // _ptfe_length = 33;
    z_tot = 54.0;
    z_ct = 26.0;
    z_hb = 54.0;

    h_t = z_tot;
    h_ct = z_ct;
    h_hb = z_hb-z_ct-6;

    d_hb = 22.5;
    module _mount() {
        n = 4;
        r = 8;
        delta = 360/n;
        rotate([0,0,65])
        for (i=[0:n-1]) {
            phi = i * delta;
            translate([r*cos(phi), r*sin(phi), h_t+2.5+2])
                rotate([180,0,0])
                bolt_shcs_m2_5(v=true,he=he);
        }
    }
    module _rapido() {
        module _body() {
            translate([0,0,0])
                nozzle_v6();
            translate([0,0,6])
                cylinder(d2=d_hb, d1=d_hb-6, h=h_hb-1);
            translate([0,0,6+h_hb])
                cylinder(d=d_hb,h=h_ct);
        }
        _body();
        translate([0,0,h_t])
            cylinder(d=4,h=8);

    }
    if (bolts) {
        _mount();
    } else {
        _rapido();
    }
}
