FROM php:7
WORKDIR /okteto

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
  php -r "if (hash_file('sha384', 'composer-setup.php') === 'a5c698ffe4b8e849a443b120cd5ba38043260d5c4023dbf93e1558871f1f07f58274fc6f4c93bcfd858c6bd0775cd8d1') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
  php composer-setup.php --install-dir /usr/local/bin && \ 
  ln -s /usr/local/bin/composer.phar /usr/local/bin/composer && \
  php -r "unlink('composer-setup.php');" && \
  pecl install xdebug && echo 'zend_extension="xdebug.so"' > /usr/local/etc/php/conf.d/xdebug.ini && \
  apt-get update && apt-get install -y zip git

# setup okteto message
COPY bashrc /root/.bashrc

CMD ["bash"]