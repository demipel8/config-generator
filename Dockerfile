FROM ruby:2.4.2

ARG WORKDIR="/app"

WORKDIR $WORKDIR

COPY gems.rb $WORKDIR/gems.rb
COPY gems.locked $WORKDIR/gems.locked
RUN bundle install -j10

COPY . $WORKDIR/