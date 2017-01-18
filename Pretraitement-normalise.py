import csv
import sys      # imports the sys module
import json
import os
import math

COLNAMES = [
    "eventID",#0
    "DER mass MMC",#1
    "DER mass transverse met lep",#2
    "DER mass vis",#3
    "DER pt h",#4
    "DER deltaeta jet jet",#5
    "DER mass jet jet",#6
    "DER prodeta jet jet",#7
    "DER deltar tau lep",#8
    "DER pt tot",#9
    "DER sum pt",#10
    "DER pt ratio lep tau",#11
    "DER met phi centrality",#12
    "DER lep eta centrality",#13
    "PRI tau pt",#14
    "PRI tau eta",#15
    "PRI tau phi",#16
    "PRI lep pt",#17
    "PRI lep eta",#18
    "PRI lep phi",#19
    "PRI met",#20
    "PRI met phi",#21
    "PRI met sumet",#22
    "PRI jet num",#23
    "PRI jet leading pt",#24
    "PRI jet leading eta",#25
    "PRI jet leading phi",#26
    "PRI jet subleading pt",#27
    "PRI jet subleading eta",#28
    "PRI jet subleading phi",#29
    "PRI jet all pt",#30
    "Weight",#31
    "Label"#32
]

MINTAB = [9.044,0,6.329,0,0,13.602,-18.066,0.208,0,46.104,0.047,-1.414,0,20,-2.499,-3.142,26,-2.505,-3.142,0.109,-3.142,13.678,0,30,-4.499,-3.142,30,-4.5,-3.142,0]
MAXTAB = [1192.026,690.075,1349.351,2834.999,8.503,4974.979,16.69,5.684,2834.999,1852.462,19.773,1.414,1,764.408,2.497,3.142,560.271,2.503,3.142,2842.617,3.142,2003.976,3,1120.573,4.499,3.141,721.456,4.5,3.142,1633.433]

badRowCounter = 0 #number of deleted rows
RowNumber = 0     #Total row (minus header)
label0 = 0        #Number of 0-label rows
label1 = 0        #Number of 1-label rows
temp =[]

here = os.path.dirname(os.path.realpath(__file__))
filename = here + "/Data/Normalized/"
os.makedirs(os.path.dirname(filename), exist_ok=True)

csvfile = open("training.csv", 'r', encoding="utf-8")
outputfile = open(filename +"SignificantCleanNormalizedEntries.csv",'w',encoding="utf-8", newline='')
equilibratedOutput = open(filename +"SignificantCleanNormalizedEquilibratedEntries.csv",'w',encoding="utf-8", newline='')

try:
    fieldnames =(COLNAMES[0],COLNAMES[1],COLNAMES[2],COLNAMES[3],COLNAMES[4],COLNAMES[5],COLNAMES[6],COLNAMES[7],COLNAMES[8],COLNAMES[9],COLNAMES[10],COLNAMES[11],COLNAMES[12],COLNAMES[13],COLNAMES[14],COLNAMES[15],COLNAMES[16],COLNAMES[17],COLNAMES[18]
    ,COLNAMES[19],COLNAMES[20],COLNAMES[21],COLNAMES[22],COLNAMES[23],COLNAMES[24],COLNAMES[25],COLNAMES[26],COLNAMES[27],COLNAMES[28],COLNAMES[29],COLNAMES[30],COLNAMES[31],COLNAMES[32])

    reader = csv.DictReader(csvfile, fieldnames) # creates the reader object
    writer = csv.DictWriter(outputfile, fieldnames)
    writereq = csv.DictWriter(equilibratedOutput, fieldnames)

    writer.writeheader()
    writereq.writeheader()

    reader.__next__();

    for y in range(0,MINTAB.__len__()):
        print (COLNAMES[y+1]+" : "+str(MINTAB[y]) +" //// "+ str(MAXTAB[y]))


    for row in reader:   # iterates the rows of the file in orders
        RowNumber+=1
        mustprint = True
        temp = row

        for i in row :
            if row[i] in (None, "", "?"):
                badRowCounter+=1
                #print ("bad row detected")
                mustprint = False
                break

        if mustprint :
            for u in range(0,30):
                temp[COLNAMES[u+1]] = (float(row[COLNAMES[u+1]])-MINTAB[u])/(MAXTAB[u]-MINTAB[u]) #normalized value in temp[i]

            if int(row[COLNAMES[32]]) == 1 :
                if (label0-label1) >= 0 :
                    label1 +=1
                    writereq.writerow(temp)
            else :
                if (label1-label0) >= 0 :
                    label0 +=1
                    writereq.writerow(temp)

            writer.writerow(temp)

finally:

    print("FILES HAS BEEN FULLY READED")
    print("#of row = "+ str(RowNumber))
    print("#of bad row detected = "+ str(badRowCounter))
    print("New Data File should have "+ str(RowNumber-badRowCounter)+" rows")

    print("#of 0-label row in equilibrated file = "+ str(label0))
    print("#of 1-label row in equilibrated file = "+ str(label1))
    print("In equilibrated outputfile there are "+ str(label1+label0)+" rows")

    csvfile.close()      # closing
    outputfile.close()
    equilibratedOutput.close()
