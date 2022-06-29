FROM fluent/fluentd:v1.14.6-1.1

# Use root account to use apk
USER root

RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev \
 && apk add --no-cache geoip geoip-dev libmaxminddb automake autoconf libtool libc6-compat \
 && sudo gem install fluent-plugin-grafana-loki fluent-plugin-rewrite-tag-filter fluent-plugin-geoip  \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

USER fluent
