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