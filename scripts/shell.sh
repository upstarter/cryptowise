# echo alias docker-compose="'"'docker run --rm \
#     -v /var/run/docker.sock:/var/run/docker.sock \
#     -v "$PWD:$PWD" \
#     -w="$PWD" \
#     docker/compose:1.24.0'"'
# alias dcd='docker-compose down'
# alias dcu='docker-compose up --build'
# alias dkNin='docker network inspect'
# alias dkNls='docker network ls'
# alias dkc='docker-compose'
# alias dkcb='docker-compose build'
# alias dkcB='docker-compose build --no-cache'
# alias dkcd='docker-compose down'
# alias dkce='docker-compose exec -e COLUMNS=`tput cols` -e LINES=`tput lines`'
# alias dkck='docker-compose kill'
# alias dkcl='docker-compose logs'
# alias dkcL='docker-compose logs -f'
# alias rmc='cd ..; rm -rf cryptowise'
# alias sadd='eval $(ssh-agent -s)'
# alias pull='git clone --recurse-submodules git@github.com:upstarter/cryptowise.git'
# b() {
# dcd; rmc; pull; cd cryptowise; dcu;
# }
# alias dfe='docker ps -aqf "name="envoy"'
# alias dfu='docker ps -aqf "name=api"'
# kurl() {
#   curl --cacert ./certs/platform-web.ai.pem https://$1/v1/topics -vk
# }
#" >> ~/.bashrc
