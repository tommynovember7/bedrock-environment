FROM node:12-alpine

RUN apk --no-cache add \
    'autoconf>=2.69-r2' \
    'automake>=1.16.1-r0' \
    'build-base>=0.5-r1' \
    'curl>=7.67.0-r0' \
    'g++>=9.2.0-r3' \
    'gcc>=9.2.0-r3' \
    'git>=2.24.1-r0' \
    'groff>=1.22.4-r0' \
    'lcms2-dev>=2.9-r1' \
    'less>=551-r0' \
    'libgit2-dev>=0.28.4-r0' \
    'libjpeg>=8-r6' \
    'libpng-dev>=1.6.37-r1' \
    'libtool>=2.4.6-r7' \
    'make>=4.2.1-r2' \
    'nasm>=2.14.02-r0' \
    'zlib-dev>=1.2.11-r3'

RUN npm install -g \
    node-gyp \
    nodemon \
    npm@latest \
    pm2 \
    typescript
