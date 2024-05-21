import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import plotly.express as px
import plotly.graph_objects as go
import seaborn as sns

data = pd.read_csv("pand/titanic.csv")

# First Task
male_survived = data.query('Survived == 1 & Sex == "male"')
female_survived = data.query('Survived == 1 & Sex == "female"')

male_not_survived = data.query('Survived == 0 & Sex == "male"')
female_not_survived = data.query('Survived == 0 & Sex == "female"')

table_gender = pd.DataFrame(data=[[len(male_survived), len(female_survived)],
                        [len(male_not_survived), len(female_not_survived)]],
                index=['Survived', 'Died'],
                columns=['Male', 'Female'])

print(table_gender)
print()

# table_gender.plot(kind='pie', subplots=True, figsize=(8, 4), autopct='%1.1f%%')
# plt.show()

# Second Task
first_class_survived = data.query('Survived == 1 & Pclass == 1')
second_class_survived = data.query('Survived == 1 & Pclass == 2')
third_class_survived = data.query('Survived == 1 & Pclass == 3')

first_class_not_survived = data.query('Survived == 0 & Pclass == 1')
second_class_not_survived = data.query('Survived == 0 & Pclass == 2')
third_class_not_survived = data.query('Survived == 0 & Pclass == 3')
table_class = pd.DataFrame(data=[[len(first_class_survived), len(second_class_survived), len(third_class_survived)],
                        [len(first_class_not_survived), len(second_class_not_survived), len(third_class_not_survived)]],
                index=['Survived', 'Died'],
                columns=['First class', 'Second class', 'Third class'])

print(table_class)
print()

# table_class.plot(kind='pie', subplots=True, figsize=(12, 4), autopct='%1.1f%%')
# plt.show()

# Third Task

survived = data.query('Survived == 1 and not Age.isna()')
not_survived = data.query('Survived == 0 and not Age.isna()')

survived_ages = survived['Age']
not_survived_ages = not_survived['Age']

# fig, axs = plt.subplots(1, 2, figsize=(10, 5))
# axs[0].set_xlabel('Age')
# axs[0].set_ylabel('Frequency')
# axs[1].set_xlabel('Age')
# axs[1].set_ylabel('Frequency')

# survived_ages.plot.hist(ax=axs[0], title='Survived')
# not_survived_ages.plot.hist(ax=axs[1], title='Not Survived')

# fig.suptitle('Histograms of Ages for Survived and Not Survived Passengers')
# plt.show()

# Fourth Task
cheap_survived = data.query('Survived == 1 and Fare < 25')
expensive_survived =  data.query('Survived == 1 and Fare >= 25')

cheap_not_survived = data.query('Survived == 0 and Fare < 25')
expensive_not_survived =  data.query('Survived == 0 and Fare >= 25')

table_price = pd.DataFrame(data=[[len(cheap_survived), len(expensive_survived)],
                        [len(cheap_not_survived), len(expensive_not_survived)]],
                index=['Survived', 'Died'],
                columns=['Cheap', 'Expensive'])

print(table_price)
print()
# table_price.plot(kind='pie', subplots=True, figsize=(12, 4), autopct='%1.1f%%')
# plt.show()

# fig = px.pie(table_price, values='Cheap', names='Cheap', title='Correlation between price and mortality')
# fig.show()

