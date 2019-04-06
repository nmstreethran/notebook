# Python notes

## Matplotlib

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

## References

1. Save pandas dataframe plot as pdf: https://stackoverflow.com/a/35484725/4573584
1. Change plot area colour: https://stackoverflow.com/a/40371037/4573584
2. Change figure axes facecolour: https://stackoverflow.com/a/39176226/4573584 
2. Legend text colour: https://stackoverflow.com/a/47229840/4573584
2. Style sheets: https://matplotlib.org/users/style_sheets.html