# WP-Docker-staging

This is the scaffolding for local WordPress development with Docker for macOS. Included NGINX, MySQL, PHP 7.4, phpMyAdmin, WP-CLI.

Site root is the wordpress directory. MySQL databases will be stored in the mysqldata directory. You can adjust your php settings in the php/php.ini file. The nginx/certs folder is stored your certificate files.

1. git clone https://github.com/blinmen/WP-Docker-staging.git
2. set your own local domain in the nginx/default.conf
3. brew install mkcert
   brew install nss # if you use Firefox
4. mkcert -install
5. mkdir nginx/certs
6. cd nginx/certs
7. mkcert wp-staging.local This command makes SSL certificate for local domain 
8. set paths to your certificate files in the nginx/default.conf
9. sudo nano /private/etc/hosts and add your local domain string 127.0.0.1       wp-staging.local
10. docker-compose up -d --build
11. install WordPress to the wordpress directory or copy there your existing project

More details about local certificates at https://github.com/FiloSottile/mkcert