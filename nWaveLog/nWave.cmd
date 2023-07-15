wvRestoreSignal -win $_nWave1 "/home/t111368148/Desktop/2016_LBP/signal.rc" \
           -overWriteAutoAlias on -appendSignals on
wvUnknownSaveResult -win $_nWave1 -clear
wvGetSignalOpen -win $_nWave1
wvGetSignalClose -win $_nWave1
wvSaveSignal -win $_nWave1 "/home/t111368148/Desktop/2016_LBP/signal.rc"
wvSetCursor -win $_nWave1 6153.209850 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 15321.737675 -snap {("G1" 22)}
wvSetCursor -win $_nWave1 21548.491867 -snap {("G1" 22)}
wvSetCursor -win $_nWave1 14463.720366 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 15395.282016 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 14463.720366 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 13336.040473 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 12502.537943 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 13385.070033 -snap {("G1" 6)}
