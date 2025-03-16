module xb_cr() {
    module xb_cr_base() {
        translate([0,0,d_cr_ht/2])
            cube([d_cr_w, d_cr_d, d_cr_ht], center=true);
        translate([0,0,-(d_cr_hb/2)])
            cube([d_cr_w, d_cr_d, d_cr_hb], center=true);
    }

    module xb_cr_hole_pattern() {
        rotate([90,0,0]) {
            // Hotend/Extruder
            translate([0,d_cr_he_h,-1]) {
                for (i=[d_cr_he_w/2,-(d_cr_he_w/2)]) {
                    translate([i,0,0]) {
                        bolt(d=3);
                        heatset();
                    }
                }
            }
            // Fan housing
            translate([0,d_cr_fh_h,-1]) {
                for (i=[d_cr_fh_w/2,-(d_cr_fh_w/2)]) {
                    translate([i,0,0]) {
                        bolt(d=3);
                        heatset();
                    }
                }
            }
        }
    }

    module xb_cr_probe_mount() {
        module _probe_mount_point() {
            translate([-(d_cr_w/2),0,0])
            difference() {
                cube([d_cr_pr_w,d_cr_pr_d,d_cr_pr_h], center=true);
                translate([0,d_cr_pr_d/2-4,-2.6])
                    heatset();
            }
        }
        translate([0,d_cr_pr_d/2-(d_cr_d/2),d_cr_pr_off]) {
            _probe_mount_point();
            mirror([d_cr_w,0,0])
                _probe_mount_point();
        }
    }
    module xb_cr_probe_cut() {
        translate([0,d_cr_d,0])
        rotate([90,90,0]) {
            translate([-d_cr_fh_h-5,d_cr_fh_w/2-5,0])
                cylinder(h=d_cr_d*2, r=2); // bottom right fillet
            translate([-d_cr_fh_h-5,-d_cr_fh_w/2+5,0])
                cylinder(h=d_cr_d*2, r=2); // bottom left fillet
            translate([-d_cr_fh_h-7,0,d_cr_d])
                cube([8,15,d_cr_d*2], center=true);
            translate([-d_cr_fh_h-9,0,d_cr_d])
                cube([8,18.5,d_cr_d*2], center=true);
            translate([-d_cr_fh_h-12.5,0,0])
                cylinder(h=d_cr_d*2, r=9.25); // top fillet
            translate([0,0,d_cr_pr_wire]) // wire passthrough
                cube([35,d_cr_pr_wire,d_cr_pr_wire], center=true);
            translate([-d_cr_ht-1,0,-0.001]) // wire passthrough
                cube([d_cr_pr_wire,d_cr_pr_wire,12], center=true);
        }
    }

    module xb_cr_extruder_mount() {
        translate([0,d_cr_em_d/2+1,d_cr_ht + d_cr_em_h/2])
            cube([d_cr_em_w,d_cr_em_d,d_cr_em_h], center=true);
    }

    difference() {
        xb_cr_base();
        xb_cr_hole_pattern();
        xb_cr_probe_cut();
    }
    xb_cr_probe_mount();
    difference() {
        xb_cr_extruder_mount();
        xb_cr_probe_cut();
    }
}
