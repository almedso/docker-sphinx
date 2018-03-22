# Dockerfile for Creating Documentation with Sphinx

Supported output formats:

* html
* pdf

# Tool container capapbilities

##  Supported output

* html
* pdf

PDF is rendered via latex and some svg to pdf generation.
via provided conversoin makefile

## Content  sphinx Exetensions 

# Usage

## Build the container

```bash
$ docker build -t almedso/sphinx-doc-build .
```

## Build the documentation

The documentation source must be passed along to the container as mounted volume
to */documents*. It is recommended to run the container as your user in order
to assure the produced output located in this volume gets your ownership.

```bash
$ docker run --rm -it -v $PWD:/documents -u $UID sphinx-build
```

## Content and customization via conv.py

The following packages/extensions are available for sphinx: 

* sphinx.ext.todo
* sphinx.ext.coverage
* sphinx.ext.ifconfig
* sphinxcontrib.traceability
* sphinxcontrib.plantuml
* sphinxcontrib-sadisplay
* sphinxcontrib-actdiag
* sphinxcontrib-aafig


If needed the can be integratedin sphinx config file:

```python
extensions = [
    'sphinx.ext.todo',
    'sphinx.ext.coverage',
    'sphinx.ext.ifconfig',
    'sphinxcontrib.traceability',
    'sphinxcontrib.plantuml'.
    'sphinxcontrib-actdiag',
    'sphinxcontrib-aafig'
]

```


