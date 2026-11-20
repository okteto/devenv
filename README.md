# Development Containers for Okteto

When you run `okteto up` the container running your application is replaced by a development container that contains your development tools (e.g. maven and jdk, or npm, python, go compiler, debuggers, etc).

The development container can be any Docker image. More information about development containers and how to build your own is available here (https://okteto.com/docs/reference/development-environment/index.html).

The development containers on this list are maintained by the Okteto team to help you get started:

## General Use
| Language/Stack    | Docker Image                                 |
|-------------------|----------------------------------------------|
| golang 1.26       | [okteto/golang:1](golang/Dockerfile)         |
| node 26           | [okteto/node:26](node/Dockerfile)            |

# Contributions

Are we missing your favorite stack or language? Contributions are encouraged through issues, feature requests, or PRs.

This project adheres to the Contributor Covenant [code of conduct](https://github.com/okteto/okteto/blob/master/code-of-conduct.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to hello@okteto.com.
