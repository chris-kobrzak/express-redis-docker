FROM node:10

ENV \
  NPM_LIB_DIR=/usr/local/lib/my-app \
  WEB_ROOT=/srv/my-app

RUN \
  mkdir -p $NPM_LIB_DIR && \
  mkdir -p $WEB_ROOT

ADD package.json $NPM_LIB_DIR/

RUN \
  cd $NPM_LIB_DIR && \
  npm install --no-progress

RUN \
  ln -s $NPM_LIB_DIR/node_modules $WEB_ROOT/node_modules

ADD . $WEB_ROOT/

RUN \
  cd $WEB_ROOT

WORKDIR $WEB_ROOT

EXPOSE 3000

CMD ["npm", "start"]
