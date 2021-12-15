#!/bin/bash

# This entrypoint convert pres.adoc into pres.html
# It clone locally the reveal.js project in order to have speaker notes working
# Finally it starts a light http server using ruby and httpd

asciidoctor-revealjs pres.adoc

if [ ! -d slides/reveal.js ]; then
    git clone https://github.com/hakimel/reveal.js.git --branch=3.9.2 --depth 1
fi;

ruby -run -e httpd . -p 8080
