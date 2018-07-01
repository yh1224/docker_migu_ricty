FROM debian:stretch
RUN apt-get update && apt-get install -y curl cvs git fontforge
COPY make.sh /tmp/make.sh
ENTRYPOINT ["/bin/bash"]
