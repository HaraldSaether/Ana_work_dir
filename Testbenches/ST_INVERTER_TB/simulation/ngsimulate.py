import os
import subprocess
#simulation directory
simdir=os.path.dirname(os.path.realpath(__file__))

#name of the project
tb_name="ST_INVERTER_TB"

#input spice netlist location
spice_file=f"{simdir}/{tb_name}.spice"

#logfile output path
logfile=f"{simdir}/{tb_name}.out"

#check if output logfile exist, ngspice exits if the file does not exist
if os.path.isfile(logfile) != True:
    print("haha")
    f=open(logfile, "w")
    f.write("")
    f.close()

#rawfile output path
#rawfile=f"{tb_name}.raw"
#run the command: ngspice -b -r {rawfile} -o {logfile} {spice_file}
#subprocess.run(['ngspice','-b','-r',rawfile,'-o',logfile, spice_file]) 
#if the spice file writes the rawfile in a .control section then
#change working dir to 
os.chdir(simdir)
for count in range(0,25):
    subprocess.run(['ngspice','-b','-o',logfile, spice_file])

print("""
##--------------------------------------------------------------------------------------------##
##--------------------------------Simulation done---------------------------------------------##
##--------------------------------------------------------------------------------------------##
"""
      )

