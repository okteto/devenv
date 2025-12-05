ARG PHP_VERSION=8
FROM php:${PHP_VERSION}
ARG XDEBUG_VERSION=3

WORKDIR /usr/src/app

# setup okteto message
COPY bashrc /root/.bashrc

RUN apt-get update && apt-get install -y zip git libzip-dev && \
  if [ "${XDEBUG_VERSION}" = "2" ]; then \
    pecl install xdebug-2.9.8; \
  else \
    pecl install xdebug; \
  fi && \
  echo 'zend_extension="xdebug.so"' > /usr/local/etc/php/conf.d/xdebug.ini && \
  pecl install zip && echo 'extension=zip.so' > /usr/local/etc/php/conf.d/zip.ini && \
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
  php composer-setup.php --install-dir /usr/local/bin && \
  ln -s /usr/local/bin/composer.phar /usr/local/bin/composer && \
  unlink composer-setup.php && \
  /usr/local/bin/composer global require laravel/installer

COPY php/xdebug${XDEBUG_VERSION}.ini /usr/local/etc/php/conf.d/xdebug.ini

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.composer/vendor/bin/:/okteto/vendor/bin/

CMD ["bash"]
