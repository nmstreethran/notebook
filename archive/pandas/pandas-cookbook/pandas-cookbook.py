#%% [markdown]
# # [Cookbook](https://pandas.pydata.org/pandas-docs/stable/user_guide/cookbook.html)

#%%
# import packages
import pandas as pd
import numpy as np 
import matplotlib.pyplot as plt 

#%% [markdown]
# ## Idioms

#%%
df=pd.DataFrame({'AAA':[4,5,6,7],
                 'BBB': [10,20,30,40],
                 'CCC': [100,50,-30,-50]})
df

#%% [markdown]
# ### if-then...

#%% 
# an if-then on one column
df.loc[df.AAA>=5,'BBB']=-1
df

#%%
# an if-then with assignment to 2 columns
df.loc[df.AAA>=5,['BBB','CCC']]=555
df

#%%
# add another line with different logic, to do the -else
df.loc[df.AAA<5,['BBB','CCC']]=2000
df

#%%
# or use pandas where after you've set up a mask
df_mask=pd.DataFrame({'AAA':[True]*4,
                      'BBB':[False]*4,
                      'CCC':[True,False]*2})
# all four rows in AAA are True; all four rows in BBB are False; alternating rows in CCC are True and False; all False cells return -1000
df.where(df_mask,-1000)

#%% [markdown]
# [if-then-else using numpy’s where()](https://stackoverflow.com/questions/19913659/pandas-conditional-creation-of-a-series-dataframe-column)

#%%
df=pd.DataFrame({'AAA':[4,5,6,7],
                 'BBB':[10,20,30,40],
                 'CCC':[100,50,-30,-50]})
df

#%%
df['logic']=np.where(df['AAA']>5,'high','low')
df

#%% [markdown]
# ### Splitting
# [Split a frame with boolean criterion](https://stackoverflow.com/questions/14957116/how-to-split-a-dataframe-according-to-a-boolean-criterion)

#%%
df=pd.DataFrame({'AAA':[4,5,6,7],
                 'BBB':[10,20,30,40],
                 'CCC':[100,50,-30,-50]})
df

#%%
df[df.AAA<=5]

#%%
df[df.AAA>5]

#%% [markdown]
# ### Building criteria
# [Select with multi-column criteria](https://stackoverflow.com/questions/15315452/selecting-with-complex-criteria-from-pandas-dataframe)

#%%
df=pd.DataFrame({'AAA':[4,5,6,7],
                 'BBB':[10,20,30,40],
                 'CCC':[100,50,-30,-50]})
df

#%%
# ...and (without assignment returns a Series)
df.loc[(df['BBB']<25)&(df['CCC']>=-40),'AAA']

#%%
# ...or (without assignment returns a Series)
df.loc[(df['BBB']>25)|(df['CCC']>=-40),'AAA']

#%%
# ...or (with assignment modifies the DataFrame)
df.loc[(df['BBB']>25)|(df['CCC']>=75),'AAA']=0.1
df

#%% [markdown]
# [Select rows with data closest to certain value using argsort](https://stackoverflow.com/questions/17758023/return-rows-in-a-dataframe-closest-to-a-user-defined-number)

#%%
df=pd.DataFrame({'AAA':[4,5,6,7],
                 'BBB':[10,20,30,40],
                 'CCC':[100,50,-30,-50]})
df

#%%
aValue=43.0
# sort rows based on how close (df.CCC-aValue) is to aValue (note the change in index order)
df.loc[(df.CCC-aValue).abs().argsort()]

#%% [markdown]
# [Dynamically reduce a list of criteria using a binary operator](https://stackoverflow.com/questions/21058254/pandas-boolean-operation-in-a-python-list/21058331)

#%%
df=pd.DataFrame({'AAA':[4,5,6,7],
                 'BBB':[10,20,30,40],
                 'CCC':[100,50,-30,-50]})
df

#%%
Crit1=df.AAA<=5.5
Crit2=df.BBB==10.0
Crit3=df.CCC>-40.0
# one could hard code
AllCrit=Crit1&Crit2&Crit3

