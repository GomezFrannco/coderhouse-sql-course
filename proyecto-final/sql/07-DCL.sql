USE PARKING_SYSTEMV3;
-- Creamos un usuario con su respectiva contraseña.
CREATE USER 'onlyReadUser'@'localhost' IDENTIFIED BY '$Password123';
-- Esto quiere decir que el usuario solo podrá visualizar información en todas las tablas de la base de datos.
GRANT SELECT ON PARKING_SYSTEMV3.* TO 'onlyReadUser'@'localhost';
-- Utilizamos la siguiente linea de código para refrescar la tabla de permisos.
FLUSH PRIVILEGES;
-- Visualizamos los permisos otorgados anteriormente.
SHOW GRANTS FOR 'onlyReadUser'@'localhost';
-- -------------------------------------------------------------------------------------------------------- --
-- -------------------------------------------------------------------------------------------------------- --
-- Creando el usuario con permisos de visualizar, insertar y modificar.
CREATE USER 'modifyDataUser'@'localhost' IDENTIFIED BY '$pASSWORD321';
-- Le otorgamos al usuario creado los permisos de visualizar, insertar y modificar datos.
GRANT SELECT, INSERT, UPDATE ON PARKING_SYSTEMV3.* TO 'modifyDataUser'@'localhost';
-- Se refresca la tabla de permisos.
FLUSH PRIVILEGES;
-- Verificamos que los permisos hayan sido otorgados correctamente.
SHOW GRANTS FOR 'modifyDataUser'@'localhost';