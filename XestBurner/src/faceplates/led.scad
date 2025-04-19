module xb_fp_led(i=false) {
    if (i) {
        xb_fp();
    }
    la = 45;

    module _carrier() {
        translate([6,-44,-32])
        rotate([la,0,0])
        translate([0,-3,-1.5])
            cube([12,10,2-0.1], center=true);
        translate([6,-44,-32])
        rotate([la,0,0])
        translate([-5,-2.5,0]) // Left
            cube([2,9,2],center=true);
        translate([6,-44,-32])
        rotate([la,0,0])
        translate([5,-2.5,0]) // Right
            cube([2,9,2],center=true);
        translate([0,-50,-39.38]) // Front
            cube([12,2.1,14]);
    }

    module _led() {
        difference() {
            _carrier();
            translate([6,-44,-32])
            rotate([-180+la,0,0])
                neopixel(e=false,r=50);
            // translate([0,-44-5,-32-5.5])
            //     cube([12,5,10]);
        }

    }
    _led();
    mirror([1,0,0])
        _led();
}