#%%
# ...or it can be done with a list of dynamically built criteria
import functools
CritList=[Crit1,Crit2,Crit3]
AllCrit=functools.reduce(lambda x,y:x&y,CritList)
df[AllCrit]

#%% [markdown]
# ## Selection
# ### DataFrames
# See the [indexing](https://pandas.pydata.org/pandas-docs/stable/user_guide/indexing.html#indexing) docs
#
# [Using both row labels and value conditionals](https://stackoverflow.com/questions/14725068/pandas-using-row-labels-in-boolean-indexing)

#%%
df=pd.DataFrame({'AAA':[4,5,6,7],
                 'BBB':[10,20,30,40],
                 'CCC':[100,50,-30,-50]})
df

#%%
df[(df.AAA<=6)&(df.index.isin([0,2,4]))]

#%% [markdown]
# [Use loc for label-oriented slicing and iloc for positional slicing](https://github.com/pandas-dev/pandas/issues/2904)

#%%
df=pd.DataFrame({'AAA':[4,5,6,7],
                 'BBB':[10,20,30,40],
                 'CCC':[100,50,-30,-50]},
                 index=['foo','bar','boo','kar'])
df

#%% [markdown]
# There are 2 explicit slicing methods, with a third general case
#
# 1. Positional-oriented (Python slicing style: exclusive of end)
# 2. Label-oriented (Non-Python slicing style: inclusive of end)
# 3. General (Either slicing style: depends on if the slice contains labels or positions)

#%%
# inclusive of end
df.loc['bar':'kar']  # label

#%%
# exclusive of end (i.e., index 3)
df.iloc[0:3]  

#%% [markdown]
# Ambiguity arises when an index consists of integers with a non-zero start or non-unit increment

#%%
data={'AAA':[4,5,6,7],
      'BBB':[10,20,30,40],
      'CCC':[100,50,-30,-50]}
df2=pd.DataFrame(data=data,index=[1,2,3,4]) # note index starts at 1
df2

#%%
df2.iloc[1:3] # position-oriented

#%%
df2.loc[1:3] # label-oriented

#%% [markdown]
# [Using inverse operator (~) to take the complement of a mask](https://stackoverflow.com/questions/14986510/picking-out-elements-based-on-complement-of-indices-in-python-pandas)

#%%
df=pd.DataFrame({'AAA':[4,5,6,7],
                 'BBB':[10,20,30,40],
                 'CCC':[100,50,-30,-50]})
df

#%%
# this returns (df.AAA>6)&(df.index.isin([1,3]))
df[~((df.AAA<=6)&(df.index.isin([0,2,4])))]

#%% [markdown]
# ### Panels
# [Extend a panel frame by transposing, adding a new dimension and transposing back to the original dimensions](http://stackoverflow.com/questions/15364050/extending-a-pandas-panel-frame-along-the-minor-axis)

#%%
rng=pd.date_range('1/1/2013',periods=100,freq='D')
data=np.random.randn(100,4)
cols=['A','B','C','D']
df1=pd.DataFrame(data,rng,cols)
df2=pd.DataFrame(data,rng,cols)
df3=pd.DataFrame(data,rng,cols)
pf=pd.Panel({'df1':df1,'df2':df2,'df3':df3})
pf

#%%
pf.loc[:,:,'F']=pd.DataFrame(data,rng,cols)
pf

#%% [markdown]
# [Mask a panel by using np.where and then reconstructing the panel with the new masked values](https://stackoverflow.com/questions/14650341/boolean-mask-in-pandas-panel)
# ### New columns
# [Efficiently and dynamically create new columns using applymap](https://stackoverflow.com/questions/16575868/efficiently-creating-additional-columns-in-a-pandas-dataframe-using-map)

#%%
df=pd.DataFrame({'AAA':[1,2,1,3],
                 'BBB':[1,1,2,2],
                 'CCC':[2,1,3,1]})
