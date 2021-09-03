FROM ubuntu:focal
LABEL org.opencontainers.image.source="https://github.com/MultiVersion/php" org.opencontainers.image.source="https://multiversion.dviih.technology/" org.opencontainers.image.version="21.09" org.opencontainers.image.revision="LTS" org.opencontainers.image.authors="Dviih" org.opencontainers.image.licenses="unlicense.org"

ADD ./php-fpm.conf /opt/php-fpm.conf
ADD ./www.conf /opt/www.conf
ADD ./fastcgi_params /opt/fastcgi_params

RUN \ 
  apt update && \ 
  apt -y install software-properties-common curl apt-transport-https ca-certificates gnupg wget && \
  LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php && \
  apt update && \ 
  apt install -y php8.0 php8.0-cli php8.0-gd php8.0-mysql php8.0-pdo php8.0-mbstring php8.0-tokenizer php8.0-bcmath php8.0-xml php8.0-fpm php8.0-curl php8.0-zip php8.0-mysql php8.0-redis php8.0-mongodb php8.0-oauth php8.0-pgsql php8.0-smbclient php8.0-sqlite3 php8.0-cgi php8.0-bz2

CMD ["/bin/bash"]