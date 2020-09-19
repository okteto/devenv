FROM php:7

WORKDIR /usr/src/app

# setup okteto message
COPY bashrc /root/.bashrc

RUN apt-get update && apt-get install -y zip git libzip-dev && \ 
  pecl install xdebug && echo 'zend_extension="xdebug.so"' > /usr/local/etc/php/conf.d/xdebug.ini && \
  pecl install zip && echo 'extension=zip.so' > /usr/local/etc/php/conf.d/zip.ini && \
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
  php composer-setup.php --install-dir /usr/local/bin && \ 
  ln -s /usr/local/bin/composer.phar /usr/local/bin/composer && \
  unlink composer-setup.php && \
  /usr/local/bin/composer global require laravel/installer

COPY php/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.composer/vendor/bin/:/okteto/vendor/bin/

CMD ["bash"]