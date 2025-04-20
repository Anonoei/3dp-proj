module _xb_fp_led(i=false,v=false) {
    if (i) {
        xb_fp();
    }
    la = 40;
    module _carrier() {
        translate([6,-44.22,-30])
        rotate([la,0,0])
        translate([0,-3,-1.5])
            cube([12,10,2-0.1], center=true);

        translate([6,-44,-30])
        rotate([la,0,0]) {
            translate([-5,-2.5,0]) // Left
                cube([2,9-.33,2],center=true);
            translate([5,-2.5,0]) // Right
                cube([2,9-.33,2],center=true);
        }
    }

    module _led() {
        difference() {
            _carrier();
            translate([6,-44,-30])
            rotate([-180+la,0,0])
                neopixel(e=false,r=50);
            // translate([0,-44-5,-32-5.5])
            //     cube([12,5,10]);
        }
        if (v) {
            translate([6,-44,-30])
            rotate([-180+la,0,0])
                neopixel(e=false,r=50);
        }
    }
    _led();
    mirror([1,0,0])
        _led();
}

module xb_fp_led_hf(i=false,v=false) {
    _xb_fp_led(i,v);
    translate([-12,-50,-35.56]) // Attach
        cube([24,2.1,16]);
}

module xb_fp_led_uhf(i=false,v=false) {
    translate([0,0,-hf_uhf])
        _xb_fp_led(i,v);
    translate([-12,-50,-35.56-hf_uhf]) // Attach
        cube([24,2.1,20]);
}
