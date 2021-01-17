# CryptoWise
> An ecosystem for advanced quantamental traders and investors

<!-- ![](./docs/assets/particle-background.gif) -->
<img src="./misc/media/color_logo_with_background.png" width="100%" height="550">

This is the ecosystem MonoRepo with Elixir Backend, React Frontend, and GitOps. We currenlty use Docker Compose with Envoy Proxy for micro-services. Istio and Kubernetes are on the Roadmap.

## To update all submodules at once
`git pull --recurse-submodules`

## To update frontend and backend submodules seperately
```
git submodule update --init cryptowise_frontend
git submodule update --init platform_umbrella
```
