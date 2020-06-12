# Development Containers for Okteto

When you run `okteto up` the container running your application is replaced by a development container that contains your development tools (e.g. maven and jdk, or npm, python, go compiler, debuggers, etc). 

The development container can be any docker image. 

The development containers on this list are maintained by the Okteto team to help you get started:

- [okteto/dotnetcore:3](dotnetcore/Dockerfile)
- [okteto/golang:1](golang/Dockerfile)
- [okteto/gradle:latest](gradle/Dockerfile)
- [okteto/maven:latest](maven/Dockerfile)
- [okteto/node:10](node/Dockerfile)
- [okteto/python:3](python/Dockerfile)
- [okteto/ruby:2](ruby/Dockerfile)
- [okteto/php:7](php/Dockerfile)

More information about development containers [here](https://okteto.com/docs/reference/development-environment/index.html).