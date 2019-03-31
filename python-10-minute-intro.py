#%% [markdown]
# # [10 Minutes to pandas](http://pandas-docs.github.io/pandas-docs-travis/getting_started/10min.html)

#%%
# import packages
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

#%% [markdown]
# ## Object creation

#%%
# creating a Series by passing a list of values, letting pandas create a default integer index
s = pd.Series([1, 3, 5, np.nan, 6, 8])
s

#%%
# creating a DataFrame by passing a NumPy array, with a datetime index and labeled columns
dates = pd.date_range('20130101', periods=6)
dates

#%%
df = pd.DataFrame(np.random.randn(6, 4), index=dates, columns=list('ABCD'))
df

#%%
# creating a DataFrame by passing a dict of objects that can be converted to series-like
df2 = pd.DataFrame({'A': 1.,
                    'B': pd.Timestamp('20130102'),
                    'C': pd.Series(1, index=list(range(4)), dtype='float32'),
                    'D': np.array([3] * 4, dtype='int32'),
                    'E': pd.Categorical(["test", "train", "test", "train"]),
                    'F': 'foo'})
df2

#%%
# the columns of the resulting DataFrame have different dtypes
df2.dtypes

#%% [markdown]
# ## Viewing data

#%%
# view the top and bottom rows of the frame
df.head()

#%%
df.tail(3)

#%%
# display the index and columns
df.index

#%%
df.columns

#%% [markdown]
# `DataFrame.to_numpy()` gives a NumPy representation of the underlying data. This can be an expensive operation when your `DataFrame` has columns with different data types because NumPy arrays have one dtype for the entire array, while pandas DataFrames have one dtype per column. pandas will find the NumPy dtype that can hold all of the dtypes in the DataFrame. This may end up being `object`, which requires casting every value to a Python object.

#%%
# for df, our DataFrame of all floating-point values, DataFrame.to_numpy() is fast and doesn’t require copying data
df.to_numpy()

#%%
# for df2, the DataFrame with multiple dtypes, DataFrame.to_numpy() is relatively expensive
df2.to_numpy()

#%%
# describe() shows a quick statistic summary of your data
df.describe()

#%%
# transposing your data
df.T

#%%
# sorting by an axis
df.sort_index(axis=1, ascending=False)

#%%
# sorting by values
df.sort_values(by='B')

#%% [markdown]
# ## Selection
#%% [markdown]
# ### Getting

#%%
# selecting a single column, which yields a Series, equivalent to df.A
df['A']

#%%
# selecting via [], which slices the rows
df[0:3]

#%%
df['20130102':'20130104']

#%% [markdown]
# ### Selection by label

#%%
# getting a cross section using a label
df.loc[dates[0]]

#%%
# selecting on a multi-axis by label
df.loc[:, ['A', 'B']]

#%%
# showing label slicing, both endpoints are included
df.loc['20130102':'20130104', ['A', 'B']]

#%%
# reduction in the dimensions of the returned object
df.loc['20130102', ['A', 'B']]

#%%
# getting a scalar value
df.loc[dates[0], 'A']

#%%
# getting fast access to a scalar (equivalent to the prior method)
df.at[dates[0], 'A']

#%% [markdown]
# ### Selection by position

#%%
# select via the position of the passed integers
df.iloc[3]

#%%
# by integer slices, acting similar to numpy/python
df.iloc[3:5, 0:2]

#%%
# by lists of integer position locations, similar to the numpy/python style
df.iloc[[1, 2, 4], [0, 2]]

#%%
# slicing rows explicitly
df.iloc[1:3, :]

#%%
# slicing columns explicitly
df.iloc[:, 1:3]

#%%
# getting a value explicitly
df.iloc[1, 1]

#%%
# getting fast access to a scalar (equivalent to the prior method)
df.iat[1, 1]

#%% [markdown]
# ### Boolean indexing

#%%
# using a single column’s values to select data
df[df.A > 0]

#%%
# selecting values from a DataFrame where a boolean condition is met
df[df > 0]

#%%
# using the isin() method for filtering
df2 = df.copy()
df2['E'] = ['one', 'one', 'two', 'three', 'four', 'three']
df2

#%%
df2[df2['E'].isin(['two', 'four'])]

#%% [markdown]
# ### Setting

#%%
# setting a new column automatically aligns the data by the indexes
s1 = pd.Series([1, 2, 3, 4, 5, 6], index=pd.date_range('20130102', periods=6))
s1

#%%
df['F'] = s1

#%%
# setting values by label
df.at[dates[0], 'A'] = 0

#%%
# setting values by position
df.iat[0, 1] = 0

