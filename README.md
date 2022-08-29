# linux-ubuntu-image

This repository will house a useful Ubuntu image.  It will not actually hold the image but will have a Dockerfile that can be used by Docker to create the image.

username: admin
password: password

After cloning this repo and setting it as your current working directory, run the following lines in Command Prompt or Shell with administrator privileges.

docker build -t ubuntu .
docker run -it ubuntu