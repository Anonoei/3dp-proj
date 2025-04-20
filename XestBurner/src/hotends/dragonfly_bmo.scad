module xb_he_dragonfly_bmo() {
    module _mount() {
        translate([0,-21.5,-47.5])
            ven_hotend_phaetus_dragonfly_bmo(true,he=20);
        translate([0,-21.5,-5])
            cylinder(d=4.5,h=60);
    }
    module _base() {
        union() {
            xb_he();
            translate([0,-21.5,-2.4])
                cylinder(d=25,h=14);
        }
    }
    difference() {
        _base();
        _mount();
    }
}
