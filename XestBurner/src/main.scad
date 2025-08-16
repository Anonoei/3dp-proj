$fa = 1;
$fs = 0.4;

include <../../scadboil/ref/globals.scad>
include <../../scadboil/ref/colors.scad>

include <../../scadboil/lib/Chamfer.scad>

include <../../scadboil/ref/components.scad>
include <../../scadboil/ref/vendor.scad>

// ----- Base components ----- //
include <./dimensions.scad>

c_cr = [0.4,0.2,0.6];
c_em = [0.2,0.8,0.2];
c_he = [0.8,0.2,0.2];
c_fh = [0.2,0.8,0.8];
c_pr = [0.6,0.6,0.4];
c_du = [0.8,0.5,0.2];

c_ve = [0.8,0.8,0.0,0.6];

include <./carriage.scad>
include <./extruder.scad>
include <./fan_housing.scad>
include <./hotend.scad>
include <./probe.scad>
include <./ducts.scad>
include <./faceplate.scad>


// ----- Carriages ----- //
include <./carriages/mgn12h.scad>
include <./carriages/mgn9h.scad>

// ----- Probes ----- //
include <./probes/beacon.scad>
include <./probes/klicky_pcb.scad>

// ----- Extruders ----- //
include <./extruders/sherpa_mini.scad>

// ----- Hotends ----- //
include <./hotends/chube.scad>
include <./hotends/dragonfly_bmo.scad>
include <./hotends/rapido.scad>

// ----- Faceplates ----- //
include <./faceplates/led.scad>
include <./faceplates/nozzle_cam.scad>
