module bolt(d, h=8) {
    cylinder(d=d, h=h, center=true);
}

module bolt_shcs_m3(h=8,v=false,r=0.2,hh=0) {
    union() {
        translate([0,0,3/2-0.01]) // Socket head
            cylinder(d=6 + 0.01, h=3 + 0.05, center=true);
        translate([0,0,-hh/2])
            cylinder(d=6+0.01,h=hh,center=true);

        if (v==true) {
            vh = r*5;
            vz = 3+(vh/2);
            difference() {
                translate([0,0,vz])
                    cylinder(d=6 + 0.01, h=vh, center=true);
                rotate([0,0,0]) {
                    translate([3,0,vz])
                        cube([3,6,vh+0.01],center=true);
                    translate([-3,0,vz])
                        cube([3,6,vh+0.01],center=true);
                }
                rotate([0,0,0]) {
                    translate([0,3,vz+r*2])
                        cube([6,3,1],center=true);
                    translate([0,-3,vz+r*2])
                        cube([6,3,vh+0.01],center=true);
                }
                rotate([0,0,45]) {
                    translate([0,3,vz+r*3])
                        cube([6,3,vh+0.01],center=true);
                    translate([0,-3,vz+r*3])
                        cube([6,3,vh+0.01],center=true);
                }
                rotate([0,0,-45]) {
                    translate([0,3,vz+r*4])
                        cube([6,3,vh+0.01],center=true);
                    translate([0,-3,vz+r*4])
                        cube([6,3,vh+0.01],center=true);
                }
            }
        }

        translate([0,0,h/2 + 3]) // Threading
            bolt(d=3, h=h);
    }
}
