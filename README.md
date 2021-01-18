# CryptoWise
> An ecosystem for advanced quantamental traders and investors

This is the ecosystem MonoRepo with Elixir Backend, React Frontend, and GitOps. We currenlty use Docker Compose with Envoy Proxy for micro-services. Istio and Kubernetes are on the Roadmap.

We are looking for contributors! If you interested in mastering the latest technologies to help your ventures capture value, join us in building
the worlds first distributed and decentralized autonomous system for capturing value from global financial markets.

##### We are using the following technologies for the core system (with explanations why):

### Backend
- [Elixir & OTP](www.elixir-lang.org) - the functional distributed systems and concurrency platform for massive scale and modern web services.

### Frontend
- [React](www.reactjs.org) - Simple and modular web document technology
- [Webpack](www.webpack.js.org) - Control over all aspects of the frontend
- [Sass](www.sass-lang.com) - CSS improved
- [CSS Grid](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout) - responsive layouts made easy
- [Ant Design](www.ant.design) - Ideal framework for mobile and web quant heavy designs (build by ant financial)

### Gitops (the new devops)
- [Docker Compose](www.docker.com) - bootstrapped microservices
- [Envoy](www.envoyproxy.io) - the sidecar web proxy for modern microservice architectures (nginx on steroids with builtin TLS, GRPC, circuit breakers, etc..)
- [Terraform](www.terraform.io) - infrastructure as code for gitops
- [Istio](www.istio.io) - connect, control, secure, and observe services
- [Kubernetes](www.kubernetes.io) - the infrastructure orchestration tool dejour
- [Helm](www.helm.sh) - Power tools for Kubernetes
 <!-- ![](./docs/assets/particle-background.gif) -->
<img src="./misc/media/color_logo_with_background.png" width="100%" height="550">

## To update all submodules at once
`git pull --recurse-submodules`

## To update frontend and backend submodules seperately
```
git submodule update --init cryptowise_frontend
git submodule update --init platform_umbrella
```
