# Docker sphinx-autobuild

This is the repo of the Docker image for [sphinx-autobuild](https://hub.docker.com/r/staker4/sphinx-autobuild/).

# How to use this image

## Build & serve html

```bash
$ docker run -d -v /path/to/sphinx-doc:/sphinx-doc -p 8000:8000 staker4/sphinx-autobuild
```

This image uses [sphinx-autobuild](https://github.com/GaretJax/sphinx-autobuild) as default COMMAND which builds and serves the documentation at [http://localhost:8000](http://localhost:8000).

### Documentation location

You must specify the location to your local sphinx-doc by mounting the **sphinx-doc** VOLUME.

```bash
-v /path/to/sphinx-doc:/sphinx-doc
```

### Served port

You must specify your localhost-port to map to container-port 8000 and on which the documentation shall be served.

```bash
-p <localhost port>:8000
```

## Build html

```bash
$ docker run -v /path/to/sphinx-doc:/sphinx-doc staker4/sphinx-autobuild make html
```

You must overwrite the default COMMAND with **make html**. We can also remove the port mapping option **-p 8000:8000** since we dont serve the documentation.
