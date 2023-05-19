import os
import pathlib


HEADER_DIC={"date":[],"plotname":[],"flags":[],"no. variables":[],"no. points":[],"variables":[],"values":[]}

def headerdictindex(data,dictname):
    tempdict1=HEADER_DIC
    if dictname not in tempdict1.keys():
        return {}
    #start by finding index of all "dictname" in list
    start=0
    count=0
    for l in data:
        try:
            if(dictname in l):
                temps = data.index(l,start,len(data))
                if temps:
                    tempdict1[dictname].append(data.index(l,start,len(data)))
                    start = data.index(l,start,len(data))+1
                    count+=1
        except ValueError:
            print(count)
            break

    return tempdict1


def load_raw(rawfile):
    """parses the rawfile output from ngspice and returns a dict"""
    errcnt=0
    #result dictionary
    resultdict={}
    
    path = os.path.realpath(rawfile)   
    temp=open(path,"r")

#    data=temp.readline(512).split(b':',maxsplit=1)
    data=temp.readlines()
    
    data=[x.lower() for x in data]

    try:
        title, schpath=data[0].split(':',maxsplit=1)
    except:
        raise

    tempdict=headerdictindex(data,"date")
    #since all index is found, plotname, flags etc should be the next indexes
    for i in range(0,len(tempdict["date"])):
        if("plotname" in data[tempdict["date"][i]+1]):
            tempdict["plotname"].append(tempdict["date"][i]+1)
        if("flags" in data[tempdict["date"][i]+2]):
            tempdict["flags"].append(tempdict["date"][i]+2)
        if("no. variables" in data[tempdict["date"][i]+3]):
            tempdict["no. variables"].append(tempdict["date"][i]+3)
        if("no. points" in data[tempdict["date"][i]+4]):
            tempdict["no. points"].append(tempdict["date"][i]+4)
        if("variables" in data[tempdict["date"][i]+5]):
            tempdict["variables"].append(tempdict["date"][i]+5)
    
    if(len(tempdict["plotname"])!=len(tempdict["date"])):
        errcnt+=1
    if(len(tempdict["flags"])!=len(tempdict["date"])):
        errcnt+=1
    if(len(tempdict["no. variables"])!=len(tempdict["date"])):
        errcnt+=1
    if(len(tempdict["no. points"])!=len(tempdict["date"])):
        errcnt+=1
    if(len(tempdict["variables"])!=len(tempdict["date"])):
        errcnt+=1
    if errcnt > 0:
        print(f"failure {errcnt} ")
    
    tempdict = headerdictindex(data,"values")

    for m in range(0,len(tempdict["date"])):
        resultdict[m] = {"date":[],"plotname":[],"flags":[],"no. variables":[],"no. points":[],"variables":[],"values":{}}

    #time to propogate the stuff:
    for x in resultdict:
        #print(x)
        resultdict[x]["date"] = data[tempdict["date"][x]].split(':',maxsplit=1)[1]
        resultdict[x]["plotname"] = data[tempdict["plotname"][x]].split(':',maxsplit=1)[1]
        resultdict[x]["flags"] = data[tempdict["flags"][x]].split(':',maxsplit=1)[1]
        resultdict[x]["no. variables"] = data[tempdict["no. variables"][x]].split(':',maxsplit=1)[1]
        resultdict[x]["no. points"] = data[tempdict["no. points"][x]].split(':',maxsplit=1)[1]
        #resultdict[x]["variables"] = data[tempdict["variables"][x]].split(':',maxsplit=1)[1]
        #resultdict[x]["values"] = data[tempdict["values"][x]].split(':',maxsplit=1)[1]
        for num in range(0,int(resultdict[x]["no. variables"])):#12 lines
            tmpdat=data[int(tempdict["variables"][x])+num+1].split("\t")
            resultdict[x]["variables"].append([tmpdat[1],tmpdat[2],tmpdat[3]])


        for sigs in range(0, int(resultdict[x]["no. variables"])):
            resultdict[x]["values"][sigs] = []
        
        

        for sigs in range(0, int(resultdict[x]["no. variables"])):
            start=int(tempdict["values"][x]+1)+sigs
            stop = int(tempdict["values"][x]+1)+sigs+ (int(resultdict[x]["no. points"]))*(int(resultdict[x]["no. variables"])+1)
            tilnextl=int(resultdict[x]["no. variables"])+1
            for lines in range(start, stop, tilnextl):
                #print(lines,sigs , data[lines].split("\t")[1].strip())
                resultdict[x]["values"][sigs].append(data[lines].split("\t")[1].strip())
                
        

    #numberofvariables=tempdict["values"][0]-tempdict["variables"][0]-1
    
    return resultdict
    #if(numberofvariables)
    
    #need to search for 'date' and 'binary', which alwasys set the outer perimeter.

#            print(data.index(l))
        


if __name__=="__main__":

    path1="test_inverter_tb.raw"
    path2="/home/tarrald/.xschem/simulations/test-inverter.raw"
    path3="/home/tarrald/.xschem/simulations/test_inverter_tb.raw"
    
    load_raw(path1)
