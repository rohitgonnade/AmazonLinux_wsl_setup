FROM amazonlinux:2023

LABEL maintainer="rohit_gonnade@live.in"

# # ==============================================
RUN \
    #development tools
    dnf groupinstall -y development && \
    dnf install -y wget git cmake git-lfs python && \
    #Editor
    dnf install vi -y && \
    #Needed to change name in ELF on changing shared library name
    dnf install patchelf -y
