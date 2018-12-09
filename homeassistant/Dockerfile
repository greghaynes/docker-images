FROM devbase

RUN ["apt-get", "install", "-y", "software-properties-common"]
RUN ["add-apt-repository", "ppa:deadsnakes/ppa"]
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "python3.6"]

RUN ["wget", "https://bootstrap.pypa.io/get-pip.py"]
RUN ["python3.6", "get-pip.py"]
RUN ["pip", "install", "homeassistant"]


