include <../../lib/Chamfer.scad>

ad_ch = 0.6;

module adapter_ecas04() {
    ecas04_d = 8.1;
    ecas04_d_1 = 10;
    ecas04_h = 8;
    ecas04_h_1 = 2.4;
    module ecas04() {
        cylinder(d=ecas04_d + 0.3, h=ecas04_h);
        translate([0,0,0])
            cylinder(d=ecas04_d+1, h=ecas04_h-ecas04_h_1);
    }
    // ecas04();
    translate([0,0,10-ecas04_h])
    difference() {
        translate([0,0,ecas04_h - 0.001])
        rotate([0,180,0])
            chamferCylinder(h=10,r=8,ch=ad_ch);
        ecas04();
        translate([0,0,-2])
            cube([2.5,2.5,10], center=true);
    }
}

module adapter_funnel() {
    h = 10;
    r = 12;
    b_wall = 4;
    difference() {
        translate([0,0,-h])
            chamferCylinder(h=h,r=r, r2=8,ch=ad_ch);
        translate([0,0,-h-1])
            chamferCylinder(h=h+2,r=r-b_wall, r2=2.5/2,ch=ad_ch);
    }
}
