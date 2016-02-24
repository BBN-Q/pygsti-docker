# pyGSTi Docker 

This is a Dockerfile that creates an docker image with a full suite of Python
libraries needed for scientific computing (including Jupyter notebooks), and
also install pyGSTi.

To access the notebooks, simply run

```bash
docker build -t pygsti .
docker run -d -p 8888:8888 pygsti
```

and point your browser to `http://localhost:8888`.

Whenever the docker image is killed, all the state is lost -- this is
an effemeral image. In order to store data permanently, one must
create a data container. This can be done via

```bash
docker create -v /home/jovyan/work/gst-data --name gst-data pygsti /bin/true
```

where `jovyan` is the default user in the pygsti docker image. Once can copy
local data into the data container via

```bash
docker cp foo.txt gst-data:/home/jovyan/work/gst-data/foo.txt
```

and run the pygsti container with the data container mounted via

```bash
docker run -d -p 8888:8888 --volumes-from gst-data pygsti
```