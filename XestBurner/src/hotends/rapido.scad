module xb_he_rapido() {
    module _mount() {
        translate([0,d_he_c,d_he_hf])
            ven_hotend_phaetus_rapido(true,he=20);
        translate([0,d_he_c,-5])
            cylinder(d=4.5,h=60);
    }
    module _base() {
        union() {
            xb_he();
            translate([0,d_he_c,6.5+0.01])
                cylinder(d=25,h=5);
        }
    }
    difference() {
        _base();
        _mount();
    }
}
