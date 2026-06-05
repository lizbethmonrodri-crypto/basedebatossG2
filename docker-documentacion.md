# Documentación de Contenedores Docker de Sistemas Gestores de Base de Datos

![Imagen Docker](./img/imagen_docker.png)

docker pull docker/getting-started

## Contenedor del Sistema Gestor MariaDB
docker pull mariadb

## Contenedor de Mariadb sin volumen
docker run --name ServerMariaDBG2 -e MARIADB_ROOT_PASSWORD=123456 \
-d -p 3345:3306  e0236

## contenedor de mariadb con volumen
docker run --name ServerMariaDBG2 -e MARIADB_ROOT_PASSWORD=123456 \
-d -v v-mariadbg2:/var/lib/mysql -p 3345:3306  e0236

## Contenedor de postgres con volumen
docker run --name ServerPostgresG2 -e POSTGRES_PASSWORD=123456 \
-d -p 5457:5432 -v v-postgresg2:/var/lib/postgresql/data \
eba8ds

## Contenedor de sql server 2022 con vulumen
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@ssw0rd" \
   -u 0 \
   -p 1452:1433 --name SQLServerG2 \
   -d -v vol-sqlserverg2:/var/opt/mssql/data \
   2dca9

## comando docker
| Comando | Descripcion |
| :--- | :--- |
| docker pull nombre_imagen | **Descarga una imagen de Docker** [Docker Hup] (https://hup.docker.com/) |
| docker images | **Visualizar las imagenes que se encuentran en el docker** |
| docker ps | **Visualiza todos los contenedores que estan encendidos** |
| docker ps -a | **Visualiza todos los contenedores que estan encendidos y apagados** |
| docker stop idcontenedor o nombrecontenedor | **detiene un contenedor** |
| docker start idcontenedor o nombrecontenedor | **enciende un contenedor** |
| docker rm idcontenedor o nombrecontenedor | **elimina un contenedor si esta apagado** |
| docker rm -f idcontenedor o nombrecontenedor | **elimina un contenedor este o no encendido** |
