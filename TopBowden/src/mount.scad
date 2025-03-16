module tb_center() {
    translate([0,0,0])
        chamferCylinder(h=d_tb_h,r=(d_tb_i/2),ch=0.4);
    translate([0,0,1.5])
        chamferCylinder(h=3,r=(d_tb_i/2)+1, ch=0.5);
}

module tb_mount() {
    module _tb_center_cut() {
        translate([0,0,-0.001])
            chamferCylinder(h=d_tb_h+0.002,r=(d_tb_i/2)+0.2,ch=0.4);
        translate([0,0,1.5])
            chamferCylinder(h=3+0.001,r=(d_tb_i/2)+1+0.2, ch=0.5);
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

    module _tb_mount() {
        translate([0,-18,-0.001]) {
            cylinder(h=10, d=3);
            translate([0,0,2])
                cylinder(h=5, d=5);
        }
        translate([16,9,-0.001]) {
            cylinder(h=10, d=3);
            translate([0,0,2])
                cylinder(h=5, d=5);
        }
        translate([-16,9,-0.001]) {
            cylinder(h=10, d=3);
            translate([0,0,2])
                cylinder(h=5, d=5);
        }
    }

    difference() {
        _tb_base();
        _tb_mount();
    }
}
