v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 220 -210 300 -210 {
lab=out}
N 220 -230 220 -190 {
lab=out}
N 220 -130 220 -90 {
lab=#net1}
N 220 -160 250 -160 {
lab=#net1}
N 250 -160 250 -120 {
lab=#net1}
N 220 -120 250 -120 {
lab=#net1}
N 220 -260 250 -260 {
lab=#net2}
N 250 -300 250 -260 {
lab=#net2}
N 220 -350 220 -310 {
lab=#net2}
N 220 -310 220 -290 {
lab=#net2}
N 220 -300 250 -300 {
lab=#net2}
N 220 -320 310 -320 {
lab=#net2}
N 310 -320 350 -320 {
lab=#net2}
N 380 -280 380 -210 {
lab=out}
N 300 -210 420 -210 {
lab=out}
N 220 -110 340 -110 {
lab=#net1}
N 370 -210 370 -150 {
lab=out}
N 220 -440 220 -410 {
lab=vdd}
N 220 -30 220 -10 {
lab=vss}
N 410 -320 430 -320 {
lab=vss}
N 400 -110 420 -110 {
lab=vdd}
N 220 -380 240 -380 {
lab=vdd}
N 240 -420 240 -380 {
lab=vdd}
N 220 -420 240 -420 {
lab=vdd}
N 220 -60 240 -60 {
lab=vss}
N 240 -60 240 -20 {
lab=vss}
N 220 -20 240 -20 {
lab=vss}
N 370 -110 370 -90 {
lab=#net1}
N 330 -90 370 -90 {
lab=#net1}
N 330 -110 330 -90 {
lab=#net1}
N 380 -350 380 -320 {
lab=#net2}
N 340 -350 380 -350 {
lab=#net2}
N 340 -350 340 -320 {
lab=#net2}
N 80 -220 150 -220 {
lab=In}
N 160 -380 180 -380 {
lab=In}
N 160 -380 160 -60 {
lab=In}
N 160 -60 180 -60 {
lab=In}
N 160 -160 180 -160 {
lab=In}
N 160 -260 180 -260 {
lab=In}
N 150 -220 160 -220 {
lab=In}
C {sky130_fd_pr/pfet_01v8.sym} 200 -260 0 0 {name=M2
L=0.15
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/ipin.sym} 80 -220 0 0 {name=p1 lab=In}
C {devices/opin.sym} 420 -210 0 0 {name=p2 lab=out}
C {devices/iopin.sym} 220 -440 0 0 {name=p3 lab=vdd}
C {devices/iopin.sym} 220 -10 0 0 {name=p4 lab=vss}
C {sky130_fd_pr/pfet_01v8.sym} 380 -300 3 0 {name=M3
L=0.15
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 200 -380 0 0 {name=M1
L=0.15
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 200 -160 0 0 {name=M4
L=0.15
W=1
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 200 -60 0 0 {name=M5
L=0.15
W=1
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 370 -130 1 0 {name=M6
L=0.15
W=1
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} 420 -110 2 0 {name=p5 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 430 -320 2 0 {name=p6 sig_type=std_logic lab=vss}
