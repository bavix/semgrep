FROM alpine as rules

WORKDIR /tmp

RUN apk add git && \
    git clone --depth 1 https://github.com/dgryski/semgrep-go.git

RUN mkdir -m 1777 /__w

FROM returntocorp/semgrep:latest-nonroot

COPY --from=rules /__w /__w
COPY --from=rules /tmp/semgrep-go /semgrep-go
