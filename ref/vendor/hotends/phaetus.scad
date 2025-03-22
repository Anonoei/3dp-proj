module ven_hotend_phaetus_dragonfly_bmo() {
    // _ptfe_length = 33;
    hb_h = 42.4-16.7;
    hb_d = 18;
    hc_x = 26.5;
    hc_y = hb_d;
    hc_h = 58.3 - 42.4;
    to_h = 62.3 - 58.3;

    translate([0,0,hb_h + hc_h + to_h])
    rotate([180,0,0])
    union() {
        cylinder(h=hb_h, d=hb_d);
        translate([0,0,hb_h+(hc_h/2)])
            cube([hc_x, hc_y, hc_h], center=true);
    }
    nozzle_v6();
}
