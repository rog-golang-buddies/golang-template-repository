FROM golang:1.18 as build
WORKDIR /go/src/app
COPY . .
# Static build requires CGO_ENABLED=0
RUN mkdir -p /go/bin && CGO_ENABLED=0 go build -ldflags="-w -s" -o /go/bin/app ./...

# Using a distroless image from https://github.com/GoogleContainerTools/distroless
# Image sourced from https://console.cloud.google.com/gcr/images/distroless/global/static
FROM gcr.io/distroless/static:nonroot
COPY --from=build /go/bin/app /
# numeric version of user nonroot:nonroot provided in image
USER 65532:65532
CMD ["/app"]
