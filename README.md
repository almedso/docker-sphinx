# Dockerfile for Creating Documentation with Sphinx

Supported output formats:

* html
* pdf

# Usage

## Build the container

```bash
$ docker build -t sphinx-build .
```

## Build the documentation

The documentation source must be passed along to the container as mounted volume
to */documents*. It is recommended to run the container as your user in order
to assure the produced output located in this volume gets your ownership.

```bash
$ docker run --rm -it -v $PWD:/documents -u $UID sphinx-build
```
