# linux-ubuntu-image

This repository holds the code needed to create a useful Ubuntu image using Docker.  Containers built using this image will have the following default user account:

```
username: admin
password: password
```

If you have not downloaded [Docker Desktop](https://www.docker.com/products/docker-desktop/), then do so now.  After cloning this repo and setting it as your current working directory, run the following lines in Command Prompt or Shell with administrator privileges.

Build an image named ubuntu based on the Dockerfile.
```
docker build -t ubuntu ./dockerfile-context
```

Run a container using the image you just built.  Setup the container so that data in the container's directory (/home/admin) is persisted in a named volume (my-ubuntu-volume-data-store) on the host.  Note that the command option --interactive keeps STDIN open.
The command option --tty allocates a a pseudo-TTY in the container. For more info see [link](https://qr.ae/pvgrUe) and [link](https://stackoverflow.com/a/59934555).

```
docker run -v my-ubuntu-volume-data-store:/home/admin --interactive --tty ubuntu
```

The docker [cp command](https://docs.docker.com/engine/reference/commandline/cp/) is useful for copying files/folders between a container and the local filesystem.
