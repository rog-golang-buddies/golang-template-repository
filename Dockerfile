FROM golang:1.18-alpine as builder

# Install make and bash
RUN apk update && apk upgrade && \
    apk add --no-cache make bash

WORKDIR /src
COPY . .

# Build executable
RUN make build

# Using a distroless image from https://github.com/GoogleContainerTools/distroless
FROM gcr.io/distroless/static:nonroot

# Copy executable from builder image to final images
COPY --from=builder /src/bin/app /

# Numeric version of user nonroot:nonroot provided in image
USER 65532:65532

# Run the executable
CMD ["/app"]
