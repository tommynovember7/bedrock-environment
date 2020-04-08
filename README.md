# Bedrock Environment

Docker settings for [Bedrock](https://github.com/roots/bedrock) projects

## Getting Started

### Clone the project

You might want to create the project directory prior to cloning the project.

```bash
$ cd %PROJECT-DIRECTORY%
$ git clone git@github.com:tommynovember7/bedrock-environment.git .
```

### Setup configurations

You can use the setup script. It is trying to create SSL certifications 
using [mkcert](https://github.com/FiloSottile/mkcert), so you might want to 
install it before running the script. Please check its [official repository](https://github.com/FiloSottile/mkcert) 
for further information.

```bash
brew install mkcert
brew install nss # if you use Firefox 
```

The setup script can takes two arguments:

- Git Repository Path 
- Site Name (optional)

```bash
./docker/bin/project-init.sh git@github.com:***/***.git %SITE_NAME%
```

The source code from the Git repository will clone into `project` directory.

If you don't give a site name to the project, it takes `wp` as default.
The site name will be used as a part of the site URL. 

### Prepare environment variables

The `docker/.bashrc` file contains all the required environment variables.
I strongly recommend to edit it as you like before running the containers. 

```bash
source docker/.bashrc
```

### Build docker containers

```bash
docker-compose build --force-rm --pull
docker-compose up --no-start
```

### Install PHP dependencies

```bash
composer install
```

### Edit hosts

If you want to use a local site name with SSL, you should add the following 
line into the `/etc/hosts`:

```text
0.0.0.0 wp.local
```

### Start containers

```bash
docker-compose up --detach --force-recreate --remove-orphans
```

After finishing all steps for setting up, you will be able to access Wordpress 
from the following URL:

https://wp.local/wp-admin/

### Stop containers

```bash
docker-compose stop
```