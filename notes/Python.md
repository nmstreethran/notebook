## Getting started

- [Python For Beginners](https://www.python.org/about/gettingstarted/)
- [Python Editors](https://wiki.python.org/moin/PythonEditors)
- [Integrated Development Environments](https://wiki.python.org/moin/IntegratedDevelopmentEnvironments)

## Datetime

- [Python's `strftime` directives](https://strftime.org/)
- [`pandas.to_datetime`](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.to_datetime.html)

## PyLint

Unable to import error:

- edit `.pylintrc` to include path to module
- generate a `.pylintrc` file for the project: `pylint --generate-rcfile > path/to/project/.pylintrc`

```ini
[MAIN]

init-hook='import sys; sys.path.append("path/to/project/module")'
```

- <https://stackoverflow.com/a/3065082>
- <https://stackoverflow.com/a/52362063>

## [Getting a Python programme to do nothing when using statements](https://stackoverflow.com/a/19632742)

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
