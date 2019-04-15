#%% [markdown]
# # [Customising matplotlib plots with style sheets](https://matplotlib.org/users/style_sheets.html)

#%% [markdown]
# To get the list all available styles:

# ```python
# print(plt.style.available)
# ```

#%%
# import packages
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

#%%
# data for plot
ts=pd.Series(np.random.randn(1000),
                index=pd.date_range('1/1/2000',periods=1000))
ts=ts.cumsum()
df=pd.DataFrame(np.random.randn(1000,4),index=ts.index,
                    columns=['A','B','C','D'])
df=df.cumsum()

#%%
# bmh
plt.style.use(['bmh'])
plt.figure()
df.plot()
plt.legend(loc='best')

#%%
# classic
plt.style.use(['classic'])
plt.figure()
df.plot()
plt.legend(loc='best')

#%%
# dark_background
plt.style.use(['dark_background'])
plt.figure()
df.plot()
plt.legend(loc='best')

#%%
# fast
plt.style.use(['fast'])
plt.figure()
df.plot()
plt.legend(loc='best')

#%%
# fivethirtyeight
plt.style.use(['fivethirtyeight'])
plt.figure()
df.plot()
plt.legend(loc='best')

#%%
# ggplot
plt.style.use(['ggplot'])
plt.figure()
df.plot()
plt.legend(loc='best')

#%%
# grayscale
plt.style.use(['grayscale'])
plt.figure()
df.plot()
plt.legend(loc='best')

#%%
# seaborn-bright
plt.style.use(['seaborn-bright'])
plt.figure()
df.plot()
plt.legend(loc='best')

#%%
# seaborn-colorblind
plt.style.use(['seaborn-colorblind'])
plt.figure()
df.plot()
plt.legend(loc='best')

#%%
# seaborn-dark-palette
plt.style.use(['seaborn-dark-palette'])
plt.figure()
df.plot()
plt.legend(loc='best')

#%%
# seaborn-dark
plt.style.use(['seaborn-dark'])
plt.figure()
df.plot()
plt.legend(loc='best')

#%%
# seaborn-darkgrid
plt.style.use(['seaborn-darkgrid'])
plt.figure()
df.plot()
plt.legend(loc='best')

#%%
# seaborn-deep
plt.style.use(['seaborn-deep'])
plt.figure()
df.plot()
plt.legend(loc='best')

#%%
# seaborn-muted
plt.style.use(['seaborn-muted'])
plt.figure()
df.plot()
plt.legend(loc='best')

#%%
# seaborn-notebook
plt.style.use(['seaborn-notebook'])
plt.figure()
df.plot()
plt.legend(loc='best')

#%%
# seaborn-paper
plt.style.use(['seaborn-paper'])
plt.figure()
df.plot()
plt.legend(loc='best')

#%%
# seaborn-pastel
plt.style.use(['seaborn-pastel'])
plt.figure()
df.plot()
plt.legend(loc='best')

#%%
# seaborn-poster
plt.style.use(['seaborn-poster'])
plt.figure()
df.plot()
plt.legend(loc='best')

#%%
# seaborn-talk
plt.style.use(['seaborn-talk'])
plt.figure()
df.plot()
plt.legend(loc='best')

#%%
# seaborn-ticks
plt.style.use(['seaborn-ticks'])
plt.figure()
df.plot()
plt.legend(loc='best')

#%%
# seaborn-white
plt.style.use(['seaborn-white'])
plt.figure()
df.plot()
plt.legend(loc='best')

#%%
# seaborn-whitegrid
plt.style.use(['seaborn-whitegrid'])
plt.figure()
df.plot()
plt.legend(loc='best')

#%%
# seaborn
plt.style.use(['seaborn'])
plt.figure()
df.plot()
plt.legend(loc='best')

#%%
# Solarize_Light2
plt.style.use(['Solarize_Light2'])
plt.figure()
df.plot()
plt.legend(loc='best')

#%%
# tableau-colorblind10
plt.style.use(['tableau-colorblind10'])
plt.figure()
df.plot()
plt.legend(loc='best')

#%%
# _classic_test
plt.style.use(['_classic_test'])
plt.figure()
df.plot()
plt.legend(loc='best')