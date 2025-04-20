module ven_hotend_chube(bolts=false,he=0) {
    od = 25.4;
    tl = 61.75;
    module _mount() {
        n = 6;
        r = 9;
        delta = 360/n;
        translate([0,0,tl])
        for (i=[0:n-1]) {
            phi = i * delta;
            translate([r*cos(phi), r*sin(phi), 7.5+2])
                rotate([180,0,0])
                bolt_shcs_m3(v=true,he=he);
        }
    }
    module _chube() {
        module _body() {
            translate([0,27.918/2,tl-5])
            rotate([90,0,0]) {
                cylinder(d=5,h=27.918);
            }
            cylinder(d=od, h=tl);
        }
        module _cuts() {
            translate([4,-15,0])
            rotate([0,30,0])
                cube([30,30,30]);
        }
        translate([0,0,4]) {
            difference() {
                _body();
                _cuts();
                mirror([1,0,0])
                    _cuts();
            }
        }
        nozzle_v6();
        translate([0,0,66])
            cylinder(d=4,h=8);
    }
    if (bolts) {
        _mount();
    } else {
        _chube();
    }
}
