v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 180 -230 250 -230 {
lab=vin}
N 180 -70 290 -70 {
lab=0}
N 90 -70 180 -70 {
lab=0}
N 90 -260 90 -70 {
lab=0}
N 380 -230 500 -230 {
lab=vout}
N 90 -340 90 -320 {
lab=#net1}
N 90 -340 290 -340 {
lab=#net1}
N 180 -170 180 -70 {
lab=0}
N 360 -230 380 -230 {
lab=vout}
N 300 -170 300 -70 {
lab=0}
N 290 -70 300 -70 {
lab=0}
N 300 -340 300 -290 {
lab=#net1}
N 290 -340 300 -340 {
lab=#net1}
N 300 -190 300 -170 {
lab=0}
N 300 -290 300 -270 {
lab=#net1}
N 350 -230 360 -230 {
lab=vout}
C {devices/vsource.sym} 90 -290 0 0 {name=Vcc value=1.8}
C {devices/vsource.sym} 180 -200 0 0 {name=vin value=0}
C {devices/lab_pin.sym} 90 -70 0 0 {name=p4 sig_type=std_logic lab=0}
C {devices/lab_pin.sym} 230 -230 0 0 {name=p5 sig_type=std_logic lab=vin}
C {devices/lab_pin.sym} 500 -230 0 0 {name=p6 sig_type=std_logic lab=vout}
C {devices/code.sym} 440 -360 0 0 {name=stimulus 
only_toplevel=false 
place=end 
value="

.option temp = 27

*write ST_INVERTER_TB.raw

.control
*  option seed = 8
  let run = 1
  set filetype=ascii
  save all
  reset
  set appendwrite
  dowhile run < = 1
	dc vin 0 1.8 0.001
	save all
	write ST_INVERTER_TB.raw
	let run=run + 1
	reset
   end
.endc

"}
C {sky130_fd_pr/corner.sym} 640 -350 0 0 {name=CORNER1 only_toplevel=false corner=tt_mm}
C {devices/launcher.sym} 350 -440 0 0 {name=h17
descr="load_waves" 
tclcommand="
xschem raw_read $netlist_dir/[file tail [file rootname [xschem get current_name]]].raw tran
	   "}
C {Component_Library/ST_INVERTER/schematic/ST_INVERTER.sym} 340 -200 0 0 {name=x1}
