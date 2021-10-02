FROM devopsedu/webapp

MAINTAINER Meghana

#Update Repository
RUN apt-get update -y

#Install Apache
RUN apt-get install -y apache2

#Install PHP Modules
RUN apt-get install -y php7.0 libapache2-mod-php7.0 php7.0-cli php7.0-common php7.0-mbstring php7.0-gd php7.0-intl php7.0-xml php7.0-mysql php7.0-mcrypt php7.0-zip

#Copy Application Files
RUN rm -rf /var/www/html/*
COPY website /var/www/html/

#ENTRYPOINT ["/usr/sbin/apache2", "-k", "start"]

#Open port 80
EXPOSE 8080
EXPOSE 80

#Start Apache service
CMD apachectl -D FOREGROUND