df

#%%
source_cols=df.columns # or some subset would work too
new_cols=[str(x)+"_cat" for x in source_cols]
categories={1:'Alpha',2:'Beta',3:'Charlie'}
df[new_cols]=df[source_cols].applymap(categories.get)
df

#%% [markdown]
# [Keep other columns when using min() with groupby](https://stackoverflow.com/questions/23394476/keep-other-columns-when-using-min-with-groupby)

#%%
df=pd.DataFrame({'AAA':[1,1,1,2,2,2,3,3],
                 'BBB':[2,1,3,4,5,1,2,3]})
df

#%%
# Method 1: idxmin() to get the index of the minimums
df.loc[df.groupby("AAA")["BBB"].idxmin()]

#%%
# Method 2: sort first, then take the first of each
df.sort_values(by="BBB").groupby("AAA",as_index=False).first()
# notice the same results, except for the index

#%% [markdown]
# ## MultiIndexing
# See the [multiindexing](https://pandas.pydata.org/pandas-docs/stable/user_guide/advanced.html#advanced-hierarchical) docs.
#
# [Creating a MultiIndex from a labelled frame](https://stackoverflow.com/questions/14916358/reshaping-dataframes-in-pandas-based-on-column-labels)

#%%
df=pd.DataFrame({'row':[0,1,2],
                 'One_X':[1.1,1.1,1.1],
                 'One_Y':[1.2,1.2,1.2],
                 'Two_X':[1.11,1.11,1.11],
                 'Two_Y':[1.22,1.22,1.22]})
df

#%%
df=df.set_index('row') # as labelled index
df

#%%
# with hierarchical columns
df.columns=pd.MultiIndex.from_tuples([tuple(c.split('_'))
                                      for c in df.columns])
df

#%%
# stack and reset
df=df.stack(0).reset_index(1)
df

#%%
# and fix the labels ( notice the label 'level_1' got added automatically)
df.columns=['Sample','All_X','All_Y']
df

#%% [markdown]
# ### Arithmetic
# [Performing arithmetic with a MultiIndex that needs broadcasting](https://stackoverflow.com/questions/19501510/divide-entire-pandas-multiindex-dataframe-by-dataframe-variable/19502176#19502176)

#%%
cols=pd.MultiIndex.from_tuples([(x,y) for x in ['A','B','C']
                                for y in ['O','I']])
df=pd.DataFrame(np.random.randn(2,6),index=['n','m'],columns=cols)
df

#%%
df=df.div(df['C'],level=1)
df

#%% [markdown]
# ### Slicing
# [Slicing a MultiIndex with xs](https://stackoverflow.com/questions/12590131/how-to-slice-multindex-columns-in-pandas-dataframes)

#%%
coords=[('AA','one'),('AA','six'),('BB','one'),('BB','two'),
        ('BB', 'six')]
index=pd.MultiIndex.from_tuples(coords)
df=pd.DataFrame([11,22,33,44,55],index,['MyData'])
df

#%%
# to take the cross-section of the 1st level and 1st axis of the index
# note: level and axis are optional, and default to zero
df.xs('BB',level=0,axis=0)

#%%
# ...and now the 2nd level of the first axis
df.xs('six',level=1,axis=0)

#%% [markdown]
# [Slicing a MultiIndex with xs, method 2](https://stackoverflow.com/questions/14964493/multiindex-based-indexing-in-pandas)

#%%
import itertools
index=list(itertools.product(['Ada','Quinn','Violet'],
                             ['Comp','Math','Sci']))
headr=list(itertools.product(['Exams','Labs'],['I','II']))
indx=pd.MultiIndex.from_tuples(index,names=['Student','Course'])
cols=pd.MultiIndex.from_tuples(headr) # notice these are un-named
data=[[70+x+y+(x*y)%3 for x in range(4)] for y in range(9)]
df=pd.DataFrame(data,indx,cols)
df

#%%
All=slice(None)
df.loc['Violet']

