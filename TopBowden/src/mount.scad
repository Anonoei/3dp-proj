module tb_center() {
    translate([0,0,0])
        chamferCylinder(h=d_tb_h,r=(d_tb_i/2),ch=0.5);
    translate([0,0,1.5])
        chamferCylinder(h=3,r=(d_tb_i/2)+1, ch=1);
}

module _tb_center_cut() {
    translate([0,0,-0.001])
        chamferCylinder(h=d_tb_h+0.002,r=(d_tb_i/2)+0.4,ch=0);
    translate([0,0,1.5])
        chamferCylinder(h=3+0.001,r=(d_tb_i/2)+1+0.4, ch=1);
}

module _tb_base() {
    difference() {
        translate([0,0,0])
            chamferCylinder(h=d_tb_h,r=d_tb_o/2, ch=1);
        _tb_center_cut();
        translate([0,0,-1])
            cylinder(h=d_tb_h+2,d=d_tb_i+0.4);
    }
}

include <../../ref/components.scad>

module tb_mount_m3() {
    difference() {
        _tb_base();
        translate([0,-d_tb_m_o,d_tb_h+0.002]) {
            rotate([180,0,0])
                bolt_shcs_m3(h=d_tb_h);
        }
        translate([d_tb_m_x,d_tb_m_y,d_tb_h+0.002]) {
            rotate([180,0,0])
                bolt_shcs_m3(h=d_tb_h);
        }
        translate([-d_tb_m_x,d_tb_m_y,d_tb_h+0.002]) {
            rotate([180,0,0])
                bolt_shcs_m3(h=d_tb_h);
        }
    }
}

module tb_mount_hs() {
    difference() {
        _tb_base();
        translate([0,-d_tb_m_o,d_tb_h-2+0.002]) {
            rotate([180,0,0]) {
                heatset();
                bolt(d=3, h=20);
            }
        }
        translate([d_tb_m_x,d_tb_m_y,d_tb_h-2+0.002]) {
            rotate([180,0,0]) {
                heatset();
                bolt(d=3, h=20);
            }
        }
        translate([-d_tb_m_x,d_tb_m_y,d_tb_h-2+0.002]) {
            rotate([180,0,0]) {
                heatset();
                bolt(d=3, h=20);
            }
        }
    }
}
