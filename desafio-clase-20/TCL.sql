USE PARKING_SYSTEM;
-- Antes de poder borrar registros dentro de la tabla elegida, necesito hacer un ajuste.
ALTER TABLE MONTHLY_CLIENTS
DROP CONSTRAINT FK_MONTHLY_CLIENTS; -- Borro la Foreign Key creada con anterioridad. 

-- Vuelvo a crear la FK pero esta vez, indico una acción al borrar registros.
ALTER TABLE MONTHLY_CLIENTS 
ADD CONSTRAINT FK_MONTHLY_CLIENTS 
    FOREIGN KEY (client_id) 
    REFERENCES CLIENT (client_id) 
    ON DELETE CASCADE;  
-- Ahora puedo proceder con el código DML y TCL sin generar errores al borrar registros. Esto porque la tabla MONTHLY_CLIENTS depende de la tabla CLIENT, que es la que elegí.

START TRANSACTION; -- Al usar START TRANSACTION estamos,de manera implícita, desactivando el autocommit. Pero también podría desactivarlo de manera explícita SET autocommit=0;
/* DML sentence */
DELETE FROM CLIENT
WHERE client_id NOT BETWEEN 2 AND 5;

-- ROLLBACK;
COMMIT;
-- ======================================================================== --
-- ======================================================================== --
USE PARKING_SYSTEM;

START TRANSACTION;
/* DML sentences */
INSERT INTO CARS (place_id, car_plate, car_size)
VALUES (12, "kci823", "medium");
INSERT INTO CARS (place_id, car_plate, car_size)
VALUES (37,"aa931ui","small");
INSERT INTO CARS (place_id, car_plate, car_size)
VALUES (31,"vlw311","small");
INSERT INTO CARS (place_id, car_plate, car_size)
VALUES (45,"ad819fc","big");
/* TCL savepoint sentence */
SAVEPOINT SV_new_cars_1;

/* More DML sentences */
INSERT INTO CARS (place_id, car_plate, car_size)
VALUES (23,"ad457vt","small");
INSERT INTO CARS (place_id, car_plate, car_size)
VALUES (1,"lpx547","small");
INSERT INTO CARS (place_id, car_plate, car_size)
VALUES (1,"af435sr","medium");
INSERT INTO CARS (place_id, car_plate, car_size)
VALUES (39,"ab816yu","big");
/* Another TCL savepoint sentence */
SAVEPOINT SV_new_cars_2;

-- RELEASE SAVEPOINT SV_new_cars_1;
