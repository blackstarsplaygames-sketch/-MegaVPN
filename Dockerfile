FROM alpine:latest
RUN apk add --no-cache bash curl
RUN bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install
COPY config.json /etc/xray/config.json
WORKDIR /etc/xray

# Команда замены меток на переменные и запуск
CMD sed -i "s/PORT/$PORT/g" config.json && 
    sed -i "s/UUID1/$UUID1/g" config.json && 
    sed -i "s/UUID2/$UUID2/g" config.json && 
    sed -i "s/UUID3/$UUID3/g" config.json && 
    sed -i "s/UUID4/$UUID4/g" config.json && 
    sed -i "s/UUID5/$UUID5/g" config.json && 
    xray -config config.json
