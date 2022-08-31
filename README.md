# linux-ubuntu-image

This repository will house a useful Ubuntu image.  It will not actually hold the image but will have a Dockerfile that can be used by Docker to create the image.

username: admin
password: password

After cloning this repo and setting it as your current working directory, run the following lines in Command Prompt or Shell with administrator privileges.

# Build the image based on the Dockerfile in the current context.
docker build -t ubuntu .

# Run a container using the image you just built.
# Setup the container so that data in the user's 
# home directory (/home/admin) is persisted
# in a named volume (my-ubuntu-volume-data-store).
# The command option --tty allocates a a pseudo-TTY
# in the container. For more info see [link](https://qr.ae/pvgrUe).
# 

docker run -v my-ubuntu-volume-data-store:/home/admin -i --tty ubuntu