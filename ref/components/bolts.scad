module bolt(d, h=8) {
    cylinder(d=d, h=h, center=true);
}

module bolt_shcs_m3(h=8) {
    translate([0,0,3/2-0.01])
        cylinder(d=6 + 0.01, h=3 + 0.001, center=true);
    translate([0,0,h/2 + 3/2])
        bolt(d=3, h=h);
}
