# Basic Commafeed Dockerfile.
# Uses a pre-built binary so that it doesn't have to download 800mb of dev tools.
# Requires config.yml to be present in the volume mapping for /var/lib/commafeed.
# It will also store the database commafeed.mv.db in this location.

FROM phusion/baseimage:0.9.15
ENV HOME /root
CMD ["/sbin/my_init"]

RUN apt-get update && \
    apt-get install -y openjdk-7-jre && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8083
EXPOSE 8084

RUN mkdir /var/lib/commafeed
RUN mkdir /var/log/commafeed
RUN mkdir /var/tmp/commafeed

COPY commafeed.jar /var/lib/commafeed/

VOLUME /var/lib/commafeed/data
WORKDIR /var/tmp/commafeed
ENTRYPOINT java -jar /var/lib/commafeed/commafeed.jar server /var/lib/commafeed/data/config.yml

