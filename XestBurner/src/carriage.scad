// module xb_cr_hs_em() { // Extruder mounting holes
//     module _xb_cr_em() {
//         rotate([90,0,0])
//             translate([d_m_em_w/2,d_m_em_h,-d_cr_em_o])
//                 heatset_m3x4(H=20);
//     }
//     _xb_cr_em();
//     mirror([d_m_em_w/2,0,0])
//         _xb_cr_em();
// }

module xb_cr_hs_he() { // Hotend/Extruder holes
    module _xb_cr_he() {
        rotate([90,0,0])
            translate([d_m_he_w/2,d_m_he_h,0])
                heatset_m3x4(H=20);
    }
    _xb_cr_he();
    mirror([d_m_he_w/2,0,0])
        _xb_cr_he();
}

module xb_cr_hs_fh() { // Fan housing holes
    module _xb_cr_fh() {
        rotate([90,0,0])
            translate([d_m_fh_w/2, d_m_fh_h,0])
                heatset_m3x4(H=20);
    }
    _xb_cr_fh();
    mirror([d_m_he_w/2,0,0])
        _xb_cr_fh();
}

module xb_cr_hs_pr() { // Probe mounting holes
    translate([(d_cr_pr_o-d_cr_pr_w)/2, d_cr_d/2+d_cr_pr_d-3,(-d_cr_hb + d_cr_pr_h)+4])
        heatset_m3x4(H=1);
}

module xb_cr_pr() { // Probe mount
    module _xb_cr_pr() {
        difference() {
            translate([(d_cr_pr_o-d_cr_pr_w)/2,0,-d_cr_hb + d_cr_pr_h*2])
            union() {
                translate([0,0,0])
                    cube([d_cr_pr_w,d_cr_d,d_cr_pr_h], center=true);
                translate([0,(d_cr_pr_d+d_cr_d)/2,0])
                    cube([d_cr_pr_w,d_cr_pr_d,d_cr_pr_h], center=true);
            }
            xb_cr_hs_pr();
        }
    }
    translate([0,-d_cr_d/2,0]) {
        _xb_cr_pr();
        mirror([d_cr_w/2,0,0])
            _xb_cr_pr();
    }
}

module xb_cr_em() { // Extruder mount
    module _xb_cr_em() {
        translate([0,-d_cr_d+d_cr_em_o,d_cr_ht])
            cube([d_cr_em_w/2,d_cr_em_d,d_cr_em_h]);
    }
    _xb_cr_em();
    mirror([d_cr_em_w,0,0])
        _xb_cr_em();
}

module xb_cr_probe_cut() {
    union() {
        translate([0,d_cr_pr_wire/2+0.01,0])
        rotate([90,90,0]) {
            translate([-d_m_fh_h-5,d_m_fh_w/2-5,0])
                cylinder(h=d_cr_d*2, r=2); // bottom right fillet
            translate([-d_m_fh_h-5,-d_m_fh_w/2+5,0])
                cylinder(h=d_cr_d*2, r=2); // bottom left fillet
            translate([-d_m_fh_h-7,0,d_cr_d])
                cube([8,15,d_cr_d*2], center=true);
            translate([-d_m_fh_h-9,0,d_cr_d])
                cube([8,18.5,d_cr_d*2], center=true);
            translate([-d_m_fh_h-12.5,0,0])
                cylinder(h=d_cr_d*2, r=9.25); // top fillet
            translate([0,0,d_cr_pr_wire]) // wire passthrough
                cube([35,d_cr_pr_wire,d_cr_pr_wire], center=true);
            translate([-d_cr_ht-1,0,-0.01]) // wire passthrough
                cube([d_cr_pr_wire,d_cr_pr_wire,12], center=true);
        }
    }
}


module xb_cr_belt_cut() {
    bw = 9 + 0.4;
    module _xb_cr_belt_cut() {
        module _xb_cr_belt_top() {
            translate([d_cr_w/2,-d_cr_d+0.01,0])
            union() {
                translate([0,d_cr_d,bw/2+1])
                    cube([8,3,bw], center=true);
                translate([0,d_cr_d-4.5,bw/2+1])
                    cube([5,1.5,bw], center=true);
                translate([-4,d_cr_d-3,1])
                    cylinder(h=bw, d=5.5);
            }
        }
        union() {
            _xb_cr_belt_top();
            mirror([0,0,1])
                _xb_cr_belt_top(); // bottom belt
            translate([d_cr_w/2,-d_cr_d+0.01,0])
            translate([6,3,0]) // Side cut
                cube([12,d_cr_d*2,bw*2+2], center=true);
            translate([d_cr_w/2-4,-3,0]) { // Pin
                translate([0,0,-15])
                    cylinder(h=30, d=3.5);
                translate([0,0,15-0.01])
                    cylinder(h=30, d=3.5);
            }
        }
    }
    _xb_cr_belt_cut();
    mirror([d_cr_w/2,0,0])
        _xb_cr_belt_cut();
}

module xb_cr_belt_pin() {
    module _xb_cr_belt_pin() {
        color(c_ve) {
            translate([d_cr_w/2-4,-3,0]) { // Pin
                translate([0,0,-15])
                    cylinder(h=30, d=3);
            }
        }
    }
    _xb_cr_belt_pin();
    mirror([d_cr_w/2,0,0])
        _xb_cr_belt_pin();
}

module xb_cr() {
    module xb_cr_base() {
        translate([0,-d_cr_d/2,0]) {
            translate([0,0,d_cr_ht/2])
                cube([d_cr_wt, d_cr_d, d_cr_ht], center=true);
            translate([0,0,-(d_cr_hb/2)])
                cube([d_cr_wb, d_cr_d, d_cr_hb], center=true);
        }
        translate([d_cr_w/2,-d_cr_d,0]) { // Belt retainer
            translate([0,d_cr_d/2,0])
                cube([2,d_cr_d,20+4], center=true);
        }
    }


    union() {
        difference() {
            xb_cr_base();
            xb_cr_hs_he(); xb_cr_hs_fh();
            xb_cr_probe_cut();
            xb_cr_belt_cut();
        }
        xb_cr_pr();
        difference() {
            xb_cr_em();
            // xb_cr_hs_em();
            xb_cr_probe_cut();
            xb_cr_belt_cut();
        }
    }
}
