FROM mysql:5.7

COPY mysql.cnf /etc/mysql/my.cnf
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN usermod -u 1000 mysql
