from tqdm import tqdm
import time

from datetime import datetime

now = datetime.now()





current_time = now.strftime("%H:%M:%S")



  
  
#for i in tqdm (range (2700), 
#               desc="Loading…", 
#               ascii=False, ncols=75):
#    time.sleep(1)
 
with tqdm(total=2700) as pbar:
	pbar.update(1000)
	for i in range(170):
        	time.sleep(0.1)
        	pbar.update(10)
     
print("Complete.")
