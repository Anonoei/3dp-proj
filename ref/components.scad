module bolt(d, h=8) {
    cylinder(d=3, h=h + 0.001, center=true);
}

module bolt_shcs_m3(h=8) {
    translate([0,0,3/2])
        cylinder(d=5 + 0.001, h=3 + 0.001, center=true);
    translate([0,0,h/2 + 3/2])
        bolt(d=3, h=h);
}


module heatset() {
    cylinder(h=4, r=2.5, center=true);
}
