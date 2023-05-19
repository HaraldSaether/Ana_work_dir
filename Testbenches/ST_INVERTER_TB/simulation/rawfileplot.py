import os
from matplotlib import pyplot as plt
import numpy as np
from rawfileload import load_raw

def vin_eqaul_vout(array1,array2):
    return np.argwhere(np.diff(np.sign(array2-array1))).flatten()


simdir=os.path.dirname(os.path.realpath(__file__))

projectname="ST_INVERTER_TB"

resultdict=load_raw(f"{simdir}/{projectname}.raw")

for x in resultdict[0]["variables"]:
    if x[1]=="vin":
        vin_index=int(x[0])
    if x[1]=="vout":
        vout_index=int(x[0])

threshold_l=[]
for n in resultdict:
    x= resultdict[n]["values"][0]
    y= resultdict[n]["values"][vin_index]
    z= resultdict[n]["values"][vout_index]

    xlist= np.asarray(x,dtype=np.float32)
    ylist= np.asarray(y,dtype=np.float32)
    zlist= np.asarray(z,dtype=np.float32)
    


    idx=vin_eqaul_vout(ylist,zlist)
    threshold_l.append(xlist[idx])
    plt.title("test-inverter")

   
    #plt.plot(xlist[idx],zlist[idx],"ro")
    #print(f"First: {xlist[idx][0]},{zlist[idx][0]}")


    #plt.plot(xlist,ylist,label=resultdict[n]["variables"][vin_index][1])
    #plt.plot(xlist,zlist,label=resultdict[n]["variables"][vout_index][1])
    plt.plot(xlist,zlist)

plt.plot(xlist,ylist,label=resultdict[n]["variables"][vin_index][1])
print("std deviation",np.std(threshold_l))
print("mean",np.mean(threshold_l))

plt.plot(np.linspace(0.9,0.9,len(zlist)),xlist,"r",label="Ideal [vout/vin]")
print(f"Ideal:{0.9},{0.9}")
plt.legend()
plt.savefig(f"{simdir}/{projectname}.png")


