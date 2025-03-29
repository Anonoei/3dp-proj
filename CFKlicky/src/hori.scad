module ck_hori() {
    module _hori_base() {
        translate([-d_hori_w/2,-d_bracket_d-2,-d_mount_h-10])
            cube([d_hori_w,d_bracket_d*2-0.25,5]);
        translate([-d_att_w/2,-d_bracket_d-5,-d_mount_h-10])
            cube([d_att_w,5,d_att_h]);
    }
    module _hori_hs() {
        translate([15,8,-d_mount_h-10])
            heatset_m3x4(H=8);
        translate([-13.5,-20,-d_mount_h-6.25])
        rotate([-90,0,0])
            heatset_m3x4(H=1);
    }

    difference() {
        _hori_base();
        _hori_hs();
        mirror([1,0,0])
            _hori_hs();
    }
}
