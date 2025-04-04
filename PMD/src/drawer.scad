module pmd_drawer() {
    // cd = 2;
    // oa = -70;
    // op = 16;
    // for (a = [0:op]) [cd*cos(a*(90/op)), cd*sin(a*(90/op))],
    // rotate([90,0,0])
    // linear_extrude(1, convexity=2) polygon(
    //     points=[
    //         [0,0], [10,0], [10,10],
    //     ]
    // );
    module _handle() {
        module _base() {
            linear_extrude(d_w, convexity=2) polygon(
                points=[
                    [-d_h,0],
                    [-d_h,-d_h_d],
                    [-d_h+2,-d_h_d],
                    [-d_h+5,-d_h_d+3],
                    [-d_h+11,0],
                ]
            );
        }
        difference() {
            rotate([0,90,0])
                _base();
            translate([d_wall,-(d_h_d-d_wall)+0.01,0])
                cube([d_w-(d_wall*2),d_h_d-d_wall,d_h-d_wall]);
        }
    }
    module _drawer() {
        difference() {
            union() {
                cube([d_w,d_d,d_h]);
            }
            translate([d_wall/2,d_wall/2,d_wall/2])
                cube([d_w-d_wall,d_d-d_wall,d_h]);
        }
    }
    _handle();
    _drawer();
}
