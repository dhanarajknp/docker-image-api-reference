FROM grahamdumpleton/mod-wsgi-docker:python-3.5-onbuild

RUN apt-get update
RUN apt-get -y install unzip

WORKDIR /app
RUN curl -LO https://github.com/zimeon/iiif/archive/master.zip
RUN unzip master
RUN mv iiif-master iiif

WORKDIR /app/iiif/testimages
RUN rm -rf *
ADD images/* /app/iiif/testimages/

CMD [ "iiif/iiif_testserver.wsgi" ]