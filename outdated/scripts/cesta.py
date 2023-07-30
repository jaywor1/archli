from tqdm import tqdm
import time

with tqdm(total=9200) as pbar:
	for i in range(9200):
		time.sleep(1)
		pbar.update(1)

print("Comp")
