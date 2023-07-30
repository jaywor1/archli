import requests as r
import time
import json

import smtplib

from email.message import EmailMessage


#response = r.get("https://skripta.ssps.cza/substitutions.phprp/?date=20220603")

#[            ]
# Colors
OKGREEN = '\033[92m'
FAIL = '\033[91m'
ENDC = '\033[0m'
LOGYELLOW = '\033[33m'

true = True
false = False

url = 'https://skripta.ssps.cz/substitutions.php/?date='

def print_ok(msg):
    print("[  "+OKGREEN+"OK"+ENDC+"  ] " + msg)

def print_error(msg):
    print("[  "+FAIL+"ERROR"+ENDC+"  ] " + msg)    

def print_log(msg):
    print("[  "+LOGYELLOW +"LOG"+ENDC+"  ] " + msg)


first_response = r.get("https://skripta.ssps.cz/substitutions.php/?date=2")

while true: 
    try:
        response = r.get(url)
        if(response.status_code == 200):
            print_ok(f'status code {response.status_code}')
            data = response.json()
            if(first_response.text != response.text):
                f = open("email.txt","w+")
                print_log("recognized update on site")
                
                first_response = response
                
                temp = data["AbsentTeachers"][0]["Entity"]["Name"]
                print_log(f'testing json file {temp}')

                for i in range(len(data["ChangesForClasses"])):
                    if(data["ChangesForClasses"][i]["Class"]["Abbrev"] == "2.K"):
                        class_data = data["ChangesForClasses"][i]
                        break
                
                if(len(class_data["ChangedLessons"]) > 0):
                    for i in range(len(class_data["ChangedLessons"])):
                        print_log(f'{class_data["ChangedLessons"][i]["Hour"]}. hodinu {class_data["ChangedLessons"][i]["ChgType1"]} {class_data["ChangedLessons"][i]["ChgType2"]} {class_data["ChangedLessons"][i]["Subject"]} ({class_data["ChangedLessons"][i]["Group"]})')
                        f.write(f'{class_data["ChangedLessons"][i]["Hour"]}. hodinu {class_data["ChangedLessons"][i]["ChgType1"]} {class_data["ChangedLessons"][i]["ChgType2"]} {class_data["ChangedLessons"][i]["Subject"]} ({class_data["ChangedLessons"][i]["Group"]})')
                else:
                    print_log("Zadna zmena se nekonna")

                if(len(class_data["ChangedLessons"]) > 0):
                    for i in range(len(class_data["CancelledLessons"])):
                        print_log(f'{class_data["CancelledLessons"][i]["Hour"]}. hodinu {class_data["CancelledLessons"][i]["ChgType1"]} {class_data["ChangedLessons"][i]["Subject"]} ({class_data["ChangedLessons"][i]["Group"]})')
                        f.write(f'{class_data["CancelledLessons"][i]["Hour"]}. hodinu {class_data["CancelledLessons"][i]["ChgType1"]} {class_data["ChangedLessons"][i]["Subject"]} ({class_data["ChangedLessons"][i]["Group"]})')
                else:
                    print_log("Zadna zmena se nekonna")

                f.close() 

                with open("email.txt") as fp:
                    msg.set_content(fp.read())

                msg['Subject'] = "test suplovani"
                msg['From'] = "blackspeedgame@gmail.com"
                msg['To'] = "misa.javor@gmail.com" 

                s = smtplib.SMTP('localhost')
                s.send_message(msg)
                s.quit              
            else:
                print_log("no change")
        else:
            print_error(f'wrong status code ({response.status_code})')
    except:
        print_error("unknown error")

    print_log("Starting sleep for 1 hour")    
    time.sleep(3600)

