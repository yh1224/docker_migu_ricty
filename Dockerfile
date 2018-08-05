FROM debian:jessie
RUN apt-get update && apt-get install -y curl cvs git make xz-utils fontforge
COPY make.sh /tmp/make.sh
RUN chmod +x /tmp/make.sh
ENTRYPOINT ["/tmp/make.sh"]
