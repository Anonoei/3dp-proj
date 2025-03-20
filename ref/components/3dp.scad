module heatset(d=5,h=4,b=3,H=0) {
    // d = inset diameter
    // h = height (length)
    // b = bolt diameter
    // H = bolt height
    union() {
        translate([0,0,0.01])
            cylinder(h=h+0.02, d=d, center=true);
        translate([0,0,h/2])
            bolt(d=b, h=H);
    }
}

module heatset_m3x4(H=0) { // VORON BOM heatset
    heatset(d=4.3, h=4+0.1, b=3+0.2, H=H);
}

module ecas04() { // This is used to cut a spot for an ECAS04 fitting
    ecas04_d = 8.1;
    ecas04_d_1 = 10;
    ecas04_h = 8;
    ecas04_h_1 = 2.4;

    cylinder(d=ecas04_d + 0.3, h=ecas04_h+0.01);
    translate([0,0,0])
        cylinder(d=ecas04_d+1, h=ecas04_h-ecas04_h_1);
}
