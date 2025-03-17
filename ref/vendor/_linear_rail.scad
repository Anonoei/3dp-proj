include <../components.scad>

module ref_linear_rail(l,h,w,E,P) {
    // w_r = 12;
    // h_r = 8;
    // D = 6;
    // h = 3.4;
    // d = 3.5;
    // P = 25;
    // E = 10;
    module rail_end() {
        difference() {
            cube([E, h, w], center=true);
            rotate([270,0,0])
                translate([E/2, 0, -h/2])
                    bolt_shcs_m3(h=w);
        }
    }
    module rail_sect() {
        difference() {
            cube([P, h, w], center=true);
            rotate([270,0,0]) {
                translate([P/2, 0, -(h/2)])
                    bolt_shcs_m3(h=h);
                translate([-P/2, 0, -(h/2)])
                    bolt_shcs_m3(h=w);
            }
        }
    }

    tot_length = (l - (E*2));
    echo(tot_length);
    sect_length = tot_length - (tot_length % P);
    echo(sect_length);
    sect_count = sect_length/P;
    echo(sect_count);

    translate([(sect_length/2 + E*2-2.5),0,0])
        rotate([0,180,0])
        rail_end();
    translate([-(sect_length/2 + E*2-2.5),0,0])
        rail_end();

    translate([-sect_length/2,0,0])
        for(i = [0:1:sect_count]) {
            translate([P*i,0,0])
                rail_sect();
        }
}

module ref_linear_rail_carriage(l,w,h,c,b) {
    // w = 27;
    // b = 20;
    // b_1 = 3.5;
    // c = 20;
    // l_1 = 32.4;
    // l = 45.4;
    // h = 10;

    translate([0,-3,0])
    difference() {
        cube([l, h, w], center=true);
        rotate([90,0,0]) {
            translate([0,0,5]) {
                translate([c/2,b/2,0])
                    bolt(d=20); // top right
                translate([c/2,-b/2,0])
                    bolt(d=20); // bottom right
                translate([-c/2,b/2,0])
                    bolt(d=20); // top left
                translate([-c/2,-b/2,0])
                    bolt(d=20); // bottom left
            }
        }
    }
}
