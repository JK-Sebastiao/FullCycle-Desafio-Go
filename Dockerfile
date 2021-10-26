FROM golang:1.17.2-alpine AS go-app
LABEL MAINTAINER="jkiakumbo"

WORKDIR /app

COPY codeeducation/ .

RUN go mod download

RUN go build

FROM scratch

WORKDIR /app

COPY --from=go-app /app/codeeducation .

CMD ["./codeeducation"]