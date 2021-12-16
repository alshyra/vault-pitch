FROM asciidoctor/docker-asciidoctor
RUN gem install webrick
COPY ./entrypoint.sh /entrypoint
ENTRYPOINT ["/entrypoint"]
