module ven_hotend_chube() {
    od = 25.4;
    tl = 61.75;
    module _chube() {

        translate([0,27.918/2,tl-5])
        rotate([90,0,0]) {
            cylinder(d=5,h=27.918);
        }
            // cylinder(d=27.918, h=5);
        cylinder(d=od, h=tl);

    }
    module _cuts() {
        translate([4,-15,0])
        rotate([0,30,0])
            cube([30,30,30]);
    }
    translate([0,0,4]) {
        difference() {
            _chube();
            _cuts();
            mirror([1,0,0])
                _cuts();
        }
    }
    nozzle_v6();
    translate([0,0,66])
        cylinder(d=4,h=8);
}
