FROM golang:1.10.3-stretch
WORKDIR /go/src/github.com/cilindrox/kong-prometheus-exporter/
COPY server.go .
RUN go get -d -v
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GOARM=6 go build -a -installsuffix cgo -ldflags '-w -s' -o server

FROM scratch

ENV PORT=3000
COPY --from=0 /go/src/github.com/cilindrox/kong-prometheus-exporter/server /go/server
EXPOSE 3000

ENTRYPOINT ["/go/server"]
