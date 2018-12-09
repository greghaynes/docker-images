FROM alpine

RUN         apk add --no-cache \
                weechat \
                weechat-perl \
                weechat-python \
                weechat-aspell \
                ca-certificates \
                aspell-en \
                ncurses \
                python \
                perl

ENV LANG C.UTF-8
ENV TERM xterm-256color

ADD https://weechat.org/files/scripts/buffers.pl /weechat/perl/autoload/buffers.pl
ADD https://weechat.org/files/scripts/autosort.py /weechat/python/autoload/autosort.py

RUN mkdir -p /root/.weechat
ADD relay.conf /root/.weechat/relay.conf
ADD irc.conf /root/.weechat/irc.conf

ENTRYPOINT ["/usr/bin/weechat-headless"]
