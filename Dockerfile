FROM alpine as rules

WORKDIR /tmp

RUN apk add git && \
    git clone --depth 1 https://github.com/dgryski/semgrep-go.git

FROM returntocorp/semgrep:latest-nonroot

COPY --from=rules /tmp/semgrep-go /semgrep-go
