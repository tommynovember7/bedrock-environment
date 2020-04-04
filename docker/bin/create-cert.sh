#!/bin/bash

mkcert \
-cert-file "$PROJECT_ROOT/docker/nginx/ssl/cert.pem" \
-key-file "$PROJECT_ROOT/docker/nginx/ssl/key.pem" \
wp.local wp.test wp.admin mailcatcher.local nginx mysql localhost 127.0.0.1 0.0.0.0