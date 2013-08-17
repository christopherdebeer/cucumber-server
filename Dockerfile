

FROM greglearns/ruby

MAINTAINER Christopher de Beer "christopherdebeer@gmail.com"

RUN gem install bundler
RUN bundle install

EXPOSE 4000

ADD . /src





