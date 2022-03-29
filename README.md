<!-- omit in toc -->
# SQL Development Environment

A keep it simple SQL development environment.

<!-- omit in toc -->
## Table of Contents

- [General info](#general-info)
- [Requirements](#requirements)
- [How to use this project](#how-to-use-this-project)
  - [Connection settings](#connection-settings)

## General info

This project aims to provide a simple environment to learn and develop SQL without having to deal with installing and configuring any database engine on your system. The project is already preset to run both a MySQL and Postgres instances to encourage newcomers on either tech or database world, but you are encourage to add new engines, change its versions or its configuration if you want to.

Whole project is designed for and tested on a Linux system, although there are high chances that it works on any system with both docker and docker compose installed.

## Requirements

* [Docker](https://docs.docker.com/engine/install/)
* [Docker Compose](https://docs.docker.com/compose/install/)
* [VS Code](https://code.visualstudio.com/) (Optional)

## How to use this project

If you want to use this project without having to install any extra software aside of the ones specified in the requirements section on your system you can use VS Code along with the **Remote - Containers** (ID *ms-vscode-remote.remote-containers*) extension. After opening the project in VS Code and having the extension installed you should see a popup to reopen the project in a container, proceed with that to create a **development container** with all needed tools.

Once in the development container you will be able to create, stop and destroy different sql database engines and connect to them easily, it also comes with the **SQLTools** (ID *mtxr.sqltools*) extension to interact with these databases and a configuration to automatically access them. Whole project is also designed to interact with it through the Makefile. Type `make` or `make help` on the VS Code terminal to see all available options or start right directly typing `make start` to create a MySQL and Postgres instance.

If you prefer to use your own database client instead of the SQLTools extension you can still use this project to create the instances easily on your system and connect to them through your favorite client, but you will have to configure them.

### Connection settings

Either if you use another database client or you are just curious about it, these are the connections settings for the databases you instantiate.

* Host: Engine name (such as **mysql** or **postgres**)
* User: root
* Password: secret
* Database: test_db

**These are not recommended credentials for any production setup** they are just a basic configuration to keep things simple and start playing around quickly.
