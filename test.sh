#!/bin/bash
for fname in \
fit-rho \
fit-rhojoin \
fit-rho0 \
fit-rhoa \
fit-rhob
do
  cp $fname.cube ./this.cube
  sed -e "s/_xyzfile/au20og/g" \
  -e "s/_colorp/gray90/g" \
  -e "s/_colorm/red/g" \
  -e "s/_label/ /g" \
  -e "s/_iso/0.005/g" bp_cube.py > cube.py
  pymol cube.py
  mv this.png $fname.png
  rm this.cube
done

