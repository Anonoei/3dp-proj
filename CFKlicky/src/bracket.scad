module ck_bracket_hs() {
    module _hs() {
        translate([6,7.3,4])
        rotate([90,0,0]) {
            heatset_m3x4(H=8);
            translate([0,0,15])
            rotate([180,0,0])
                bolt_shcs_m3();
        }
        translate([6,7.3,d_tube_H+d_tube_d-4])
        rotate([90,0,0]) {
            heatset_m3x4(H=8);
            translate([0,0,15])
            rotate([180,0,0])
                bolt_shcs_m3();
        }
    }
    _hs();
    mirror([1,0,0])
        _hs();
}

module ck_bracket_back() {
    // translate([-d_bracket_d/2,-(d_bracket_w/2),2])
    //     cube([d_bracket_d,d_bracket_w,d_bracket_h]);
    difference() {
        translate([-d_bracket_w/2,0,0])
            cube([d_bracket_w,d_bracket_d/2,d_bracket_h]);
        ck_tube();
        ck_bracket_hs();
    }
}
module ck_bracket_front() {
    difference() {
        translate([-d_bracket_w/2,-d_bracket_d/2,0])
            cube([d_bracket_w,d_bracket_d/2,d_bracket_h]);
        ck_tube();
        ck_bracket_hs();
    }
}
