FROM debian:stretch

ENV INSTALL_CSS=false

RUN apt-get update && apt-get install lib32gcc1 lib32stdc++6 lib32tinfo5 wget -y
RUN useradd -ms /bin/bash steam

USER steam
WORKDIR /home/steam

RUN wget http://media.steampowered.com/client/steamcmd_linux.tar.gz
RUN tar -xvzf steamcmd_linux.tar.gz
RUN rm steamcmd_linux.tar.gz

RUN mkdir servers
RUN mkdir cfg

RUN chown -R steam:steam /home/steam/servers

COPY --chown=steam:steam cfg cfg
COPY --chown=steam:steam install.sh .

CMD ["./install.sh"]
