echo "========================================================================================="
echo "You most likely need to run this script with sudo, unless you belong to the docker group."
echo "See: https://docs.docker.com/engine/security/security/#docker-daemon-attack-surface"
echo "========================================================================================="
echo

set -x
docker build -t rust-dev .
docker run -it -e "TERM=xterm-256color" -e "USER=kele" -v $(readlink -f `pwd`/shared/workspace):/work rust-dev /bin/zsh
