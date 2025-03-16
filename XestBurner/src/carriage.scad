// include <../../ref/components.scad>

module xb_cr() {
    w = 40;
    d = 5;
    h_t = 15.5;
    h_b = 38;
    h_tot = h_t + h_b;

    module xb_cr_base() {
        translate([0,0,h_t/2])
            cube([w, d, h_t], center=true);
        translate([0,0,-(h_b/2)])
            cube([w, d, h_b], center=true);
    }

    he_hole_w = 32;
    he_hole_h = 12;
    fh_hole_w = 24.6;
    fh_hole_h = 32.5;
    module xb_cr_hole_pattern() {
        rotate([90,0,0]) {
            // Hotend/Extruder
            translate([0,he_hole_h,-1]) {
                for (i=[he_hole_w/2,-(he_hole_w/2)]) {
                    translate([i,0,0]) {
                        bolt(d=3);
                        heatset();
                    }
                }
            }
            // Fan housing
            translate([0,-fh_hole_h,-1]) {
                for (i=[fh_hole_w/2,-(fh_hole_w/2)]) {
                    translate([i,0,0]) {
                        bolt(d=3);
                        heatset();
                    }
                }
            }
        }
    }

    pr_w = 9;
    pr_h = 9;
    pr_d = 13;
    pr_off = -(h_b - 18);
    pr_wire = 4;
    module xb_cr_probe_mount() {
        module _probe_mount_point() {
            translate([-(w/2),0,0])
            difference() {
                cube([pr_w,pr_d,pr_h], center=true);
                translate([0,pr_d/2-4,-2.6])
                    heatset();
            }
        }
        translate([0,pr_d/2-(d/2),pr_off]) {
            _probe_mount_point();
            mirror([w,0,0])
                _probe_mount_point();
        }
    }
    module xb_cr_probe_cut() {
        translate([0,d,0])
        rotate([90,90,0]) {
            translate([fh_hole_h-5,fh_hole_w/2-5,0])
                cylinder(h=d*2, r=2); // bottom right fillet
            translate([fh_hole_h-5,-fh_hole_w/2+5,0])
                cylinder(h=d*2, r=2); // bottom left fillet
            translate([fh_hole_h-7,0,d])
                cube([8,15,d*2], center=true);
            translate([fh_hole_h-9,0,d])
                cube([8,18.5,d*2], center=true);
            translate([fh_hole_h-12.5,0,0])
                cylinder(h=d*2, r=9.25); // top fillet
            translate([0,0,pr_wire]) // wire passthrough
                cube([35,pr_wire,pr_wire], center=true);
            translate([-h_t-1,0,-0.001]) // wire passthrough
                cube([pr_wire,pr_wire,12], center=true);
        }
    }

    em_w = w;
    em_h = 9;
    em_d = 10;
    module xb_cr_extruder_mount() {
        translate([0,em_d/2+1,h_t + em_h/2])
            cube([em_w,em_d,em_h], center=true);
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
