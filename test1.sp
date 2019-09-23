*My first hspice circuit
.param impedence=50
.tran 50ps 8ns sweep impedence 40 60 5
.option post probe
vin 1 0 pwl 0 0v 250ps 0v 350ps 3.3v
rsource 1 2 50
tfirst 2 0 3 0 zo=impedence td=1ns
tsecond 3 0 4 0 zo=impedence td=1ns
C2 4 0 5p
*Rtermination 4 0 50
.probe v(1) v(2) v(3) v(4)
.end