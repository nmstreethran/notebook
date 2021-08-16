# Python notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->

- [Getting started](#getting-started)
- [Datetime](#datetime)
- [Getting a Python programme to do nothing when using statements](#getting-a-python-programme-to-do-nothing-when-using-statements)

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
