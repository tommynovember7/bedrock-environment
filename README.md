# Bedrock Environment

Docker settings for Wordpress projects

## Getting Started

### Clone the project

You might want to create the project directory prior to cloning the project.

```bash
$ cd **PROJECT-DIRECTORY**
$ git clone git@github.com:tommynovember7/bedrock-environment.git .
```

### Setup configurations

You can use the setup script. It takes two arguments:

- GitHub Repository Path 
- Site Name (optional)

```bash
./docker/bin/project-init.sh git@github.com:***/***.git %SITE_NAME%
```

If you don't give a name to the project, it takes the name, `wp.local` as default.
https://wp.local

### Edit hosts file

If you want to use a local site name, you should add the following line
into the `/etc/hosts`. In case if you :

```text
0.0.0.0 wp.local mailcatcher.local
```
