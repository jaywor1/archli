import csv
import numpy as np

file = open('//home//archli//programming//python//lsai_present//data.csv')

csvreader = csv.reader(file)


rows = []
for row in csvreader:
    rows.append(float(row))

print(int(rows[1]))

print(type(int(rows[1])))


print(sorted[sorted.length/2])
