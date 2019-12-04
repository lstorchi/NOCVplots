python2.7 pyct.py -f /pub3/redo/redo.bertha/Au20OgRotTranFine.nocv/fit-rho.cube /pub3/redo/redo.bertha/Au20OgRotTranFine.nocv/fit-rhoa.cube /pub3/redo/redo.bertha/Au20OgRotTranFine.nocv/fit-rhob.cube
isodat=`awk 'FNR==1 {print $4}' isofile`

export i=26399
while [[ $i -gt 26335 ]]
do
      printf "$i\n"

      fname=fit-pair.$i
      python2.7 pycd.py -f /pub3/redo/redo.bertha/Au20OgRotTranFine.nocv/$fname.cube -i $isodat -o /pub3/redo/redo.bertha/Au20OgRotTranFine.nocv/$fname.dsv

      ((i -= 2 ))
done
