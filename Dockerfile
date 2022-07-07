FROM golang:1.18.3-alpine3.16 as builder

# install make
RUN apk update && apk upgrade && \
    apk add --no-cache make

WORKDIR /src
COPY . .

# build executable
RUN make build

# Using a distroless image from https://github.com/GoogleContainerTools/distroless
FROM gcr.io/distroless/static:nonroot

# copy executable from builder image to final images
COPY --from=build /src/bin/app /

# numeric version of user nonroot:nonroot provided in image
USER 65532:65532

# run the executable
CMD ["/app"]

# optionally expose a port
ENV PORT=8000
EXPOSE $PORT
