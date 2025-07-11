ARG NODE_VERSION=10.15.1
FROM node:${NODE_VERSION}

# Home directory for Node-RED application source code.
RUN mkdir -p /usr/src/node-red

# User data directory, contains flows, config and nodes.
RUN mkdir /exentriq
RUN mkdir /exentriq/prod
RUN mkdir /exentriq/stage
RUN mkdir /exentriq/sec_prod

# package.json contains Node-RED NPM module and node dependencies
COPY src/package.json /usr/src/node-red/
COPY src/stage/settings.js /exentriq/stage/
COPY src/stage/exentriq-authentication /exentriq/stage/exentriq-authentication
COPY src/prod/settings.js /exentriq/prod/
COPY src/prod/exentriq-authentication /exentriq/prod/exentriq-authentication
COPY src/sec_prod/settings.js /exentriq/sec_prod/
COPY src/sec_prod/exentriq-authentication /exentriq/sec_prod/exentriq-authentication

# Add node-red user so we aren't running as root.
RUN useradd --home-dir /usr/src/node-red --no-create-home node-red \
    && chown -R node-red:node-red /exentriq \
    && chown -R node-red:node-red /usr/src/node-red

# RUN npm install -g when
# RUN npm install -g rest

# Dependencies for node node-red-contrib-html-to-pdf
COPY src/sources.list /etc/apt/sources.list
RUN apt-get -y update
## && apt-get install -y libnss3 libnspr4 libatk1.0-0 libatk-bridge2.0-0 libdrm2 libxkbcommon0 libgbm1 libasound2 libatspi2.0-0
RUN apt-get install -y --allow-unauthenticated libnss3
RUN apt-get install -y --allow-unauthenticated libnspr4
RUN apt-get install -y --allow-unauthenticated libatk1.0-0
RUN apt-get install -y --allow-unauthenticated libatk-bridge2.0-0
RUN apt-get install -y --allow-unauthenticated libdrm2
RUN apt-get install -y --allow-unauthenticated libxkbcommon0
RUN apt-get install -y --allow-unauthenticated libgbm1
RUN apt-get install -y --allow-unauthenticated libasound2
RUN apt-get install -y --allow-unauthenticated libatspi2.0-0

USER node-red

WORKDIR /exentriq/stage/exentriq-authentication
RUN npm install

WORKDIR /exentriq/prod/exentriq-authentication
RUN npm install

WORKDIR /usr/src/node-red
RUN npm install

RUN git clone https://github.com/ExentriqLtd/Exentriq-GAIA.node-red2.git node-red-gaia
WORKDIR /usr/src/node-red/node-red-gaia
RUN npm install
RUN npm run build
RUN cp -r packages/node_modules/* /usr/src/node-red/node_modules/

WORKDIR /usr/src/node-red


# User configuration directory volume
EXPOSE 1880

# Environment variable holding file path for flows configuration
ENV FLOWS=flows.json
ENV DEST=stage
ENV NODE_PATH=/usr/src/node-red/node_modules:/data/node_modules

CMD ["npm", "start", "--", "--userDir", "/data"]
