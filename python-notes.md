# Python notes

## [Pandas](http://pandas.pydata.org/pandas-docs/stable/)

[Drop a row / column](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.drop.html):

```python
df.drop(['B','C'],axis=1) # drop columns
df.drop(columns=['B','C']) # drop columns (alternative)
df.drop([0,1]) # drop row by index
```

[Set index](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.set_index.html#pandas.DataFrame.set_index):

```python
df.set_index('month',inplace=True)
# multiindex
df.set_index(['year','month'],inplace=True)
```

[Return a row / column / particular cell in dataframe](https://stackoverflow.com/a/16729808/4573584):

```python
df.iloc[0] # returns corresponding row at index 0
df.iloc[0]['column'] # returns corresponding cell 
```

[Extracting parts of a string in a column separated by a delimiter](https://stackoverflow.com/a/44922659/4573584):

```python
df['Raw']=
'(1T XXX, Europe)'
'(2T YYYY, Latin America)'
'(3T ZZ/ZZZZ, Europe)'
'(4T XXX XXX, Africa)'
# perform split into two new columns
df['Model']=[x.split(',')[0].replace('(','') for x in df['Raw']] # extract first section; remove opening parenthesis
df['Region']=[x.split(',')[1].replace(')','') for x in df['Raw']] # extract second section; remove closing parenthesis
# results
df['Model']=
'1T XXX'
'2T YYYY'
'3T ZZ/ZZZZ'
'4T XXX XXX'
df['Region']=
'Europe'
'Latin America'
'Europe'
'Africa'
```

## [Matplotlib](https://matplotlib.org/)

Save pandas dataframe plot as pdf:

```python
plt.savefig('filename.pdf')
```

Change figure axes facecolour of inline plot globally:

```python
plt.rcParams['axes.facecolor']='red'
```

Change figure plot area colour of inline plot globally:

```python
plt.rcParams['figure.facecolor']='black'
```

Change figure axes facecolour of pdf plot output globally (when using `plt.savefig(filename.pdf)`):

```python
plt.rcParams['savefig.facecolor']='red'
```
Change legend text colour: 

```python
plt.setp(plt.legend().get_texts(),color='w')
```

Customising plots with style sheets:

```python
plt.style.use('ggplot')
```

To list all available styles, use:

```python
print(plt.style.available)
```

This gives:

```python
['bmh', 'classic', 'dark_background', 'fast', 'fivethirtyeight', 'ggplot', 'grayscale', 'seaborn-bright', 'seaborn-colorblind', 'seaborn-dark-palette', 'seaborn-dark', 'seaborn-darkgrid', 'seaborn-deep', 'seaborn-muted', 'seaborn-notebook', 'seaborn-paper', 'seaborn-pastel', 'seaborn-poster', 'seaborn-talk', 'seaborn-ticks', 'seaborn-white', 'seaborn-whitegrid', 'seaborn', 'Solarize_Light2', 'tableau-colorblind10', '_classic_test']
```

The outputs of each style sheet is shown in [matplotlib-style-sheets.ipynb](https://github.com/nmstreethran/coding/blob/master/matplotlib-style-sheets.ipynb).

## Datetime

[Python's `strftime` directives](http://strftime.org/)

## References

1. Save pandas dataframe plot as pdf: https://stackoverflow.com/a/35484725/4573584
1. Change plot area colour: https://stackoverflow.com/a/40371037/4573584
2. Change figure axes facecolour: https://stackoverflow.com/a/39176226/4573584 
2. Legend text colour: https://stackoverflow.com/a/47229840/4573584
2. Style sheets: https://matplotlib.org/users/style_sheets.html