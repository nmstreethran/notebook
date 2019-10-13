# Python notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->
- [Getting started](#getting-started)
- [Pandas](#pandas)
- [Matplotlib](#matplotlib)
  - [Customising facecolours](#customising-facecolours)
  - [Customising plots with style sheets](#customising-plots-with-style-sheets)
- [Datetime](#datetime)
- [Getting a Python programme to do nothing when using statements](#getting-a-python-programme-to-do-nothing-when-using-statements)
- [NumPy](#numpy)
- [scikit-learn](#scikit-learn)


## Getting started

* [Python For Beginners](https://www.python.org/about/gettingstarted/)
* [Python Editors](https://wiki.python.org/moin/PythonEditors)
* [Integrated Development Environments](https://wiki.python.org/moin/IntegratedDevelopmentEnvironments)


## [Pandas](http://pandas.pydata.org/pandas-docs/stable/)

[Drop a row / column](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.drop.html):

```py
df.drop(['B','C'], axis=1) # drop columns
df.drop(columns=['B','C']) # drop columns (alternative)
df.drop([0, 1]) # drop row by index
```

[Set index](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.set_index.html#pandas.DataFrame.set_index):

```py
df.set_index('month', inplace=True)
# multiindex
df.set_index(['year', 'month'], inplace=True)
```

[When plotting a time series, set the timestamps as the index, and ensure they are of the datetime format](https://stackoverflow.com/a/52266133/4573584):

```py
df.set_index('Timestamp', inplace=True)
df.index=pd.to_datetime(df.index)
```

[Return a row / column / particular cell in dataframe](https://stackoverflow.com/a/16729808/4573584):

```py
df.iloc[0] # returns corresponding row at index 0
df.iloc[0]['column'] # returns corresponding cell 
```

[Extracting parts of a string in a column separated by a delimiter](https://stackoverflow.com/a/44922659/4573584):

```py
df['Raw'] = 
'(1T XXX, Europe)'
'(2T YYYY, Latin America)'
'(3T ZZ/ZZZZ, Europe)'
'(4T XXX XXX, Africa)'
# perform split into two new columns
df['Model'] = [x.split(',')[0].replace('(', '') for x in df['Raw']] # extract first section; remove opening parenthesis
df['Region'] = [x.split(',')[1].replace(')', '') for x in df['Raw']] # extract second section; remove closing parenthesis
# results
df['Model'] = 
'1T XXX'
'2T YYYY'
'3T ZZ/ZZZZ'
'4T XXX XXX'
df['Region'] = 
'Europe'
'Latin America'
'Europe'
'Africa'
```

[Show all the rows or columns from a DataFrame in Jupyter](https://songhuiming.github.io/pages/2017/04/02/jupyter-and-pandas-display/):

```py
# set up display area to show dataframe
pd.set_option('display.height', 1000)
pd.set_option('display.max_rows', 500)
pd.set_option('display.max_columns', 500)
pd.set_option('display.width', 1000)
```

[Display all text in a cell without truncation in Jupyter](https://songhuiming.github.io/pages/2017/04/02/jupyter-and-pandas-display/):

```py
pd.options.display.max_rows
pd.set_option('display.max_colwidth', -1)
```


## [Matplotlib](https://matplotlib.org/)

[Save pandas dataframe plot as pdf](https://stackoverflow.com/a/35484725/4573584):

```py
plt.savefig('filename.pdf')
```

[Change legend text colour](https://stackoverflow.com/a/47229840/4573584):

```py
plt.setp(plt.legend().get_texts(), color='w')
```


### Customising facecolours

[Change figure axes facecolour](https://stackoverflow.com/a/39176226/4573584) of inline plot globally:

```py
plt.rcParams['axes.facecolor'] = 'red'
```

Change figure axes facecolour of pdf plot output globally (when using `plt.savefig(filename.pdf)`):

```py
plt.rcParams['savefig.facecolor'] = 'red'
```

[Change figure plot area colour](https://stackoverflow.com/a/40371037/4573584) of inline plot globally:

```py
plt.rcParams['figure.facecolor'] = 'black'
```


### [Customising plots with style sheets](https://matplotlib.org/users/style_sheets.html)

```py
plt.style.use('ggplot')
```

To list all available styles, use:

```py
print(plt.style.available)
```

This gives:

```py
['bmh', 'classic', 'dark_background', 'fast', 'fivethirtyeight', 'ggplot', 'grayscale', 'seaborn-bright', 'seaborn-colorblind', 'seaborn-dark-palette', 'seaborn-dark', 'seaborn-darkgrid', 'seaborn-deep', 'seaborn-muted', 'seaborn-notebook', 'seaborn-paper', 'seaborn-pastel', 'seaborn-poster', 'seaborn-talk', 'seaborn-ticks', 'seaborn-white', 'seaborn-whitegrid', 'seaborn', 'Solarize_Light2', 'tableau-colorblind10', '_classic_test']
```

The outputs of each style sheet is shown in [matplotlib-style-sheets.ipynb](https://github.com/nmstreethran/coding/blob/master/matplotlib-style-sheets.ipynb).


## Datetime

* [Python's `strftime` directives](http://strftime.org/)
* [`pandas.to_datetime`](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.to_datetime.html)


## [Getting a Python programme to do nothing when using statements](https://stackoverflow.com/a/19632742/4573584)

```py
if condition:
    pass
else:
    do_something()
```

Alternative (preferred) way:

```py
if not condition:
    do_something()
```

Even better (using not-equal-to operator):

```py
if num2 != num5:
    do_something()
```


## [NumPy](http://www.numpy.org/)


## [scikit-learn](https://scikit-learn.org/stable/)
