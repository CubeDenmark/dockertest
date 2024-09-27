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

# You can create a tarball of the directory and pipe it to the build for use as a context:


#     tar czf foo.tar.gz *
#     docker build - < foo.tar.gz


# The build resolves the Dockerfile from the tarball context. 
# You can use the --file flag to specify the name and location of 
# the Dockerfile relative to the root of the tarball. The following 
# command builds using test.Dockerfile in the tarball:


#     docker build --file test.Dockerfile - < foo.tar.gz