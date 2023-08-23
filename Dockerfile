FROM golang:alpine as builder

WORKDIR /usr/src/app

COPY . .

#CGO_ENABLED=0 disable pre-built libraries link.
RUN CGO_ENABLED=0 go build app.go

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/app .

ENTRYPOINT ["./app"]