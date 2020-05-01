cat << EOF
Welcome to your development environment. Happy coding!
EOF

export PS1="\[\e[32m\]\${OKTETO_NAMESPACE:-okteto} \w\[\e[m\]> "
