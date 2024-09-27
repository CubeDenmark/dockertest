# syntax=docker/dockerfile:1
FROM ubuntu:22.04

# install app dependencies
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip install flask==3.0.*

# install app
COPY hello.py /

# final configuration
ENV FLASK_APP=hello
EXPOSE 8000
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "8000"]

# Git repositories
# When you pass a URL pointing to the location of a Git repository as an argument to docker build, the builder uses the repository as the build context.

# The builder performs a shallow clone of the repository, downloading only the HEAD commit, not the entire history.

# The builder recursively clones the repository and any submodules it contains.


#  docker build https://github.com/user/myrepo.git


# URL fragments
# You can append URL fragments to the Git repository address to make the builder clone a specific branch, tag, and subdirectory of a repository.

# The format of the URL fragment is #ref:dir, where:

# ref is the name of the branch, tag, or commit hash
# dir is a subdirectory inside the repository
# For example, the following command uses the container branch, and the docker subdirectory in that branch, as the build context:


#  docker build https://github.com/user/myrepo.git#container:docker

# docker build -t test_github:v1.0 https://github.com/CubeDenmark/dockertest.git

# /  The following works:
# docker build github.com/docker/buildx#d4f088e689b41353d74f1a0bfcd6d7c0b213aed2
# X The following doesn't work because the commit hash is truncated:
# docker build github.com/docker/buildx#d4f088e