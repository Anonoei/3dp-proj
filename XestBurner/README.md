# XestBurner
 A light, modular toolhead

![image](demo.png)

## Description
 This toolhead was heavily inspired by the amazing work done for  [Xol](https://github.com/Armchair-Heavy-Industries/Xol-Toolhead), and [Dragonburner](https://github.com/chirpy2605/voron/tree/main/V0/Dragon_Burner)

 I switched to a CHUBE hotend, and found that none of the current toolheads supported it, along with features that are necessary, like ease-of-assembly, modular components, and being light.

 This toolhead was designed around having a similar footprint to DragonBurner, supporting CHUBE (and other large hotends), and using only M3 hardware.

 Each individual component is self-containing, and can be easily swapped as needed. For instance:
  - Swap/Reprint fan housing
    1. Release fan wires
    2. Undo 2x M3 bolts
    3. Pull fan housing off
  - Swap/reprint hotend
    1. Release hotend wires
    2. Undo 2x M3 bolts
    3. Lift extruder out of the way
    4. Pull hotend out

## BOM
 - Carriage
   - 6x M3x4x5 (Voron) heatsets
     - 2x for hotend/extruder
     - 2x for fan housing
     - 2x for probe mount
   - 2x M3x30 pins
 - Hotend
   - 2x M3x30 SHCS (BHCS works as well)
   - bolts to mount your hotend
 - Extruder
   - Dependent on variation, uses hotend bolts to carriage
 - Fan Housing
   - 2x 4010 blower fans
   - 1x 2510 axial fan
   - 2x M3x6 SHCS (BHCS works as well)
 - Probe
   - 2x M3x6 SHCS (BHCS works as well)
   - Dependent on variation
