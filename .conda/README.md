# Conda environments

Install [Miniconda](https://docs.conda.io/en/latest/miniconda.html). On Manjaro, it can be installed using AUR:

```sh
pamac build miniconda3
```

To create a new Conda environment using a YAML file:

```sh
conda env create --file environment.yml
```
