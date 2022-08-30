-- Creamos un usuario con su respectiva contraseña.
CREATE USER 'onlyReadUser'@'localhost' IDENTIFIED BY '$Password123';

-- Otorgamos los permisos de seleccionar en la base de datos del proyecto al usuario anteriormente.
-- Esto quiere decir que el usuario solo podrá visualizar información en una unica base de datos.
GRANT SELECT ON 'PARKING_SYSTEM'.* TO 'onlyReadUser'@'localhost' IDENTIFIED BY '$Password123';

-- Utilizamos la siguiente linea de código para refrescar la tabla de permisos.
FLUSH PRIVILEGES;

-- Visualizamos los permisos otorgados anteriormente.
SHOW GRANTS FOR 'onlyReadUser'@'localhost';
-- ======================================================================== --
-- ======================================================================== --
-- Creando el usuario con permisos de visualizar, insertar y modificar.
CREATE USER 'modifyDataUser'@'localhost' IDENTIFIED BY '$pASSWORD321';

-- Le otorgamos al usuario creado los permisos de visualizar, insertar y modificar datos.
/* NOTA: Se podría utilizar ALTER, RENAME y TRUNCATE pero no cumplen estrictamente con el desafío. */
GRANT SELECT, CALL, INSERT, UPDATE ON 'PARKING_SYSTEM'.* 'modifyDataUser'@'localhost' TO IDENTIFIED BY '$pASSWORD321'

-- Se refresca la tabla de permisos.
FLUSH PRIVILEGES;

-- Verificamos que los permisos hayan sido otorgados correctamente.
SHOW GRANTS FOR 'modifyDataUser'@'localhost';