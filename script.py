import csv
import sys      # imports the sys module
import json

COLNAMES = [
    "eventID",
    "DER mass MMC",
    "DER mass transverse met lep",
    "DER mass vis",
    "DER pt h",
    "DER deltaeta jet jet",
    "DER mass jet jet",
    "DER prodeta jet jet",
    "DER deltar tau lep",
    "DER pt tot",
    "DER sum pt",
    "DER pt ratio lep tau",
    "DER met phi centrality",
    "DER lep eta centrality",
    "PRI tau pt",
    "PRI tau eta",
    "PRI tau phi",
    "PRI lep pt",
    "PRI lep eta",
    "PRI lep phi",
    "PRI met",
    "PRI met phi",
    "PRI met sumet",
    "PRI jet num",
    "PRI jet leading pt",
    "PRI jet leading eta",
    "PRI jet leading phi",
    "PRI jet subleading pt",
    "PRI jet subleading eta",
    "PRI jet subleading phi",
    "PRI jet all pt",
    "Weight",
    "Label"
]

csvfile = open("test.csv", 'r', encoding="utf-8")
jsonfile = open("test.json",'w')

try:
    fieldnames =(COLNAMES[0],COLNAMES[1],COLNAMES[2],COLNAMES[3],COLNAMES[4],COLNAMES[5],COLNAMES[6],COLNAMES[7],COLNAMES[8],COLNAMES[9],COLNAMES[10],COLNAMES[11],COLNAMES[12],COLNAMES[13],COLNAMES[14],COLNAMES[15],COLNAMES[16],COLNAMES[17],COLNAMES[18]
    ,COLNAMES[19],COLNAMES[20],COLNAMES[21],COLNAMES[22],COLNAMES[23],COLNAMES[24],COLNAMES[25],COLNAMES[26],COLNAMES[27],COLNAMES[28],COLNAMES[29],COLNAMES[30],COLNAMES[31],COLNAMES[32])

    reader = csv.DictReader(csvfile, fieldnames)  # creates the reader object

    for row in reader:   # iterates the rows of the file in orders
        json.dump(row,jsonfile)    # prints each row
        jsonfile.write('\n')
finally:

    print("FILES HAS BEEN FULLY READED")
    csvfile.close()      # closing
    jsonfile.close()
