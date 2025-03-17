module heatset(d=5,h=4,b=3,H=0) {
    cylinder(h=h, d=d, center=true);
    translate([0,0,h])
        bolt(d=3, h=H);
}
module ecas04() { // This is used to cut a spot for an ECAS04 fitting
    ecas04_d = 8.1;
    ecas04_d_1 = 10;
    ecas04_h = 8;
    ecas04_h_1 = 2.4;

    cylinder(d=ecas04_d + 0.3, h=ecas04_h+0.001);
    translate([0,0,0])
        cylinder(d=ecas04_d+1, h=ecas04_h-ecas04_h_1);
}
