FROM alpine:3.6 AS build
RUN apk update && apk add git make gcc musl-dev
RUN git clone https://github.com/colinscape/sgrep
RUN mkdir sgrep/bin && cd sgrep/src && make

FROM alpine:3.6
RUN apk update && apk add openssl p7zip
COPY --from=build /sgrep/bin/sgrep /usr/local/bin/sgrep
COPY search /usr/local/bin/search
ENTRYPOINT ["/usr/local/bin/search"]
