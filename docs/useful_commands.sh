# from instance into api
curl -d '{"auth":{"nickname":"asdffffsaaanvl","email":"ally@ddy.com","password":"asdfasdf","topic_k
nowledge_ids":[125,128,124,9,65,129]}}'  -H "Content-Type: application/json" -X POST http://192.168.48.2:8080/v1/auth/create -v

# from envoy
curl --cacert /etc/cryptowise-ai.pem -d '{"auth":{"nickname":"aasdddadadsdffffsaaanvl","email":" aly@ddy.com","passwo rd":"asdfasdf","topic_knowledge_ids":[125,128,124,9,65,129]}}'  -H "Content-Type: application/json" -H "Host: api.cryptowise.ai" -X POST https://localhost/v1/auth/create -vk
