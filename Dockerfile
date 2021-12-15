FROM asciidoctor/docker-asciidoctor
RUN gem install webrick && apk add nodejs
COPY ./entrypoint.sh /entrypoint
ENTRYPOINT ["/entrypoint"]
