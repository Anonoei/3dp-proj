module _klicky_pcb_cut() {
    module _cut() {
        translate([5.3,0.1,-1])
            cylinder(d=3, h=20);
        translate([-5.4,5.4,-1])
            cylinder(d=3, h=20);
        translate([-5.4,-5.4,-1])
            cylinder(d=3, h=20);
        translate([-4.15,-5.7,-1])
            cube([8.2,10.2,20]);
    }
    translate([0,8+1,-d_cr_hb])
        _cut();
}

module _klicky_pcb_base() {
    translate([0,8+1,-d_cr_hb])
        translate([-9,-8,2])
            cube([18,16,5]);
}

module _klicky_pcb_show() {
    translate([-5,8,-d_cr_hb-16+2])
        cube([10,5,16]);
    translate([-10,-20,-d_cr_hb-16+2])
        cube([20,35,4.5]);
    translate([0,9+(-9+d_he_c),-d_cr_hb-16+2])
        cylinder(d=1,h=16);
}

module xb_pr_klicky_pcb_hf() {
    // z = -4.5
    // y = 9+d_he_c = 30.5
    difference() {
        union() {
            xb_pr();
            _klicky_pcb_base();
        }
        _klicky_pcb_cut();
        translate([-30,-5,-d_cr_hb-16+2])
            cube([60,35,16]);
    }
    // _klicky_pcb_show();
}

module xb_pr_klicky_pcb_uhf() {
    // z = -4.5
    // y = 9+d_he_c = 30.5
    module _uhf_adapt() {
        translate([-17,0,-d_cr_hb-hf_uhf+2])
            cube([34,8,hf_uhf+5]);
    }
    module _uhf_brace() {
        p_z = d_cr_hb-hf_uhf+1.5;
        p_d = 8;
        translate([7,0,0])
        rotate([0,90,0])
        linear_extrude(2) polygon(
            points=[
                [p_z,p_d],[p_z+hf_uhf,p_d],[p_z+hf_uhf,9+p_d]
            ]
        );
    }
    difference() {
        union() {
            xb_pr();
            _uhf_adapt();
            translate([0,0,-hf_uhf])
                _klicky_pcb_base();
            _uhf_brace();
            mirror([1,0,0])
                _uhf_brace();
        }
        translate([0,0,-hf_uhf])
            _klicky_pcb_cut();
    }
    // translate([0,0,-hf_uhf])
    //     _klicky_pcb_show();
}
