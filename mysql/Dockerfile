FROM sameersbn/mysql:5.7.22-1

RUN set -ux \
    \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        tzdata \
    && rm -rf /var/lib/apt/lists/* \
    \
    && ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
