# CryptoWise
> An ecosystem for advanced cryptoasset quantamental traders and investors

This is the ecosystem MonoRepo with Elixir Backend, React Frontend, and Devops. We currenlty use Docker Compose with Envoy Proxy for micro-services. There are plans for Istio and Kubernetes on the Roadmap.

## When you first clone the project you must pull frontend and backend submodules
```
git submodule update --init cryptowise_frontend
git submodule update --init platform_umbrella
```

## To update all submodules at once
`git submodule update --init --recursive`
