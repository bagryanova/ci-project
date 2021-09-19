FROM ubuntu:18.04

RUN apt-get update && apt-get install --yes --no-install-recommends \
    git \
    gradle \
    default-jdk \
    default-jre \
    maven \
    nginx

RUN git clone https://github.com/JetBrains-Research/astminer
RUN git clone https://github.com/MorphiaOrg/morphia

COPY entrypoint.sh /entrypoint.sh
COPY astminer.sh /astminer.sh
COPY morphia.sh /morphia.sh
COPY nginx.conf /etc/nginx

RUN chmod +x /entrypoint.sh
RUN chmod +x /astminer.sh
RUN chmod +x /morphia.sh

ENTRYPOINT ["/entrypoint.sh"]