#%%
# setting by assigning with a NumPy array
df.loc[:, 'D'] = np.array([5] * len(df))

#%%
# result of the prior setting operations
df

#%%
# a where operation with setting
df2 = df.copy()
df2[df2 > 0] = -df2
df2

#%% [markdown]
# ## Missing data
#%% [markdown]
# pandas primarily uses the value `np.nan` to represent missing data. It is by default not included in computations.

#%%
# reindexing to change/add/delete the index on a specific axis
df1 = df.reindex(index=dates[0:4], columns=list(df.columns) + ['E'])
df1.loc[dates[0]:dates[1], 'E'] = 1
df1

#%%
# to drop any rows that have missing data
df1.dropna(how='any')

#%%
# filling missing data
df1.fillna(value=5)

#%%
# get the boolean mask where values are nan
pd.isna(df1)

#%% [markdown]
# ## Operations
#%% [markdown]
# ### Stats
#%% [markdown]
# Operations in general exclude missing data.

#%%
# performing a descriptive statistic
df.mean()

#%%
# same operation on the other axis
df.mean(1)

#%%
# operating with objects that have different dimensionality and need alignment
# pandas automatically broadcasts along the specified dimension
s = pd.Series([1, 3, 5, np.nan, 6, 8], index=dates).shift(2)
s

#%%
df.sub(s, axis='index')

#%% [markdown]
# ### Apply

#%%
# applying functions to the data
df.apply(np.cumsum)

#%%
df.apply(lambda x: x.max() - x.min())

#%% [markdown]
# ### Histogramming

#%%
s = pd.Series(np.random.randint(0, 7, size=10))
s

#%%
s.value_counts()

#%% [markdown]
# ### String methods

#%%
# pattern-matching in str generally uses regular expressions by default (and in some cases always uses them)
s = pd.Series(['A', 'B', 'C', 'Aaba', 'Baca', np.nan, 'CABA', 'dog', 'cat'])
s.str.lower()

#%% [markdown]
# ## Merge
#%% [markdown]
# ### Concat

#%%
# concatenating pandas objects together
df = pd.DataFrame(np.random.randn(10, 4))
df

#%%
# break it into pieces
pieces = [df[:3], df[3:7], df[7:]]
pd.concat(pieces)

#%% [markdown]
# ### Join

#%% 
# SQL-style merges
left = pd.DataFrame({'key': ['foo', 'foo'], 'lval': [1, 2]})
right = pd.DataFrame({'key': ['foo', 'foo'], 'rval': [4, 5]})

#%%
left

#%% 
right

#%%
pd.merge(left, right, on='key')

#%%
# another example
left = pd.DataFrame({'key': ['foo', 'bar'], 'lval': [1, 2]})
right = pd.DataFrame({'key': ['foo', 'bar'], 'rval': [4, 5]})

#%%
left

#%%
right

#%%
pd.merge(left, right, on='key')

#%% [markdown]
# ### Append

#%%
# append rows to a dataframe
df = pd.DataFrame(np.random.randn(8, 4), columns=['A', 'B', 'C', 'D'])
df

#%%
s = df.iloc[3]
df.append(s, ignore_index=True)

#%% [markdown]
# ## Grouping

#%% [markdown]
# Grouping refers to a process involving one or more of the following steps:
# * **Splitting** the data into groups based on some criteria
# * **Applying** a function to each group independently
# * **Combining** the results into a data structure

#%%
df = pd.DataFrame({'A': ['foo', 'bar', 'foo', 'bar',
                    'foo', 'bar', 'foo', 'foo'],
                    'B': ['one', 'one', 'two', 'three',
                    'two', 'two', 'one', 'three'],
                    'C': np.random.randn(8),
                    'D': np.random.randn(8)})
df

#%%
# grouping and then applying the sum() function to the resulting groups
df.groupby('A').sum()

#%%
# grouping by multiple columns forms a hierarchical index
df.groupby(['A', 'B']).sum()

#%% [markdown]
# ## Reshaping

#%% [markdown]
# ### Stack

#%%
tuples = list(zip(*[['bar', 'bar', 'baz', 'baz',
                    'foo', 'foo', 'qux', 'qux'],
                    ['one', 'two', 'one', 'two',
                    'one', 'two', 'one', 'two']]))
index = pd.MultiIndex.from_tuples(tuples, names=['first', 'second'])
df = pd.DataFrame(np.random.randn(8, 2), index=index, columns=['A', 'B'])
df2 = df[:4]
df2

#%% 
# the stack() method "compresses" a level in the DataFrame's columns
stacked = df2.stack()
stacked

