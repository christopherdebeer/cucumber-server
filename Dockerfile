

FROM greglearns/ruby

MAINTAINER Christopher de Beer "christopherdebeer@gmail.com"

RUN gem install bundler
RUN gem install cucumber
RUN gem install sinatra

EXPOSE 4000

ADD . /src





