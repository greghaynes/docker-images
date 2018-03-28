FROM ubuntu:16.04

ADD apt-sources /etc/apt/sources.list

RUN ["apt-get", "update"]
RUN ["apt-get", "-y", "install", "vim", "zsh", "git", "curl", "inetutils-ping", "openssh-server", "sudo", "tmux"]
RUN mkdir /var/run/sshd

RUN ["groupadd", "greghaynes"]
RUN ["useradd", "-m", "greghaynes", "-g", "greghaynes", "-s", "/bin/zsh"]
ADD sudoers /etc/sudoers

RUN ["su", "greghaynes", "-c", "sh -c \"$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)\""]

ADD --chown=greghaynes:greghaynes zshrc /home/greghaynes/.zshrc
ADD --chown=greghaynes:greghaynes tmux.conf /home/greghaynes/.tmux.conf
ADD --chown=greghaynes:greghaynes authorized_keys /home/greghaynes/.ssh/authorized_keys
