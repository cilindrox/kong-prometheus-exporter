## Quick Start

### 1.Setup kong http log plugin

Install kong and enable the [HTTP Log Plugin](https://docs.konghq.com/plugins/http-log/)

```bash
curl -X POST http://kong:8001/apis/{api}/plugins \
  --data "name=http-log"  \
  --data "config.http_endpoint=http://kong-prometheus-exporter.svc/kong" \
  --data "config.method=POST" \
  --data "config.timeout=1000" \
  --data "config.keepalive=1000"
```

### 2.Customize metrics

according to log format, customize metrics.


### 3. Deploy exporter

Deploy exporter and Kong together

### Testing locally

Theres a sample payload included on this repo's example folder. To test this,
simply:

```bash
docker-compose up
curl -X POST localhost:3000/kong -d @example.json
```
