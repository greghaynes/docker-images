FROM devbase

RUN ["apt-get", "install", "-y", "weechat"]
ADD --chown=greghaynes:greghaynes irc.conf /home/greghaynes/.weechat/irc.conf
ADD --chown=greghaynes:greghaynes relay.conf /home/greghaynes/.weechat/relay.conf
ADD --chown=greghaynes:greghaynes relay.pem /home/greghaynes/.weechat/ssl/relay.pem
