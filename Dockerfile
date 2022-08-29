# syntax=docker/dockerfile:1
FROM ubuntu:latest
RUN yes | unminimize
RUN useradd --no-log-init --create-home --shell /bin/bash admin
RUN echo 'admin:password' | chpasswd