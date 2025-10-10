FROM alpine:3.22.2

RUN apk update && apk add --no-cache \
        build-base=0.5-r3 \
        openssl-dev=3.5.4-r0 \
        lua5.4=5.4.7-r0 \
        lua5.4-dev=5.4.7-r0 \
        luarocks5.4=3.11.1-r0 \
        && ln -s /usr/bin/lua5.4 /usr/bin/lua \
        && ln -s /usr/bin/luarocks-5.4 /usr/bin/luarocks

RUN luarocks install luasocket 3.1.0-1 \
    && luarocks install luasec 1.3.2-1

WORKDIR /usr/src/app

COPY main.lua .

CMD ["lua", "main.lua"]

