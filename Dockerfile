FROM gcr.io/stacksmith-images/ubuntu:14.04-r05
MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_APP_NAME=memcached \
    BITNAMI_APP_USER=memcached \
    BITNAMI_APP_VERSION=1.4.25-0 \
    MEMCACHED_PACKAGE_SHA256="9b54fa1cc23ca2f732fdbea784f4c2e0fbf8841634af2007b4c458ede22e3b26"

ENV BITNAMI_APP_DIR=/opt/bitnami/$BITNAMI_APP_NAME \
    BITNAMI_APP_VOL_PREFIX=/bitnami/$BITNAMI_APP_NAME

ENV PATH=$BITNAMI_APP_DIR/bin:/opt/bitnami/common/bin:$PATH


RUN BASE_FUNCTIONS_PACKAGE_SHA256="ddd7aea91e039e07b571d5f4e589bedb5a1ae241e625f4a06a64a7ede439c7b8" bitnami-pkg install base-functions-1.0.0-1
RUN bitnami-pkg unpack $BITNAMI_APP_NAME-$BITNAMI_APP_VERSION

RUN mkdir -p $BITNAMI_APP_VOL_PREFIX && \
    ln -s $BITNAMI_APP_DIR/logs $BITNAMI_APP_VOL_PREFIX/logs

COPY rootfs/ /

EXPOSE 11211

ENTRYPOINT ["/app-entrypoint.sh"]
CMD ["harpoon", "start", "--foreground", "memcached"]
