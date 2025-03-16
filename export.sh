#!/bin/bash

ROOT=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd $ROOT/export

for file in *.scad; do
    echo $file
done

cd $ROOT
exit 0
openscad -o "STLs/sh01_female-funnel.stl" --export-format binstl export/gen_female_funnel.scad

openscad -o "STLs/sh01_male-ecas.stl" --export-format binstl export/gen_male_ecas.scad
