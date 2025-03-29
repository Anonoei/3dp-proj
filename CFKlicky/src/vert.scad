module ck_vert() {
    module _vert_base() {
        translate([-d_bracket_w/2,d_bracket_d/2,-d_mount_h])
            cube([d_bracket_w,d_vert_d,d_mount_h]);
        // translate([-d_bracket_w/2,0,-d_mount_h-5])
        //     cube([d_bracket_w,d_mount_d+6+1.25,5]);
        translate([-d_hori_w/2,-d_bracket_d/2,-d_mount_h-5])
            cube([d_hori_w,d_bracket_d+5,5]);
        translate([-d_hori_w/2,-d_bracket_d,-d_mount_h-5])
            cube([d_hori_w,d_bracket_d-7,5]);
    }
    module _vert_slot() {
        module _slot() {
            hull() {
                translate([15,8,-d_mount_h-3])
                    cylinder(d=5.5, h=5);
                translate([15,-10,-d_mount_h-3])
                    cylinder(d=5.5, h=5);
            }
            hull() {
                translate([15,8,-d_mount_h-8])
                    cylinder(d=3, h=10);
                translate([15,-10,-d_mount_h-8])
                    cylinder(d=3, h=10);
            }
        }
        _slot();
        mirror([1,0,0])
            _slot();
    }
    module _vert_hs() {
        rotate([90,0,0]) {
            translate([-d_bracket_w/2+5,-4,-13.5])
                heatset_m3x4(H=8);
        }
        rotate([90,0,0]) {
            translate([d_bracket_w/2-5,-4,-13.5])
                heatset_m3x4(H=8);
        }
    }
    difference() {
        _vert_base();
        _vert_slot();
        _vert_hs();
    }
}
