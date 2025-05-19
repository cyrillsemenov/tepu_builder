FROM alpine:3.21.3

LABEL maintainer="{{MAINTAINER}}"
LABEL org.opencontainers.image.source="{{REPO_URL}}"

COPY apk.txt /tmp/apk.txt
RUN apk update && \
    xargs -a /tmp/apk.txt apk add --no-cache && \
    rm /tmp/apk.txt

WORKDIR /workspace

ENV DEBUG=1
ENV COMPILER=clang

ENTRYPOINT ["make", "-s", "all", "-j", "4"]
