$fa = 2;
$fs = 0.01;

d_tb_h = 6;
d_tb_o = 50;
d_tb_i = 20;

d_tb_m_o = 18;
d_tb_m_x = 16;
d_tb_m_y = 9;

include <../../ref/globals.scad>
include <../../ref/colors.scad>

include <../../lib/Chamfer.scad>

// --- components --- //
include <outer.scad>
include <inner.scad>
