# docker-python-redshift-connector

Contains a barebones install of Python 3 (on Alpine) with psycopg2, enabling quick connectivity to Redshift.  Psycopg2 is not the easiest thing to install correctly on most machines and requires quite a few dependencies.  This image provides a quick way to establish a connection to check a first-pass of a script or to serve as a base for more complete containerized applications.

## To Use

### Pull Pre-built Image from Dockerhub

This image is already built on Dockerhub.  Alter the `example.py` script in this directory, providing all parameters, or exporting the following as environment variables:

- `DBHOST`
- `DBUSER`
- `DBPASS`
- `DBNAME`

Only exporting the `DBPASS` value (and modifying the other values in the script), an invocation would look like:

```bash
$ export DBPASS=...
$ docker run -e DBPASS=$DBPASS -v $(pwd):/app docker.io/geekmuse/python-redshift-connector:0.0.1 example.py
```

This should connect to your cluster, assuming your local machine has a valid network path to your cluster.

Docker tags follow version tags on this repository.

### Build Your Own

With a GNU-compatible `make` installed:

Alter variable values as appropriate at the head of the `Makefile`, and:

```bash
$ make build
```

How you call the image from a `docker run` will depend on what you set the `IMAGE_NAME` value to in the Makefile.
