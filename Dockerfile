FROM ubuntu:16.04
LABEL maintainer="Anthony legg/leggtc1@student.op.ac.nz"
RUN apt-get -q update && apt-get -yq dist-upgrade 
RUN apt-get -yq install apache2
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/run/apache
ENV APACHE_PID_FILE /var/run/apache/httpd.pid
RUN mkdir /var/run/apache
ADD index.html /var/www/html/index.html
RUN mkdir /data
ENV xvol=/data
WORKDIR $xvol
RUN ["/bin/bash", "-c", "cat > foo.txt"]
RUN /bin/bash -c 'echo foo.txt created.'
RUN ["/bin/bash", "-c", "cat > baz.txt"]
RUN /bin/bash -c 'echo baz.txt created.'
RUN ["/bin/bash", "-c", "cat > bar.txt"]
RUN /bin/bash -c 'echo bar.txt created.'
WORKDIR /
VOLUME $xvol
EXPOSE 80
ENTRYPOINT ["/usr/sbin/apache2"]
CMD ["-DFOREGROUND"]

