python2.7 pyct.py -f /pub3/redo/redo.bertha/Au20OgRotTranFine.nocv/fit-rho.cube /pub3/redo/redo.bertha/Au20OgRotTranFine.nocv/fit-rhoa.cube /pub3/redo/redo.bertha/Au20OgRotTranFine.nocv/fit-rhob.cube
isodat=`awk 'FNR==1 {print $4}' isofile`

Number = 26399
while [[ $Number -gt 26335 ]]
      printf "$Number\n"
      ((Number -= 2 )

      fname=fit-pair.$Number
      python2.7 pycd.py -f /pub3/redo/redo.bertha/Au20OgRotTranFine.nocv/$fname.cube -i $isodat -o /pub3/redo/redo.bertha/Au20OgRotTranFine.nocv/$fname.dsv
done

