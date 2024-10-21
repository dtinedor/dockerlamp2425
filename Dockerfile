FROM php:8.0.0-apache

# Evitar interactividad durante la instalación
ARG DEBIAN_FRONTEND=noninteractive

# Actualizar y instalar dependencias en una sola capa para reducir el tamaño de la imagen
RUN apt-get update && apt-get install -y \
        sendmail \
        libpng-dev \
        libzip-dev \
        zlib1g-dev \
        libonig-dev \
    && docker-php-ext-install \
        mysqli \
        mbstring \
        zip \
        gd \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

# Configuración adicional (si es necesario)
# COPY ./php.ini /usr/local/etc/php/

