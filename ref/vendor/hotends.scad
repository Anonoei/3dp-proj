module nozzle(
    th=12.5, td=5, // threading height, diameter
    gh=5,    gd=7, // grip height, diameter
    oh=2,    cd=3.20 // tip height, cut diameter
) {
    ch = th + gh/2;

    translate([0,0,th+gh+oh])
    rotate([180,0,0])
    difference() {
        union() {
            cylinder(d=td, h=th);
            translate([0,0,th])
                cylinder(d=gd, h=gh, $fn=6);
            translate([0,0,th+gh])
                cylinder(h=oh,d1=td, d2=td/2);
        }
        cylinder(h=ch, d=cd);
    }
}

module nozzle_v6() {
    nozzle(th=12.5, td=5, gh=5, gd=7, oh=2, cd=3.20);
}

include <./hotends/phaetus.scad>
include <./hotends/chube.scad>
