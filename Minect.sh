python2.7 pyct.py -f /pub3/redo/redo.bertha/Au20OgRotTranFine.nocv/fit-rho.cube /pub3/redo/redo.bertha/Au20OgRotTranFine.nocv/fit-rhoa.cube /pub3/redo/redo.bertha/Au20OgRotTranFine.nocv/fit-rhob.cube
isodat=`awk 'FNR==1 {print $4}' isofile`

for i in 26399 26397 26395 26394 26391 26389 26387 26385 26383 26381
do

  fname=fit-pair.$i
  python2.7 pycd.py -f /pub3/redo/redo.bertha/Au20OgRotTranFine.nocv/$fname.cube -i $isodat -o /pub3/redo/redo.bertha/Au20OgRotTranFine.nocv/$fname.dsv
done
