$fa = 1;
$fs = 0.4;

include <../../lib/Chamfer.scad>

include <../../ref/components.scad>
include <../../ref/vendor.scad>

// ----- Base components ----- //
include <./dimensions.scad>

include <./carriage.scad>
include <./extruder.scad>
include <./fan_housing.scad>
include <./hotend.scad>


// ----- Carriages ----- //
include <./carriages/mgn12h.scad>
include <./carriages/mgn9h.scad>
