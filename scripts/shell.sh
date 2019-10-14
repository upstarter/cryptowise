# echo alias docker-compose="'"'docker run --rm \
#     -v /var/run/docker.sock:/var/run/docker.sock \
#     -v "$PWD:$PWD" \
#     -w="$PWD" \
#     docker/compose:1.24.0'"'
# alias dcd='docker-compose down'
# alias dcu='docker-compose up --build'
# alias dkNin='docker network inspect'
# alias dkNls='docker network ls'
# alias dkNs='docker network connect'
# alias dkc='docker-compose'
# alias dkcb='docker-compose build'
# alias dkcB='docker-compose build --no-cache'
# alias dkcd='docker-compose down'
# alias dkce='docker-compose exec -e COLUMNS=`tput cols` -e LINES=`tput lines`'
# alias dkck='docker-compose kill'
# alias dkcl='docker-compose logs'
# alias dkcL='docker-compose logs -f'
# alias dkin='dkNin cryptowise_envoymesh'
# alias dkls='docker ps'
# alias dkps='docker ps'
# alias rmc='cd ..; rm -rf cryptowise'
# alias sadd='eval SSH_AUTH_SOCK=/tmp/ssh-Kms0F4Sxct38/agent.177763; export SSH_AUTH_SOCK;
# SSH_AGENT_PID=177764; export SSH_AGENT_PID;
# echo Agent pid 177764;'
# alias pull='git clone --recurse-submodules git@github.com:upstarter/cryptowise.git'
# kurl() {
#   curl --cacert ./certs/platform-web.ai.pem https://$1 -vk
# }
# b() {
#  dcd; rmc; pull; cd cryptowise; dcu;
# }
# sql() {
#  docker exec -it $1 nohup ./cloud_sql_proxy -projects=eternal-sunset-206422 -dir=/tmp/cloudsql &>/dev/null &
# }
# dktail() {
#   docker exec -it $1 tail -f /var/log/access.log
# }
# dkgo() {
#   docker exec -it $1 /bin/bash
# }
#" >> ~/.bashrc
