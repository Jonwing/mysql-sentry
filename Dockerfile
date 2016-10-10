FROM sentry:8.8

MAINTAINER lAzUr <jonwing.lee@gmail.com>

# Sane defaults for pip
ENV PIP_NO_CACHE_DIR off
ENV PIP_DISABLE_PIP_VERSION_CHECK on

RUN apt-get update && apt-get install -y --no-install-recommends libmysqlclient-dev
RUN pip install MySQL-python==1.2.5

COPY sentry.conf.py /etc/sentry/
COPY config.yml /etc/sentry/

COPY docker-entrypoint.sh /entrypoint.sh

EXPOSE 9000
VOLUME /var/lib/sentry/files

ENTRYPOINT ["/entrypoint.sh"]
CMD ["run", "web"]
