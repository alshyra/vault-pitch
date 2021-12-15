#!/bin/bash

# This entrypoint convert pres.adoc into pres.html
# It clone locally the reveal.js project in order to have speaker notes working
# It watches file changes and reconvert the presentation on save using inotify
# Finally it starts a light http server using ruby and httpd

if [ ! -d slides/reveal.js ]; then
    git clone https://github.com/hakimel/reveal.js.git --branch=3.9.2 --depth 1
fi;

asciidoctor-revealjs pres.adoc
ruby -run -e httpd . -p 8080 &

while inotifywait -e close_write pres.adoc
do
    echo "file changed triggered"
    asciidoctor-revealjs pres.adoc
    kill -9 $(pidof ruby)
    ruby -run -e httpd . -p 8080 &
done
