# Python notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->

- [Getting started](#getting-started)
- [Datetime](#datetime)
- [Getting a Python programme to do nothing when using statements](#getting-a-python-programme-to-do-nothing-when-using-statements)
- [Importing variables from one script to another](#importing-variables-from-one-script-to-another)
- [Loading JSON from URL](#loading-json-from-url)
- [Pandas](#pandas)
- [Jupyter](#jupyter)
- [Matplotlib](#matplotlib)
  - [Customising facecolours](#customising-facecolours)
  - [Customising plots with style sheets](#customising-plots-with-style-sheets)
  - [Colormaps](#colormaps)
  - [Fonts](#fonts)
- [Bokeh](#bokeh)
  - [TypeError: Object of type Polygon is not JSON serializable](#typeerror-object-of-type-polygon-is-not-json-serializable)
- [GeoPandas](#geopandas)
  - [Changing legend position in GeoPandas plot](#changing-legend-position-in-geopandas-plot)
  - [Concatenation of GeoDataFrames](#concatenation-of-geodataframes)
  - [Merging polygons](#merging-polygons)
- [Sphinx](#sphinx)
  - [Read the Docs not recognising theme](#read-the-docs-not-recognising-theme)

## Getting started

- [Python For Beginners](https://www.python.org/about/gettingstarted/)
- [Python Editors](https://wiki.python.org/moin/PythonEditors)
- [Integrated Development Environments](https://wiki.python.org/moin/IntegratedDevelopmentEnvironments)

## Datetime

- [Python's `strftime` directives](https://strftime.org/)
- [`pandas.to_datetime`](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.to_datetime.html)

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

## [Importing variables from one script to another](https://stackoverflow.com/a/19289230/4573584)

```sh
from script1 import x
```

## [Loading JSON from URL](https://stackoverflow.com/a/12965254/4573584)

```sh
import urllib.request, json
# define URL
URL = 'https://stackoverflow.com'
with urllib.request.urlopen(URL) as url:
    data = json.loads(url.read().decode())
    print(data)
```

## [Pandas](https://pandas.pydata.org/pandas-docs/stable/)

[Drop a row / column](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.drop.html):

```py
df.drop(['B', 'C'], axis=1) # drop columns
df.drop(columns=['B', 'C']) # drop columns (alternative)
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
# extract first section; remove opening parenthesis
df['Model'] = [x.split(',')[0].replace('(', '') for x in df['Raw']]
# extract second section; remove closing parenthesis
df['Region'] = [x.split(',')[1].replace(')', '') for x in df['Raw']]

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

[UnicodeDecodeError](https://stackoverflow.com/a/18172249/4573584)

> `read_csv` takes an encoding option to deal with files in different formats.
>
> To detect the encoding (assuming the file contains non-ASCII characters), [you can use `enca`](https://linux.die.net/man/1/enconv) or [`file -i` (Linux)](https://linux.die.net/man/1/file).

Use `ISO-8859-1` or `utf-8` for reading the CSV file, and `utf-8` for writing CSV files. Aliases can be used, e.g. `latin` instead of `ISO-8859-1`.

Resources on encoding:

- <https://www.joelonsoftware.com/2003/10/08/the-absolute-minimum-every-software-developer-absolutely-positively-must-know-about-unicode-and-character-sets-no-excuses/>
- <https://docs.python.org/3/library/codecs.html#standard-encodings>

## Jupyter

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

See the style sheets reference at <https://matplotlib.org/gallery/style_sheets/style_sheets_reference.html>.

### Colormaps

<https://matplotlib.org/tutorials/colors/colormaps.html>

### [Fonts](https://matplotlib.org/tutorials/text/text_props.html#default-font)

Fonts can be assigned like this:

```py
matplotlib.rcParams['font.sans-serif'] = ['Lato', 'sans-serif']
```

`'font.family'` options are `{'cursive', 'fantasy', 'monospace', 'sans', 'sans serif', 'sans-serif', 'serif'}`.

## Bokeh

### [TypeError: Object of type Polygon is not JSON serializable](https://github.com/bokeh/bokeh/issues/8423#issuecomment-553079591)

> For anyone from the internet who might stumble across this issue, if your source data contains a column of geometry objects from a library such as shapely, Bokeh will not know how to package the data to JSON so that it can send it to the JavaScript rendering system.
>
> The solution that I used was to drop the column containing the polygon data from the dataframe when creating the `ColumnDataSource` object, like so:
>
> ```py
> cds = ColumnDataSource(df.drop(columns=['geometry']))
> ```
>
> Then, when creating your figure, you can include this as the `source` without issue.

## GeoPandas

### [Changing legend position in GeoPandas plot](https://stackoverflow.com/q/39816790/4573584)

```py
# named positions
df.plot(column='values', legend=True, legend_kwds={'loc': 'lower right'})
# custom positions
df.plot(column='values', legend=True, legend_kwds={
    'bbox_to_anchor': (0., 0., 0.2, 0.2)})
```

### [Concatenation of GeoDataFrames](https://gis.stackexchange.com/a/162661/157288)

```py
# use crs to ensure it is preserved
rdf = gpd.GeoDataFrame(
    pd.concat(dataframesList, ignore_index=True),
    crs=dataframesList[0].crs)
```

### Merging polygons

Use `dissolve`:

```py
df = df.dissolve(by='column')
```

Source:

- <https://stackoverflow.com/a/47225799/4573584>
- <https://geopandas.org/aggregation_with_dissolve.html>

## Sphinx

### [Read the Docs not recognising theme](https://github.com/pandas-dev/pydata-sphinx-theme/issues/196)

Add a `requirements.txt` file to `docs` (the same directory as `conf.py`) and add the theme to the list of requirements. Then, add the following configuration to `.readthedocs.yml`:

```yml
# Optionally set the version of Python and requirements required to build your docs
python:
  install:
    - requirements: docs/requirements.txt
```
