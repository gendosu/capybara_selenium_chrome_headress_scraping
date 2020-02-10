# 本体
#
# VERSION               0.0.1

FROM gendosu/ruby-for-rails:ruby-2.6.2-node-12.1.0

ENV PATH "/products/node_modules/.bin:$PATH"

ADD . /app
WORKDIR /app

RUN apt-get update \
  &&  apt-get install -y --force-yes \
  yarn \
  cmake \
  gconf-service \
  glib-networking \
  fonts-liberation \
  libgtk-3-0 \
  libappindicator1 \
  libappindicator3-1 \
  chromium \
  firefox-esr \
  &&  apt-get clean \
  &&  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# RUN yarn

RUN bundle

RUN chmod a+x /app/entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
