include <./linear_rail.scad>

module mgn12h() {
    color([0.2,0.2,0.2])
        linear_rail(l=300,h=3.4,w=12,E=10,P=25);
    color([0.4,0.4,0.4])
        carriage(l=45.4,w=27,h=10,c=20,b=20);
}

module mgn9h() {
    color([0.2,0.2,0.2])
        linear_rail(l=160,h=3.5,w=9,E=7.5,P=20);
    color([0.4,0.4,0.4])
        carriage(l=39.9,w=20,h=8,c=16,b=15);
}
