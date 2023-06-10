from datetime import datetime
import time
from tqdm import tqdm

with tqdm(total=780) as pbar:
	for i in range(780):
		time.sleep(1)
		pbar.update(1)
