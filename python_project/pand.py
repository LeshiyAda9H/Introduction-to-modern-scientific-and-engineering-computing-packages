import pandas as pd
import numpy as np

labels = ['a', 'b', 'c']
my_list = [10, 20, 30]
arr = np.array([10, 20, 30])
d = {'a': 10, 'b': 20, 'c': 30}

s = pd.Series(data=arr, index=labels)
print(s)

s = pd.Series(d)
print(s)

print(s.loc['a'])

print(s.values)
print()

df = pd.DataFrame(data=[[5, True, 'x', 1.7],
                        [8, True, 'y', 3.1],
                        [13, False, 'z', np.NaN]],
                index=['A', 'B', 'C'],
                columns=['num', 'bool', 'str', 'real'])

print(df)

demodata = pd.read_csv("pand/titanic.csv")
# print("DEMODATA: ")
# print(demodata)

print()
# print(demodata["clientid"])
print(demodata.iloc[0])
print(demodata.loc[1])
print(demodata.head())
print(demodata.info())
print(demodata.describe())
male = demodata.query('Survived == 1 & Sex == "male"')
female = demodata.query('Survived == 1 & Sex == "female"')

print(len(male), len(female))
# print(demodata[demodata["Survived"] == 1])