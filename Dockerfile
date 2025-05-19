FROM alpine:3.21.3

LABEL maintainer="{{MAINTAINER}}"
LABEL org.opencontainers.image.source="{{REPO_URL}}"

WORKDIR /tmp
COPY apk.txt /apk.txt
RUN apk update && \
    xargs -a /apk.txt apk add --no-cache && \
    rm /apk.txt

COPY ./entrypoint.sh /bin/entrypoint
RUN chmod +x /bin/entrypoint

WORKDIR /workspace

ENV DEBUG=1
ENV COMPILER=clang

ENTRYPOINT [ "entrypoint" ]

CMD ["-s", "all"]
