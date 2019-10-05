# echo alias docker-compose="'"'docker run --rm \
#     -v /var/run/docker.sock:/var/run/docker.sock \
#     -v "$PWD:$PWD" \
#     -w="$PWD" \
#     docker/compose:1.24.0'"'
# alias dcd='docker-compose down'
# alias dcu='docker-compose up --build'
# alias dcun='docker-compose build --no-cache; docker-compose up'
# alias rmc='cd ..; rm -rf cryptowise'
# alias sadd='eval $(ssh-agent -s)'
# alias pull='git clone --recurse-submodules git@github.com:upstarter/cryptowise.git'
# b() {
# dcd; rmc; pull; cd cryptowise; dcu;
# }
# alias dfe='docker ps -aqf "name="envoy"'
# alias dfu='docker ps -aqf "name=api"'
#" >> ~/.bashrc
