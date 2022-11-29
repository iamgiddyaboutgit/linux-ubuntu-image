# linux-ubuntu-image

This repository holds the code needed to create useful Ubuntu images using Docker.  Containers built using these images will have the following default user account:

```
username: admin
password: password
```

If you have not downloaded [Docker Desktop](https://www.docker.com/products/docker-desktop/), then do so now.  After cloning this repo and setting it as your current working directory, run the following lines in a terminal.

Build an image named snp-calling based on your chosen Dockerfile. Update this to reflect your Dockerfile location.
```
docker build -t snp-calling --no-cache . -f "C:\Users\...\Dockerfile"
```

Run a container using the image you just built.  Setup the container so that data in the container's directory (/home/admin) is persisted in a named volume (my-ubuntu-volume-data-store) on the host.  Note that the command option --interactive keeps STDIN open.  The command option --tty allocates a a pseudo-TTY in the container. For more info see [link](https://qr.ae/pvgrUe) and [link](https://stackoverflow.com/a/59934555).  The command option --env-file allows a file of environment variables to be read in.

```
docker run --mount 'type=volume,source=my-ubuntu-volume-data-store,destination=/home/admin' --interactive --tty --env-file=./.env ubuntu
```

The docker [cp command](https://docs.docker.com/engine/reference/commandline/cp/) is useful for copying files/folders between a container and the local filesystem.  

Copy a local file into container:

```
docker cp ./some_file CONTAINER:/work
```

Copy files from container to local path:

```
docker cp CONTAINER:/var/logs/ /tmp/app_logs
```

After copying something, you can run the following to get the permissions working.  

```
docker exec --user root --interactive --tty [container_name] chown --recursive admin: /home/admin/data
```

You can also enter a container as root if necessary:

```
docker run --mount 'type=volume,source=my-ubuntu-volume-data-store,destination=/home/admin' --user root --interactive --tty --env-file=./.env ubuntu
```

It is also possible to restart a stopped container using a command like so:

```
docker start [container name]
docker exec --interactive --tty [container_name] /bin/bash
```