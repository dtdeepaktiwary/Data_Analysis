#!/usr/bin/env python
# coding: utf-8

# # Introduction:![Indian_Premier_League_Official_Logo.svg.png](attachment:Indian_Premier_League_Official_Logo.svg.png)
#     
# The dataset belongs to the IPL wherein there are different teams and data anlysis is done based this using the different libraries of Python.
# 
# Further the concepts of Exploratory Data Analysis and Featured Engineering is also applied to understand , analyse and visualize the data in better manner and and draw useful insights from the data to make better decisions.

# In[34]:


## loading the required libraries
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns


# In[36]:


#loading the ipl matches dataset
df= pd.read_csv(r"C:\Users\dtdee\OneDrive\Desktop\Letsupgrade_Python\Data_Analysis_Visualisation\IPL_matches_Dataset_Project.csv")
df


# In[37]:


#having a glance at the first five records of the dataset
df.head()


# In[38]:


#Looking at the number of rows and columns in the dataset
df.shape


# In[44]:


# Looking at the basic information of the data set
df.info()


# In[46]:


# Looking at the basic statistics of the data
df.describe().T


# In[49]:


sns.heatmap(df.corr(),annot=True)


# In[58]:


#checking and handling the Missing values min the dataset which is a part of EDA or Data Preprocessing.

df.isnull().sum()


# In[55]:


df['city'].fillna('Missing_City',inplace=True)
df['winner'].fillna('Missing_winnerteam',inplace=True)
df['player_of_match'].fillna('Missing_POM',inplace=True)
df['umpire1'].fillna('Missing_U1',inplace=True)
df['umpire2'].fillna('Missing_U2',inplace=True)


# In[59]:


#Since all values in the column is missing so better to drop the column
df['umpire3']


# In[67]:


df.drop(columns='umpire3',inplace=True)


# In[68]:


df.isnull().sum()


# In[70]:


#Checking any duplicate values avilable in the dataset.

df[df.duplicated()]


# In[73]:


#Getting the frequency of most man of the match awards
df['player_of_match'].value_counts()


# In[72]:


#Getting the top 10 players with most man of the match awards
df['player_of_match'].value_counts().head(10)


# In[79]:


sns.barplot(x=df['player_of_match'].value_counts().head(10),y=df['player_of_match'].value_counts().head(10).index,data=df)


# ##### Observation:-
# 
# Chris Gayle is most valueable player from the past followed by YK Pathan and AB de Villiers

# In[80]:


df.head(2)


# In[82]:


#Getting the frequency of result column
df['result'].value_counts()


# In[84]:


#Finding out the number of toss wins w.r.t each team
df['toss_winner'].value_counts()


# In[85]:


df.head(2)


# In[136]:


#Extracting the records where a team won batting first
df[df['win_by_runs']>0].head().sort_values('win_by_runs',ascending=False)


# In[ ]:





# In[ ]:





# In[139]:


df.head(2)


# In[152]:


#Finding out the number of wins w.r.t each team after batting first
batting_first = df[df['win_by_runs']>0]
batting_first['winner'].value_counts()


# In[155]:


#Making a bar-plot for top 3 teams with most wins after batting first
# batting_first['winner'].value_counts().head(3)
sns.barplot(y=batting_first['winner'].value_counts().head(3),x=batting_first['winner'].value_counts().head(3).index,data=df)


# ##### OBSERVATION:-
# 
# We see that based on history till now Mumbai indians has won most times batting first and followed by Chennai Super Kings and Kings11 Punjab.

# In[168]:


#Making a pie chart
plt.figure(figsize=(4,4))
plt.pie(batting_first['winner'].value_counts().head(3),labels=batting_first['winner'].value_counts().head(3).index,autopct='%0.1f%%')
plt.show()


# In[169]:


df.head(2)


# In[173]:


#extracting those records where a team has won after batting second
df[df['win_by_wickets']>0]['winner'].value_counts()


# In[180]:


#creating piechart
plt.figure(figsize=(9,9))
plt.pie(df[df['win_by_wickets']>0]['winner'].value_counts(),labels=df[df['win_by_wickets']>0]['winner'].value_counts().index,autopct='%0.1f%%')
plt.show()


# In[182]:


df.head(2)


# In[203]:


#Making a histogram for frequency of wins w.r.t number of wickets
# df[df['win_by_wickets']>0]['win_by_wickets']
plt.hist(df[df['win_by_wickets']>0]['win_by_wickets'],bins=20)
plt.show()


# In[216]:


#Making a bar plot for top-3 teams with most wins after batting second
df[df['win_by_wickets']>0]['winner'].value_counts().head(3)

sns.barplot(x=df[df['win_by_wickets']>0]['winner'].value_counts().head(3),y=df[df['win_by_wickets']>0]['winner'].value_counts().head(3).index,data=df)


# In[221]:


#Making a pie chart for distribution of most wins after batting second
plt.pie(df[df['win_by_wickets']>0]['winner'].value_counts().head(5),labels=df[df['win_by_wickets']>0]['winner'].value_counts().head(5).index,autopct='%0.1f%%')
plt.show()


# In[222]:


df.head(2)


# In[224]:


#Looking at the number of matches played each season
df['season'].value_counts()


# In[226]:


#Looking at the number of matches played in each city
df['city'].value_counts()


# In[227]:


df.head(2)


# In[232]:


#Finding out how many times a team has won the match after winning the toss
df[df['winner']==df['toss_winner']]


# #### Conclusion:-
# 
# We see that there are chances of team winning toss first may win the match and there are also important decisions be made on teams based on the batting first and second.
# 
# This gives us some insight abot the dataset.
# 
# Thanks!!
