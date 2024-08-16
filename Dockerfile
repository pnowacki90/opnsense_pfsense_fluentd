FROM fluent/fluentd:edge

# Use root account to use apk
USER root

RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev \
 && apk add --no-cache geoip geoip-dev libmaxminddb automake autoconf libtool libc6-compat \
 && sudo gem install fluent-plugin-grafana-loki fluent-plugin-rewrite-tag-filter fluent-plugin-geoip fluent-plugin-record-modifier  \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

USER fluent