#Comando para listar los contenedores activos
docker container ls
#Comando para listar todos los contenedores, aun sin estar activos
docker container ls -a

docker container run  

docker container run -p 666:80 --name MiPaginaWeb docker/getting-started

docker container run -d -p 666:80 docker/getting-started
#Para deterner un contenedor activo, se debe usar el siguiente comando:
docker container stop "nombre"
#Para eliminar un contenedor, se debe usar el siguiente comando:
docker container rm "nombre" 
#Para elminar un contenedor activo, se debe usar el siguiente comando:
docker container rm -f "nombre" 
#Para eliminar todos los contenedores detenidos, se debe usar el siguiente comando:
docker container prune 
#Para traer una imagen de docker, se debe usar el siguiente comando:
docker pull ubuntu


docker container run ^
e MYSQL_ROOT_PASSWORD=Secret123 ^
-v mysqldb:/var/lib/mysql ^
-dp 3307:3306 ^
mysql


docker container run ^
-e MONGO_INITDB_ROOT_USERNAME=mongoadmin ^
-e MONGO_INITDB_ROOT_PASSWORD=Secret123 ^
-v mongodb:/data/db ^
-dp 27018:27017 mongo 

#Para meterte dentro del contenedor de mongo 
mongosh -u mongoadmin -p Secret123