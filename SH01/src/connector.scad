include <../../scadboil/ext/threads.scad>

th_thread = 6;
th_height = 4;
th_hole = 2.5;
th_f_r = 5;

module connector_male() {
    difference() {
        translate([0,0,1])
            ScrewThread(th_thread, th_height+2, pitch=0, tooth_angle=30, tolerance=0.4);
        translate([0,0,-10.01])
            cylinder(d=th_hole, h=20);
    }
}

module connector_female() {
    rotate([0,0,0])
    translate([0,0,0])
    ScrewHole(th_thread, th_height, pitch=0, tooth_angle=30, tolerance=0.4)
        cylinder(r=th_f_r,h=th_height-0.01);
}
