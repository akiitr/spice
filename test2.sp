* W element, field-solver interface

*                  XXXXXX     
*  ------------------------------------ Z = 5mils
*       Er = 4.3   H = 4mils
*  ------------------------------------ Z = 1mils
*  //// Bottom Ground Plane ///////////
*  ------------------------------------ Z = 0

W1 in1   0 out1   0 FSmodel=demo N=1 l=0.97

* Materials
.MATERIAL copper METAL CONDUCTIVITY=5.76e+07
.MATERIAL diel_1 DIELECTRIC ER = 4.3  LOSSTANGENT=1.2e-3 CONDUCTIVITY=8.2e-4

* Conductor crossection shapes
.SHAPE rect RECTANGLE WIDTH = 5mils HEIGHT = 1mils

* Dielectric stack-up
.LAYERSTACK Stack 
+ LAYER = (copper, 1mils) 
+ LAYER = (diel_1 4mils) 

* Field-solver options
.FSOPTIONS myOption ACCURACY = HIGH GRIDFACTOR = 1 
+ ComputeRo=yes ComputeRs=yes ComputeGo=Yes ComputeGd=yes PRINTDATA=YES

.MODEL demo W ModelType=FieldSolver 
+ LAYERSTACK=Stack FSOptions=myOption
+ RLGCFILE= rlgc.txt
+ CONDUCTOR = ( MATERIAL=copper, SHAPE=rect, ORIGIN=(1000mils, 5mils) )

*Analysis
.tran 0.1ns 100ns
.option post
.end