include <../src/main.scad>

rotate([90,0,0])
union() {
    xb_fp();
    xb_fp_led_hf();
    xb_fp_cam_hf();
}
