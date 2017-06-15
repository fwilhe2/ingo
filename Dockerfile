FROM ruby:2.3

COPY bin/ bin/
COPY lib/ lib/
COPY Gemfile .
COPY ingo.gemspec .
COPY Rakefile .
COPY VERSION .
COPY CHANGELOG.adoc .
COPY README.adoc .
COPY LICENSE .

COPY test/fixtures/ fixtures/

RUN bundle install
RUN bundle exec rake install

CMD ["ingo", "/fixtures"]
