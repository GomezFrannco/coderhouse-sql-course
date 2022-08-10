CREATE SCHEMA PARKING_SYSTEM_BK;

USE PARKING_SYSTEM_BK;

CREATE TABLE FLOOR_LEVEL(
level_id INT NOT NULL AUTO_INCREMENT,
level_name VARCHAR(15) NOT NULL,
PRIMARY KEY (level_id)
);

CREATE TABLE CAR_PLACES(
place_id INT NOT NULL AUTO_INCREMENT,
place_size TEXT(10) NOT NULL, 
level_id INT NOT NULL,
PRIMARY KEY (place_id),
CONSTRAINT FK_LEVEL_FLOOR FOREIGN KEY (level_id) REFERENCES FLOOR_LEVEL (level_id)
);

CREATE TABLE CARS(
car_id INT NOT NULL AUTO_INCREMENT,
place_id INT NOT NULL,
car_plate VARCHAR(8) NOT NULL,
car_size TEXT(10) NOT NULL,
PRIMARY KEY (car_id, place_id),
CONSTRAINT FK_PLACE FOREIGN KEY (place_id) REFERENCES CAR_PLACES (place_id)
);

CREATE TABLE CLIENT(
client_id INT NOT NULL AUTO_INCREMENT,
car_id INT NOT NULL,
client_name TEXT(15) NOT NULL,
client_lastname TEXT(15) NOT NULL,
PRIMARY KEY (client_id, car_id),
CONSTRAINT FK_CAR FOREIGN KEY (car_id) REFERENCES CARS (car_id)
);

CREATE TABLE DAILY_CLIENTS(
car_id INT NOT NULL,
leaving_date DATETIME,
entry_date DATETIME,
PRIMARY KEY (car_id),
CONSTRAINT FK_DAILY_CLIENT FOREIGN KEY (car_id) REFERENCES CARS (car_id)
);

CREATE TABLE MONTHLY_CLIENTS(
client_id INT NOT NULL,
last_payment DATE NOT NULL,
PRIMARY KEY (client_id),
CONSTRAINT FK_MONTHLY_CLIENTS FOREIGN KEY (client_id) REFERENCES CLIENT (client_id)
);
/*************************************************************************/
INSERT INTO FLOOR_LEVEL (level_id, level_name) VALUES
(NULL, "planta baja");
INSERT INTO FLOOR_LEVEL (level_id, level_name) VALUES
(NULL, "primer piso");
INSERT INTO FLOOR_LEVEL (level_id, level_name) VALUES
(NULL, "segundo piso");
/*************************************************************************/
-- 1. Importar el archivo car_places.csv
-- 2. Importar el archivo cars.csv
-- 3. Importar el archivo client.csv