module ck_tube() {
    translate([-25,0,d_tube_H])
    rotate([90,0,90])
        cylinder(d=d_tube_d, h=50);
}