#%% [markdown]
# With a "stacked" DataFrame or Series (having a `MultiIndex` as the `index`), the last inverse operation of `stack()` is `unstack()`, which by default unstacks the **last level**.

#%% 
stacked.unstack()

#%%
stacked.unstack(1)

#%% 
stacked.unstack(0)

#%% [markdown]
# ### Pivot tables

#%% 
df = pd.DataFrame({'A': ['one', 'one', 'two', 'three'] * 3,
                    'B': ['A', 'B', 'C'] * 4,
                    'C': ['foo', 'foo', 'foo', 'bar', 'bar', 'bar'] * 2,
                    'D': np.random.randn(12),
                    'E': np.random.randn(12)})
df

#%%
pd.pivot_table(df, values='D', index=['A', 'B'], columns=['C'])

#%% [markdown]
# ## Time series

#%% [markdown]
# pandas has the functionality for performing resampling operations during frequency conversion (e.g., converting secondly data into 5-minutely data).

#%%
rng = pd.date_range('1/1/2012', periods=100, freq='S')
ts = pd.Series(np.random.randint(0, 500, len(rng)), index=rng)
ts.resample('5Min').sum()

#%%
# time zone representation
rng = pd.date_range('3/6/2012 00:00', periods=5, freq='D')
ts = pd.Series(np.random.randn(len(rng)), rng)
ts

#%%
ts_utc = ts.tz_localize('UTC')
ts_utc

#%% 
# converting to another time zone
ts_utc.tz_convert('US/Eastern')

#%% 
# converting between time span representation
rng = pd.date_range('1/1/2012', periods=5, freq='M')
ts = pd.Series(np.random.randn(len(rng)), index=rng)
ts

#%%
ps = ts.to_period()
ps

#%%
ps.to_timestamp()

#%%
# convert a quarterly frequency with year ending in November to 9am of the end of the month following the quarter end
prng = pd.period_range('1990Q1', '2000Q4', freq='Q-NOV')
ts = pd.Series(np.random.randn(len(prng)), prng)
ts.index = (prng.asfreq('M', 'e') + 1).asfreq('H', 's') + 9
ts.head()

#%% [markdown]
# ## Categoricals

#%%
# categorical data in a DataFrame
df = pd.DataFrame({"id": [1, 2, 3, 4, 5, 6],
                    "raw_grade": ['a', 'b', 'b', 'a', 'a', 'e']})
# convert the raw grades to a categorical data type
df["grade"] = df["raw_grade"].astype("category")
df["grade"]

#%% 
# rename the categories to more meaningful names
df["grade"].cat.categories = ["very good", "good", "very bad"]
# reorder the categories and simultaneously add the missing categories 
# methods under Series.cat return a new Series by default
df["grade"] = df["grade"].cat.set_categories(["very bad", "bad", "medium",
                                                "good", "very good"])
df["grade"]

#%%
# sorting is per order in the categories, not lexical order
df.sort_values(by="grade")

#%%
# grouping by a categorical column also shows empty categories
df.groupby("grade").size()

#%% [markdown]
# ## Plotting

#%%
ts = pd.Series(np.random.randn(1000),
                index=pd.date_range('1/1/2000', periods=1000))
ts = ts.cumsum()
ts.plot()

#%%
# on a DataFrame, the plot() method is a convenience to plot all of the columns with labels
df = pd.DataFrame(np.random.randn(1000, 4), index=ts.index,
                    columns=['A', 'B', 'C', 'D'])
df = df.cumsum()
plt.figure()
df.plot()
plt.legend(loc='best')

#%% [markdown]
# ## Getting data in / out

#%% [markdown]
# ### CSV

#%%
# writing to a csv file
df.to_csv('foo.csv')
# reading from a csv file
pd.read_csv('foo.csv')

#%% [markdown]
# ### HDF5

#%% 
# writing to a HDF5 Store
df.to_hdf('foo.h5', 'df')
# reading from a HDF5 Store
pd.read_hdf('foo.h5', 'df')

#%% [markdown]
# ### Excel

#%%
# writing to an excel file
df.to_excel('foo.xlsx', sheet_name='Sheet1')
# reading from an excel file
pd.read_excel('foo.xlsx', 'Sheet1', index_col=None, na_values=['NA'])

#%% [markdown]
# ## Gotchas
# If you are attempting to perform an operation you might see an exception like:
# ```
# >>> if pd.Series([False, True, False]):
# ...     print("I was true")
# Traceback
#    ...
# ValueError: The truth value of an array is ambiguous. Use a.empty, a.any() or a.all().
# ```