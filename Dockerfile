FROM kalilinux/kali-rolling
EXPOSE 8080
RUN apt update -y  && \
    apt install curl -y  && \
    apt install unrar -y  && \
    apt install unzip -y  && \
    curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    cp /rclone-*-linux-amd64/rclone /usr/bin/ && \
    chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone && \
    apt install aria2 -y && \
    apt install wget -y && \
    apt install pip -y && \
    pip install jupyter && \
    pip install voila && \
    pip install ipywidgets && \
    pip install widgetsnbextension && \
    mkdir /Essential-Files
COPY Essential-Files /Essential-Files
COPY Essential-Files/index.html /usr/index.html
COPY Essential-Files/jconf.py /conf/jupyter.py
COPY Essential-Files/jpass.json /root/.jupyter/jupyter_notebook_config.json
RUN chmod +x /Essential-Files/entrypoint.sh
CMD /Essential-Files/entrypoint.sh
