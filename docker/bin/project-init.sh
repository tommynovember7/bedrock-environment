#!/bin/bash

if [[ -z "$1" ]]; then
  printf "Please specify at least a project repository, for example: \n\n  $ $0 git@github.com:foo/bar.git\n\n"
  exit 1
fi
if [[ -z "$2" ]]; then
  SITE_NAME="wp"
else
  SITE_NAME="$2"
fi
if [[ -z "$3" ]]; then
  ACF_PRO_KEY=""
else
    ACF_PRO_KEY=\'"$3"\'
fi
create_cert () {
  mkcert -cert-file docker/nginx/ssl/cert.pem -key-file docker/nginx/ssl/key.pem \
  "$1.local" mailcatcher.local nginx mysql localhost 127.0.0.1 0.0.0.0
}

create_cert ${SITE_NAME} && \
printf "\nCreating 'project.conf' into docker/nginx/: \n\n" && \
sed "s/wp\.local/${SITE_NAME}.local/g" docker/nginx/project.conf.dist | tee docker/nginx/project.conf | grep -n "${SITE_NAME}" && \
printf "\nCreating '.bashrc' into docker/: \n" && \
cat docker/.bashrc.dist > docker/.bashrc && \
printf "\nCreating '.env' into docker/: \n\n" && \
sed "s/ACF_PRO_KEY=/ACF_PRO_KEY=${ACF_PRO_KEY}/g" docker/.env.dist | \
sed "s/wp\.local/${SITE_NAME}.local/g" | \
sed "s/wp\.admin/${SITE_NAME}.admin/g" | tee docker/.env | grep -n "${SITE_NAME}" && \
cat docker/.env | grep -n ACF_PRO_KEY && \
printf "\nCreating 'docker-compose.yaml' \n\n" && \
sed "s/wp-/${SITE_NAME}-/g" docker-compose.yaml.dist | tee docker-compose.yaml | grep -n "${SITE_NAME}" && \
git clone --recurse-submodules $1 project && \
ls -la