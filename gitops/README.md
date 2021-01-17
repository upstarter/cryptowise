## Tracing

#### Headers for clients to allow tracing

```javascript
function chaosInjection(req, res) {

  // fail req.header('fail') percent of the time
  const failPercent = Number(req.header('fail')) || 0
  console.log(`failPercent: $(failPercent)`)
  if Math.random() < failPercent {
    res.status(500).end()
  }

  // otherwise forward the trace headers upstream
  // only "istio specific" thing your app needs to do
  function forwardTraceHeaders(req) {

    incoming_headers = [
      'x-request-id',
      'x-b3-traceid',
      'x-b3-spanid',
      'x-b3-parentspanid',
      'x-b3-sampled',
      'x-b3-flags',
      'x-ot-span-context',
      'x-dev-user'
    ]
    const headers = {}
    for(let h of incoming_headers) {
      if (req.header(h))
          headers[h] = req.header(h)
    }
    return headers
  }
}
```
