python ~/pycubescd/pydens_iso.py -f1 ./cubes/fit-rhoa.cube -f2 ./cubes/fit-rhob.cube -o_iso isofile -iseed 2.0
#isodat=`awk '{print $3}' isofile`
isodat=`awk 'FNR==1 {print $4}' isofile`

for i in 1704 1702 1700 1698 1696 1694
do

  fname=fit-pair.0$i
  python ~/pycubescd/pycd.py -f ./cubes/$fname.cube -i $isodat -o ./cubes/$fname.dsv
  #grep $isodat$ $fname.dsv | awk '{print $1,$2}' 
done

