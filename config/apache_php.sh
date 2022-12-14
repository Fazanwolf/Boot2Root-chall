#!/bin/bash

a2enmod proxy_fcgi
a2enconf php8.1-fpm

service php8.1-fpm restart
service apache2 restart