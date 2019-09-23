*  Generated for: HSPICE
*  Generated on: Apr  2 23:51:04 2019
*  Design library name: TFET
*  Design cell name: inverter
*  Design view name: schematic

*  Library name: TFET
*  Cell name: inverter
*  View name: schematic



.temp 25.0

*.option ARTIST=2 PSF=2 WARN_SEP=1
*.option LIS_NEW=1 

.GLOBAL gnd! vdd!
Vvdd vdd! 0 1.0v
Vgnd gnd! 0 0v
.param x =9
vin in 0 pulse 1v 0v 50ns 1ns 1ns 48ns 100ns
*.tran 1ns 500ns sweep x 1 10 2 
.tran 1ns 500ns
.dc vin  0 1 0.01

xi2 out in gnd! NTFET W=x
xi3 out in vdd! PTFET W=x

*C0 out gnd! 2E-14F

*.option hier_delim=1
*.probe dc v(net5)
*+       v(out)
.hdl "/home/vlsi/Desktop/cadence_work/TFET/ntfet/veriloga/veriloga.va"
.hdl "/home/vlsi/Desktop/cadence_work/TFET/ptfet/veriloga/veriloga.va"


.option post 
.end
