cat << EOF
Welcome to your development environment. Happy coding!
EOF

export PS1="\[\e[32m\]okteto\[\e[m\]> "
test -f "/etc/bash_completion" && source /etc/bash_completion
command -v kubectl > /dev/null && source <(kubectl completion bash)
command -v helm > /dev/null && source <(helm completion bash)