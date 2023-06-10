from datetime import datetime
import time
import sys

lyrics_file = sys.argv[1]

with open(lyrics_file) as f:
    lyrics = f.read()


arr = lyrics.split('\n')
ltime = datetime.now()



y = datetime.now()


for i in range(len(arr)):
    input()
    print(f'echo "{arr[i]}"')
    ttime = datetime.now() - ltime
    print(f'sleep {ttime.seconds}.{ttime.microseconds}')
    ltime = datetime.now()
    print('clear')

print(z)

print(d1)
