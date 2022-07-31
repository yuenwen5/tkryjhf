FROM alpine:edge

RUN apk update && \
    apk add --no-cache ca-certificates caddy tor wget && \
	Xray_Newv=`wget --no-check-certificate -qO- https://api.github.com/repos/XTLS/Xray-core/tags | grep 'name' | cut -d\" -f4 | head -1 | cut -b 2-` && \
    wget -qO xray.zip https://github.com/XTLS/Xray-core/releases/download/v$Xray_Newv/Xray-linux-64.zip && \
    busybox unzip xray.zip && \
    chmod +x /xray && \
    rm -rf /var/cache/apk/*

ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD /start.sh
