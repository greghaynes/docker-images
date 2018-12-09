FROM devbase

RUN ["wget", "https://dl.google.com/go/go1.11.2.linux-amd64.tar.gz", "-O", "/usr/local/src/go1.11.2.linux-amd64.tar.gz"]
RUN ["tar", "-xzf", "/usr/local/src/go1.11.2.linux-amd64.tar.gz", "-C", "/usr/local/src/"]
RUN ["mkdir", "/home/greghaynes/bin"]
RUN ["ln", "-s", "/usr/local/src/go/bin/go", "/home/greghaynes/bin/go"]
RUN ["ln", "-s", "/usr/local/src/go/bin/gofmt", "/home/greghaynes/bin/gofmt"]

RUN ["su", "greghaynes", "-c", "git clone https://github.com/fatih/vim-go.git /home/greghaynes/.vim/pack/plugins/start/vim-go"]
