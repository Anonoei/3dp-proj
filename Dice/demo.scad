include <src/main.scad>

/*
r
    Radius. This is the radius of the sphere. The resolution of the sphere is based on the size of the sphere and the $fa, $fs and $fn variables. For more information on these special variables look at: OpenSCAD_User_Manual/Other_Language_Features
d
    Diameter. This is the diameter of the sphere.
$fa
    Fragment angle in degrees
$fs
    Fragment size in mm
$fn
    Resolution
*/

$fs=0.1;
$fn=100;

module dtext(t,s,d) {
    linear_extrude(d) text(t, size=s, halign="center", valign="center");
}

module die2(size) {
    echo("d",size,"h",size/8);
    cylinder(d=size,h=size/8);
}

module die4(size) {
    fa = 70.529;
    sa = 60;
    dh = sqrt(3*(size*sqrt(3)));
    echo(size, dh);
    rotate([0,0,90-sa])
        cylinder(d1=size, d2=0, h=dh, $fn=3);
    translate([0,0,-0.5])
    rotate([0,0,180])
        dtext("1", size/4,2);
    translate([0,0,dh/2]) {
        rotate([sa+5,0,180])
        translate([0,-2,.5])
        rotate([0,0,0])
            dtext("2", size/4,2);
        rotate([90-sa-5,sa,0])
        translate([2,-0.5,.5])
        rotate([0,0,75])
            dtext("3", size/4,2);
        rotate([90-sa-5,-sa,0])
        translate([-2,-.5,.5])
        rotate([0,0,0-75])
            dtext("4", size/4,2);
    }
}

module die8(size) {
    sphere(size, $fa=0.5, $fn=8);
}

module die(sides, size=1) {
    if (sides==2) {
        _side2(size);
    }
}

module prism(l, w, h){
    polyhedron(//pt 0        1        2        3        4        5
            points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
            faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
            );

    // preview unfolded (do not include in your function
    z = 0.08;
    separation = 2;
    border = .2;
    translate([0,w+separation,0])
        cube([l,w,z]);
    translate([0,w+separation+w+border,0])
        cube([l,h,z]);
    translate([0,w+separation+w+border+h+border,0])
        cube([l,sqrt(w*w+h*h),z]);
    translate([l+border,w+separation,0])
        polyhedron(//pt 0       1       2        3       4       5
                points=[[0,0,0],[h,w,0],[0,w,0], [0,0,z],[h,w,z],[0,w,z]],
                faces=[[0,1,2], [3,5,4], [0,3,4,1], [1,4,5,2], [2,5,3,0]]
                );
    translate([0-border,w+separation,0])
        polyhedron(//pt 0       1         2        3       4         5
                points=[[0,0,0],[0-h,w,0],[0,w,0], [0,0,z],[0-h,w,z],[0,w,z]],
                faces=[[1,0,2],[5,3,4],[0,1,4,3],[1,2,5,4],[2,0,3,5]]
                );
    }


module icosahedron(a = 2) {
    phi = a * ((1 + sqrt(5)) / 2);
    polyhedron(
        points = [
            [0,-phi, a], [0, phi, a], [0, phi, -a], [0, -phi, -a], [a, 0, phi], [-a, 0, phi], [-a, 0, -phi],
            [a, 0, -phi], [phi, a, 0], [-phi, a, 0], [-phi, -a, 0], [phi, -a, 0]
        ],
        faces = [
            [0,5,4], [0,4,11], [11,4,8], [11,8,7], [4,5,1], [4,1,8], [8,1,2], [8,2,7], [1,5,9], [1,9,2], [2,9,6], [2,6,7], [9,5,10], [9,10,6], [6,10,3], [6,3,7], [10,5,0], [10,0,3], [3,0,11], [3,11,7]
        ]

    );
}

// die8(20);
prism(10, 5, 3);

// icosahedron(a=2);

// die(4,12);
