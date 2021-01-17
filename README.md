# CryptoWise
> An ecosystem for advanced cryptoasset quantamental traders and investors

[!img](misc/media/color_logo_with_background.png)
This is the ecosystem MonoRepo with Elixir Backend, React Frontend, and GitOps. We currenlty use Docker Compose with Envoy Proxy for micro-services. Istio and Kubernetes are on the Roadmap.

## When you first clone the project you must pull frontend and backend submodules
```
git submodule update --init cryptowise_frontend
git submodule update --init platform_umbrella
```

## To update all submodules at once
`git pull --recurse-submodules`
