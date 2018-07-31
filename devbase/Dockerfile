FROM ubuntu:18.04

ADD apt-sources /etc/apt/sources.list

RUN ["apt-get", "update"]
RUN ["apt-get", "-y", "install", "vim", "zsh", "git", "curl", "inetutils-ping", "openssh-server", "sudo", "tmux", "make", "build-essential"]
RUN mkdir /var/run/sshd

RUN ["groupadd", "greghaynes"]
RUN ["useradd", "-m", "greghaynes", "-g", "greghaynes", "-s", "/bin/zsh"]
ADD sudoers /etc/sudoers.d/greghaynes

ADD --chown=greghaynes:greghaynes authorized_keys /home/greghaynes/.ssh/authorized_keys

RUN ["su", "greghaynes", "-c", "sh -c \"$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)\""]

RUN ["su", "greghaynes", "-c", "curl -fsSL https://raw.githubusercontent.com/greghaynes/DotFiles/master/.zshrc -o /home/greghaynes/.zshrc"]
RUN ["su", "greghaynes", "-c", "curl -fsSL https://raw.githubusercontent.com/greghaynes/DotFiles/master/.tmux.conf -o /home/greghaynes/.tmux.conf"]
RUN ["su", "greghaynes", "-c", "curl -fsSL https://raw.githubusercontent.com/greghaynes/DotFiles/master/.gitconfig -o /home/greghaynes/.gitconfig"]

# Setup Vim
RUN ["su", "greghaynes", "-c", "mkdir -p /home/greghaynes/.vim/bundle"]
RUN ["su", "greghaynes", "-c", "git clone https://github.com/kien/ctrlp.vim.git /home/greghaynes/.vim/bundle/ctrlp.vim"]

RUN ["su", "greghaynes", "-c", "mkdir /home/greghaynes/.vim/colors"]
RUN ["su", "greghaynes", "-c", "curl -fsSL https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim -o /home/greghaynes/.vim/colors/solarized.vim"]

RUN ["su", "greghaynes", "-c", "curl -fsSL https://raw.githubusercontent.com/greghaynes/DotFiles/master/.vimrc -o /home/greghaynes/.vimrc"]
