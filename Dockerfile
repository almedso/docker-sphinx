FROM  ubuntu:latest

# Usage:
# docker run -it -v <your directory>:/documents/


ENV DEBIAN_FRONTEND noninteractive

# Update apt-get sources AND install stuff
RUN apt-get update && apt-get install -y -q python-sphinx \
                                            python-pip \
                                            inkscape \
                                            texlive \
                                            texlive-latex-extra \
                                            texlive-lang-german \
                                            pandoc \
                                            build-essential \
                                            plantuml


RUN mkdir -p /documents
COPY requirements.txt /documents

WORKDIR /documents
RUN pip install -r requirements.txt
COPY . /documents

VOLUME /documents

# provide the build command explicitely
COPY build-doc.sh /
COPY svg-to-pdf.mk /
CMD /build-doc.sh
