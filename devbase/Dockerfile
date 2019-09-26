FROM debian:buster

ADD apt-sources /etc/apt/sources.list

RUN ["apt-get", "update"]
RUN ["apt-get", "-y", "install", "dialog", "locales", "bash", "zsh", "git", "curl", "inetutils-ping", "sudo", "tmux", "make", "build-essential", "apt-transport-https", "gnupg2", "python3", "python3-dev"]
ADD locale.gen /etc/locale.gen
RUN ["locale-gen"]

RUN ["groupadd", "greghaynes"]
RUN ["useradd", "-m", "greghaynes", "-g", "greghaynes", "-s", "/bin/zsh"]
ADD sudoers /etc/sudoers.d/greghaynes

# Python
RUN ["curl", "https://bootstrap.pypa.io/get-pip.py", "-o", "/tmp/get-pip.py"]
RUN ["python3", "/tmp/get-pip.py"]
RUN ["rm", "/tmp/get-pip.py"]
RUN ["pip", "install", "pipenv"]

# Go
RUN ["curl", "https://dl.google.com/go/go1.13.linux-amd64.tar.gz", "-o", "/tmp/go.tar.gz"]
RUN ["tar", "-C", "/var/lib/", "-xvzf", "/tmp/go.tar.gz"]
RUN ["rm", "/tmp/go.tar.gz"]

# NeoVim
RUN ["curl", "-L", "https://github.com/neovim/neovim/releases/download/v0.4.2/nvim-linux64.tar.gz", "-o", "/tmp/nvim.tar.gz"]
RUN ["mkdir", "-p", "/var/lib/neovim"]
RUN ["tar", "-C", "/var/lib/neovim", "-xvzf", "/tmp/nvim.tar.gz"]
RUN ["ln", "-s", "/var/lib/neovim/nvim-linux64/bin/nvim", "/usr/local/bin/nvim"]
RUN ["rm", "/tmp/nvim.tar.gz"]
ADD --chown=greghaynes:greghaynes init.vim /home/greghaynes/.config/nvim/init.vim
# duoplete requires pynvim
RUN ["pip", "install", "pynvim"]
# vim-plug
USER greghaynes:greghaynes
WORKDIR /home/greghaynes
RUN ["curl", "-fLo", "/home/greghaynes/.local/share/nvim/site/autoload/plug.vim", "--create-dirs", "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"]
ENV GOROOT=/var/lib/go
ENV GOPATH=/home/greghaynes/go
ENV PATH=/bin:/usr/bin:/usr/local/bin:/var/lib/go/bin
ADD --chown=greghaynes:greghaynes hybrid_material.vim /home/greghaynes/.config/nvim/colors/hybrid_material.vim
RUN ["git", "clone", "https://github.com/fatih/vim-go", "/home/greghaynes/.vim/plugged/vim-go"]
RUN ["/usr/local/bin/nvim", "-E", "+PlugInstall --sync", "+qall"]
RUN ["/usr/local/bin/nvim", "-E", "+GoInstallBinaries", "+qall"]

# Shell
RUN ["curl", "-o", "/tmp/oh-my-zsh.sh", "-fsSL", "https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh"]
RUN ["chmod", "+x", "/tmp/oh-my-zsh.sh"]
RUN ["/tmp/oh-my-zsh.sh"]
RUN ["rm", "/tmp/oh-my-zsh.sh"]
ADD --chown=greghaynes:greghaynes zshrc /home/greghaynes/.zshrc

# tmux
ADD --chown=greghaynes:greghaynes tmux.conf /home/greghaynes/.tmux.conf

# Runner
USER root:root
WORKDIR /
ADD run /app/run
CMD ["/app/run"]
