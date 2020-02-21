#!/bin/bash
export DIRPYCUBESCD=/home/matteod/pycubescd
python $DIRPYCUBESCD/pydens_iso.py -f1 ./cubes/fit-rhoa.cube -f2 ./cubes/fit-rhob.cube -o_iso isofile -iseed 2.0
isodat=`awk 'FNR==1 {print $4}' isofile`

for fname in \
fit-rhojoin \
fit-rho0 \
fit-rhoa \
fit-rhob \
fit-rho
do
  cp ./cubes/$fname.cube ./this.cube
  sed -e "s/_xyzfile/Au20Og/g" \
  -e "s/_colorp/gray90/g" \
  -e "s/_colorm/red/g" \
  -e "s/_label/ /g" \
  -e "s/_iso/0.005/g" bp_cube.py > cube.py
  pymol cube.py
  mv this.png $fname.png
#  rm this.cube
done
python $DIRPYCUBESCD/pysub_cube.py -f1 ./cubes/fit-rho.cube -f2 ./cubes/fit-rhojoin.cube -o ./cubes/fit-drho.cube
python $DIRPYCUBESCD/pysub_cube.py -f1 ./cubes/fit-rho.cube -f2 ./cubes/fit-rho0.cube -o ./cubes/fit-drho0.cube
python $DIRPYCUBESCD/pysub_cube.py -f1 ./cubes/fit-rho0.cube -f2 ./cubes/fit-rhojoin.cube -o ./cubes/fit-drhoanti.cube


for fname in \
fit-drho \
fit-drho0 \
fit-drhoanti
do
  cp ./cubes/$fname.cube ./this.cube
  sed -e "s/_xyzfile/Au20Og/g" \
  -e "s/_colorp/blue/g" \
  -e "s/_colorm/red/g" \
  -e "s/_label/ /g" \
  -e "s/_iso/0.0014/g" bp_cube.py > cube.py
  pymol cube.py
  mv this.png $fname.png
  rm this.cube
# python $DIRPYCUBESCD/pycd.py -f ./cubes/$fname.cube -i $isodat -o $fname.dsv
done

for i in 26399 26397 26395 26393 26391 26389
do


  fname=fit-nocv-.$i
  cp ./cubes/$fname.cube ./this.cube
  sed -e "s/_xyzfile/Au20Og/g" \
  -e "s/_colorp/salmon/g" \
  -e "s/_colorm/salmon/g" \
  -e "s/_label/ /g" \
  -e "s/_iso/0.0014/g" bp_cube.py > cube.py
  pymol cube.py
  mv this.png $fname.png
  rm this.cube

  fname=fit-nocv+.$i
  cp ./cubes/$fname.cube ./this.cube
  sed -e "s/_xyzfile/Au20Og/g" \
  -e "s/_colorp/lightblue/g" \
  -e "s/_colorm/lightblue/g" \
  -e "s/_label/ /g" \
  -e "s/_iso/0.0014/g" bp_cube.py > cube.py
  pymol cube.py
  mv this.png $fname.png
  rm this.cube

done

for  i in 26399 26397 26395 26393 26391 26389
do
  fname=fit-pair.$i
  cp ./cubes/$fname.cube ./this.cube
  sed -e "s/_xyzfile/Au20Og/g" \
  -e "s/_colorp/blue/g" \
  -e "s/_colorm/red/g" \
  -e "s/_label/ /g" \
  -e "s/_iso/0.0003/g" bp_cube.py > cube.py
  pymol cube.py
  mv this.png $fname.png
  rm this.cube
#  python $DIRPYCUBESCD/pycd.py -f ./cubes/$fname.cube -i $isodat -o $fname.dsv
done
