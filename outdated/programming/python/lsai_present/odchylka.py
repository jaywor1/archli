import csv
import numpy as np

file = open('//home//archli//programming//python//lsai_present//data.csv')

csvreader = csv.reader(file)

print(type(csvreader))

arr = []
for row in csvreader:
	arr.append(row)

arr.pop(0)

sum = 0
for item in arr:
	sum = sum + ((float(item[0]) - 2.46) ** 2)


print("sum:",sum)
print(sum/138664)
