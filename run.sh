docker build -t dev .
docker run -it -e "TERM=xterm-256color" dev /bin/zsh
