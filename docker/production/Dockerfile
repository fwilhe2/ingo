FROM ruby:2.6-alpine
LABEL maintainer="Florian Wilhelm"

RUN gem install asciidoctor ingo

WORKDIR /documents
VOLUME /documents

CMD ["/bin/bash"]
