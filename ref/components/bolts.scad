module bolt(d, h=8) {
    cylinder(d=d, h=h, center=true);
}

module _bolt_v(d,hh=0,r=0.2) {
    vh = r*5;
    vz = hh+(vh/2);
    difference() {
        translate([0,0,vz])
            cylinder(d=d + 0.01, h=vh, center=true);
        rotate([0,0,0]) {
            translate([d/2,0,vz])
                cube([d/2,d,vh+0.01],center=true);
            translate([-d/2,0,vz])
                cube([d/2,d,vh+0.01],center=true);
        }
        rotate([0,0,0]) {
            translate([0,d/2,vz+r*2])
                cube([d,d/2,1],center=true);
            translate([0,-d/2,vz+r*2])
                cube([d,d/2,vh+0.01],center=true);
        }
        rotate([0,0,45]) {
            translate([0,d/2,vz+r*3])
                cube([d,d/2,vh+0.01],center=true);
            translate([0,-d/2,vz+r*3])
                cube([6,3,vh+0.01],center=true);
        }
        rotate([0,0,-45]) {
            translate([0,d/2,vz+r*4])
                cube([d,d/2,vh+0.01],center=true);
            translate([0,-d/2,vz+r*4])
                cube([d,d/2,vh+0.01],center=true);
        }
    }
}

module bolt_shcs(hd,hh,td,th,
        he, v=false, r=0.2) {
    // hd = head diameter
    // hh = head height
    // td = thread diameter
    // th = thread height
    // he = head extension
    // v = vertical supports
    // r = support resolution
    union() {
        translate([0,0,hh/2-0.01]) // Socket head
            cylinder(d=hd + 0.01, h=hh + 0.05, center=true);
        if (he>0) {
            translate([0,0,-he/2]) // Head extension
                cylinder(d=hd+0.01,h=he,center=true);
        }
        translate([0,0,th/2+hh]) // Threading
            cylinder(d=td, h=th, center=true);
        if (v==true) {
            _bolt_v(hd,hh,r);
        }
    }
}

module bolt_shcs_m2_5(h=8,v=false,r=0.2,he=0) {
    bolt_shcs(hd=5,hh=2.5,th=h,v=v,r=r,he=he);
}

module bolt_shcs_m3(h=8,v=false,r=0.2,he=0) {
    bolt_shcs(hd=6,hh=3,td=3,th=h,v=v,r=r,he=he);
}
