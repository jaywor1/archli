import pandas as pd

cyklisti = pd.read_csv('https://raw.githubusercontent.com/mlcollege/ai-academy/main/05-Zaklady-datove-analyzy/data/nehody_cyklistu.csv', sep=';')


print(cyklisti.loc[cyklisti['pohlavi'] == "žena"])
cyklisti['pohlavi'].value_counts().plot.bar()
#print(cyklisti.loc[(cyklisti['datum'].contains('xd')])

cyklisti.to_csv("cyklisti.csv")
