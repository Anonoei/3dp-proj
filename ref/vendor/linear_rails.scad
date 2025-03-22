include <./_linear_rail.scad>

module ven_mgn12h(l=300) {
    union() {
    color([0.2,0.2,0.2]) ref_linear_rail(l=l,h=3.4,w=12,E=10,P=25);
    color([0.4,0.4,0.4]) ref_linear_rail_carriage(l=45.4,w=27,h=10,c=20,b=20);
    }
}

module ven_mgn9h(l=160) {
    union() {
    color([0.2,0.2,0.2]) ref_linear_rail(l=l,h=3.5,w=9,E=7.5,P=20);
    color([0.4,0.4,0.4]) ref_linear_rail_carriage(l=39.9,w=20,h=8,c=16,b=15);
    }
}
