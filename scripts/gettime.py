from datetime import datetime
import time
from tqdm import tqdm
while True:
	now = datetime.now()
	hours = now.strftime("%H");
	minutes = now.strftime("%M");
	seconds = now.strftime("%S");
	if hours[0]=="0":
		inth = int(hours[1])
	else:
		inth = int(hours)
	print(inth)
	if minutes[0]=="0":
		intm = int(minutes[1])
	else:
		intm = int(minutes)
	if seconds[0]=="0":
		ints = int(seconds[1])
	else:
		ints = int(seconds)
	
	total = (inth*3600)+(intm*60)+ints

	if total<28800:
		print("School didn't even start")
	elif total>=28800 and total<=31500:
		with tqdm(total=2700) as pbar:
			pbar.update(total-28800)
			for i in range(31500-total):
				time.sleep(1)
				pbar.update(1)
		print("Konec hodiny :)")
	elif total>=31500 and total<=32100:
                with tqdm(total=600) as pbar:
                        pbar.update(total-31500)
                        for i in range(32100-total):
                                time.sleep(1)
                                pbar.update(1)
                print("Konec prestavky :)")
	elif total>=36000 and total<=38700:
       		with tqdm(total=2700) as pbar:
        	pbar.update(1000)
        	for i in range(170):
                	time.sleep(0.1)
                	pbar.update(10)
	

	time.sleep(1)
print(unlucky)
