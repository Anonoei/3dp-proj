$fa = 2;
$fs = 0.01;

include <../../ref/globals.scad>
include <../../ref/colors.scad>

include <../../ref/components.scad>

// --- components --- //
include <adapter.scad>
include <connector.scad>

module male_ecas() {
    translate([0,0,10])
    rotate([180,0,0]) {
        translate([0,0,1])
            adapter_ecas04();
        translate([0,0,-6])
            connector_male();
    }
}

module male_press() {
    translate([0,0,10])
    rotate([180,0,0]) {
        translate([0,0,1])
            adapter_press();
        translate([0,0,-6])
            connector_male();
    }
}

module female_ecas() {
    translate([0,0,-10])
        connector_female();
    rotate([180,0,0])
    translate([0,0,10])
        adapter_ecas04();
}

module female_funnel() {
    translate([0,0,-4]) {
        translate([0,0,-2])
        rotate([180,0,0])
            connector_female();
        translate([0,0,-6])
            adapter_funnel();
    }
}
