# Borrowed from Art-Rents Client project
#  ref: https://mherman.org/blog/dockerizing-a-react-app/

# pull official base image
# https://hub.docker.com/_/node
FROM node:16.8.0-alpine3.11

# set working directory
WORKDIR /usr/src/app

# install app dependencies
COPY package.json ./
COPY package-lock.json ./

# Add Python per https://github.com/nodejs/docker-node/issues/384
# https://github.com/nodejs/docker-node/issues/282
# --no-cache: download package index on-the-fly, no need to cleanup afterwards
# --virtual: bundle packages, remove whole bundle at once, when done
RUN apk add --no-cache --virtual build-dependencies \
    python2 \
    python3 \
    make \
    g++ \
    && npm install \
    && apk del build-dependencies

# add `/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# add app
COPY . ./

# start app
CMD ["npm", "start"]
