include <../../lib/Chamfer.scad>

ad_ch = 0.6;

module adapter_ecas04() {
    translate([0,0,10-8])
    difference() {
        translate([0,0,8])
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

module adapter_press() {
    id = 4;
    od = 12;
    h = 10;
    difference() {
        translate([0,0,0])
            chamferCylinder(h=h,r=od/2, ch=ad_ch);
        translate([0,0,2.01])
            cylinder(h=h-2, d=id);
        translate([0,0,-2])
            cube([2.5,2.5,20], center=true);
    }
}
