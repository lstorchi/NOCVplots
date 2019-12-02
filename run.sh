#!/bin/bash
for fname in \
fit-rho \
fit-rhojoin \
fit-rho0 \
fit-rhoa \
fit-rhob
do
  cp $fname.cube ./this.cube
  sed -e "s/_xyzfile/aucn/g" \
  -e "s/_colorp/gray90/g" \
  -e "s/_colorm/red/g" \
  -e "s/_label/ /g" \
  -e "s/_iso/0.005/g" bp_cube.py > cube.py
  pymol cube.py
  mv this.png $fname.png
  rm this.cube
done

cubesub fit-rho.cube fit-rhojoin.cube fit-drho.cube
cubesub fit-rho.cube fit-rho0.cube fit-drho0.cube
cubesub fit-rho0.cube fit-rhojoin.cube fit-drhoanti.cube

for fname in \
fit-drho \
fit-drho0 \
fit-drhoanti
do
  cp $fname.cube ./this.cube
  sed -e "s/_xyzfile/aucn/g" \
  -e "s/_colorp/blue/g" \
  -e "s/_colorm/red/g" \
  -e "s/_label/ /g" \
  -e "s/_iso/0.001/g" bp_cube.py > cube.py
  pymol cube.py
  mv this.png $fname.png
  rm this.cube
  cubecdz $fname.cube $fname.dsv
done

for i in 01 06 09 15 17 21 25
do

  fname=fit-pair.000$i
  cp $fname.cube ./this.cube
  sed -e "s/_xyzfile/aucn/g" \
  -e "s/_colorp/blue/g" \
  -e "s/_colorm/red/g" \
  -e "s/_label/ /g" \
  -e "s/_iso/0.001/g" bp_cube.py > cube.py
  pymol cube.py
  mv this.png $fname.png
  rm this.cube
  cubecdz $fname.cube $fname.dsv

  fname=fit-nocv-.000$i
  cp $fname.cube ./this.cube
  sed -e "s/_xyzfile/aucn/g" \
  -e "s/_colorp/salmon/g" \
  -e "s/_colorm/salmon/g" \
  -e "s/_label/ /g" \
  -e "s/_iso/0.005/g" bp_cube.py > cube.py
  pymol cube.py
  mv this.png $fname.png
  rm this.cube

  fname=fit-nocv+.000$i
  cp $fname.cube ./this.cube
  sed -e "s/_xyzfile/aucn/g" \
  -e "s/_colorp/lightblue/g" \
  -e "s/_colorm/lightblue/g" \
  -e "s/_label/ /g" \
  -e "s/_iso/0.005/g" bp_cube.py > cube.py
  pymol cube.py
  mv this.png $fname.png
  rm this.cube

done
