FROM gcr.io/stacksmith-images/ubuntu:14.04-r05
MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_APP_NAME=memcached \
    BITNAMI_APP_VERSION=1.4.25-0 \
    BITNAMI_APP_CHECKSUM=9b54fa1cc23ca2f732fdbea784f4c2e0fbf8841634af2007b4c458ede22e3b26 \
    BITNAMI_APP_USER=memcached

# Install supporting modules
RUN bitnami-pkg install base-functions-1.0.0-1 --checksum ddd7aea91e039e07b571d5f4e589bedb5a1ae241e625f4a06a64a7ede439c7b8

# Install application
RUN bitnami-pkg unpack $BITNAMI_APP_NAME-$BITNAMI_APP_VERSION --checksum $BITNAMI_APP_CHECKSUM
ENV PATH=/opt/bitnami/$BITNAMI_APP_NAME/sbin:/opt/bitnami/$BITNAMI_APP_NAME/bin:$PATH

# Setting entry point
COPY rootfs/ /
ENTRYPOINT ["/app-entrypoint.sh"]
CMD ["harpoon", "start", "--foreground", "memcached"]

# Exposing ports
EXPOSE 11211
