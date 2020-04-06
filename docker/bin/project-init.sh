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
create_cert () {
  mkcert -cert-file docker/nginx/ssl/cert.pem -key-file docker/nginx/ssl/key.pem \
  "$1.local" "$1.admin" mailcatcher.local nginx mysql localhost 127.0.0.1 0.0.0.0
}

create_cert ${SITE_NAME} && \
printf "\nCreating 'project.conf' into docker/nginx/: \n\n" && \
sed "s/wp\.local/${SITE_NAME}.local/g" docker/nginx/project.conf.dist | \
sed "s/wp\.admin/${SITE_NAME}.admin/g" | tee docker/nginx/project.conf | grep -n "${SITE_NAME}" && \
printf "\nCreating '.bashrc' into docker/: \n\n" && \
sed "s/wp\.local/${SITE_NAME}.local/g" docker/.bashrc.dist | \
sed "s/wp\.admin/${SITE_NAME}.admin/g" | tee docker/.bashrc | grep -n "${SITE_NAME}" && \
printf "\nCreating 'docker-compose.yaml' \n\n" && \
sed "s/wp-/${SITE_NAME}-/g" docker-compose.yaml.dist | tee docker-compose.yaml | grep -n "${SITE_NAME}" && \
rm project/.gitignore && \
git clone $1 project && \
git update-index --skip-worktree project/.gitignore && \
ls -la