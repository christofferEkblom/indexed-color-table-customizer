#!/usr/bin/python

import glob, binascii, json

hexColorLength = 6
fileExtension = '.act'
outputFile = 'Sample.json'

data = {}

for file in glob.glob('*' + fileExtension):
  with open(file, 'rb') as f:
    hexdata = binascii.hexlify(f.read())
    data[file.replace(fileExtension, '')] = [hexdata[i: i + hexColorLength] for i in range(0, len(hexdata), hexColorLength)]

jsonFile = open(outputFile, 'w') 
jsonFile.write(json.dumps(data) + '\n')
