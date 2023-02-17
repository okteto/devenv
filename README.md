# Development Containers for Okteto

When you run `okteto up` the container running your application is replaced by a development container that contains your development tools (e.g. maven and jdk, or npm, python, go compiler, debuggers, etc).

The development container can be any docker image. More information about development containers, and how to build your own [is available here](https://okteto.com/docs/reference/development-environment/index.html).

The development containers on this list are maintained by the Okteto team to help you get started:

## General Use
| Language/Stack    | Docker Image                                 |
|-------------------|----------------------------------------------|
| dotnetcore 6.0    | [okteto/dotnetcore:6](dotnetcore/Dockerfile) |
| golang 1.20       | [okteto/golang:1](golang/Dockerfile)         |
| jdk 8, Gradle 6.5 | [okteto/gradle:6.5](gradle/Dockerfile)       |
| jdk 11, Maven 3   | [okteto/maven:3-openjdk](maven/Dockerfile)   |
| node 18           | [okteto/node:18](node/Dockerfile)            |
| php 7             | [okteto/php:7](php/Dockerfile)               |
| python 3          | [okteto/python:3](python/Dockerfile)         |
| ruby 2            | [okteto/ruby:2](ruby/Dockerfile)             |
| rust              | [okteto/rust:1](rust/Dockerfile)             |

# Contributions

Are missing your favorite stack or language? Contributions are encouraged in the form of issues, feature requests, or PRs.

This project adheres to the Contributor Covenant [code of conduct](https://github.com/okteto/okteto/blob/master/code-of-conduct.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to hello@okteto.com.