#%%
df.loc[(All,'Math'),All]

#%%
df.loc[(slice('Ada','Quinn'),'Math'),All]

#%%
df.loc[(All,'Math'),('Exams')]

#%%
df.loc[(All,'Math'),(All,'II')]

#%% [markdown]
# [Setting portions of a MultiIndex with xs](https://stackoverflow.com/questions/19319432/pandas-selecting-a-lower-level-in-a-dataframe-to-do-a-ffill)
# ### Sorting
# [Sort by a specific column or an ordered list of columns with a MultiIndex](https://stackoverflow.com/questions/14733871/mutli-index-sorting-in-pandas)

#%%
df.sort_values(by=('Labs','II'),ascending=False)

#%% [markdown]
# [Partial selection, the need for sorting](https://github.com/pandas-dev/pandas/issues/2995)
# ### Levels
# * [Prepending a level to a MultiIndex](http://stackoverflow.com/questions/14744068/prepend-a-level-to-a-pandas-multiindex)
# * [Flatten hierarchical columns](http://stackoverflow.com/questions/14507794/python-pandas-how-to-flatten-a-hierarchical-index-in-columns)

#%% [markdown]
# ## Missing data
# See the [missing data](https://pandas.pydata.org/pandas-docs/stable/user_guide/missing_data.html#missing-data) docs
#
# Fill forward a reversed time series

#%%
df=pd.DataFrame(np.random.randn(6,1),
                index=pd.date_range('2013-08-01', periods=6,freq='B'),
                columns=list('A'))
df.loc[df.index[3],'A']=np.nan
df

#%%
df.reindex(df.index[::-1]).ffill() # reverse order of index and fill missing value with value of cell above

#%% [markdown]
# [cumsum reset at NaN values](http://stackoverflow.com/questions/18196811/cumsum-reset-at-nan)
# ### Replace
# [Using replace with backrefs](http://stackoverflow.com/questions/16818871/extracting-value-and-creating-new-column-out-of-it)
# ## Grouping
# See the [grouping](https://pandas.pydata.org/pandas-docs/stable/user_guide/groupby.html#groupby) docs
#
# [Basic grouping with apply](http://stackoverflow.com/questions/15322632/python-pandas-df-groupy-agg-column-reference-in-agg)
#
# Unlike agg, apply's callable is passed as a sub-DataFrame, which gives you access to all the columns

#%%
df = pd.DataFrame({'animal': 'cat dog cat fish dog cat cat'.split(),
                   'size': list('SSMMMLL'),
                   'weight': [8, 10, 11, 1, 20, 12, 12],
                   'adult': [False] * 5 + [True] * 2})
df

#%%
# list the size of the animals with the highest weight
df.groupby('animal').apply(lambda subf: subf['size'][subf['weight'].idxmax()])

#%% [markdown]
# [using `get_group`](http://stackoverflow.com/questions/14734533/how-to-access-pandas-groupby-dataframe-by-key)

#%%
gb=df.groupby(['animal'])
gb.get_group('cat')

#%% [markdown]
# [apply to different items in a group](http://stackoverflow.com/questions/15262134/apply-different-functions-to-different-items-in-group-object-python-pandas)

#%%
def GrowUp(x):
      avg_weight=sum(x[x['size']=='S'].weight*1.5)
      avg_weight+=sum(x[x['size']=='M'].weight*1.25)
      avg_weight+=sum(x[x['size']=='L'].weight)
      avg_weight/=len(x)
      return pd.Series(['L',avg_weight,True],
                        index=['size','weight','adult'])
expected_df=gb.apply(GrowUp)
expected_df

#%% [markdown]
# [expanding apply](http://stackoverflow.com/questions/14542145/reductions-down-a-column-in-pandas)


#%%
S=pd.Series([i/100.0 for i in range(1,11)])
def cum_ret(x,y):
      return x*(1+y)
def red(x):
      return functools.reduce(cum_ret,x,1.0)
S.expanding().apply(red,raw=True)

#%%
