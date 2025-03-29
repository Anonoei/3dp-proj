module ck_mount() {
    module _mount_base() {
        translate([-d_bracket_w/2,d_bracket_d/2-d_mount_d,-d_mount_h])
            cube([d_bracket_w,d_mount_d,d_mount_h]);
    }
    module _mount_slot() {
        module _slot() {
            hull() {
                translate([-d_bracket_w/2+5,-2,-4])
                rotate([-90,0,0])
                    cylinder(d=5.5, h=5);
                translate([-d_bracket_w/2+5,-2,-d_mount_h+4])
                rotate([-90,0,0])
                    cylinder(d=5.5, h=5);
            }
            hull() {
                translate([-d_bracket_w/2+5,-2,-4])
                rotate([-90,0,0])
                    cylinder(d=3, h=10);
                translate([-d_bracket_w/2+5,-2,-d_mount_h+4])
                rotate([-90,0,0])
                    cylinder(d=3, h=10);
            }
        }
        _slot();
        mirror([1,0,0])
            _slot();
    }
    difference() {
        _mount_base();
        _mount_slot();
    }
}
