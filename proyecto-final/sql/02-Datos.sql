USE PARKING_SYSTEMV3;
/*************************************************/
/****** Datos indispensables para el negocio *****/
/*************************************************/
-- 1. Insertar datos con estas primeras 9 sentencias INSERT.
-- 2. Luego importar el archivo places.csv, el mismo se encuentra dentro de la carpeta assets/csv 
-- 3. Proseguir con las demás sentencias INSERT.



-- Añadiendo datos en la tabla VEHICLE_TYPE | DML sub-language (Data Manipulation Language)
INSERT INTO VEHICLE_TYPE (type_name )
  VALUES ("moto")
;
INSERT INTO VEHICLE_TYPE (type_name )
  VALUES ("auto")
;
INSERT INTO VEHICLE_TYPE (type_name )
  VALUES ("suv")
;
INSERT INTO VEHICLE_TYPE (type_name )
  VALUES ("camioneta")
;
-- Añadiendo datos en la tabla LEVELS | DML sub-language (Data Manipulation Language)
INSERT INTO LEVELS (level_name)
  VALUES ("planta baja")
;
INSERT INTO LEVELS (level_name)
  VALUES ("primer piso")
;
INSERT INTO LEVELS (level_name)
  VALUES ("segundo piso")
;
-- Añadiendo datos en la tabla PLACE_TYPE | DML sub-language (Data Manipulation Language)
INSERT INTO PLACE_TYPE (place_size)
  VALUES ("simple")
;
INSERT INTO PLACE_TYPE (place_size)
  VALUES ("doble")
;
/*************************************************/
/******************* IMPORTANTE ******************/
/*************************************************/

-- Luego de PLACE_TYPE hay que importar el archivo places.csv en la tabla PLACES

-------------------------------------------------------------------------------------------
USE PARKING_SYSTEMV3;
-- Añadiendo datos en la tabla MONTHLY_FEES | DML sub-language (Data Manipulation Language)
INSERT INTO MONTHLY_FEES (vehicle_type, fee_price)
  VALUES (1, 5000.00)
;
INSERT INTO MONTHLY_FEES (vehicle_type, fee_price)
  VALUES (2, 8500.00)
;
INSERT INTO MONTHLY_FEES (vehicle_type, fee_price)
  VALUES (3, 8500.00)
;
INSERT INTO MONTHLY_FEES (vehicle_type, fee_price)
  VALUES (4, 11000.00)
;
-- Añadiendo datos en la tabla HOURLY_FEES | DML sub-language (Data Manipulation Language)
INSERT INTO HOURLY_FEES (vehicle_type, n_hours, fee_price)
  VALUES (2, 1, 350.00)
;
INSERT INTO HOURLY_FEES (vehicle_type, n_hours, fee_price)
  VALUES (3, 1, 350.00)
;
INSERT INTO HOURLY_FEES (vehicle_type, n_hours, fee_price)
  VALUES (4, 1, 390.00)
;
INSERT INTO HOURLY_FEES (vehicle_type, n_hours, fee_price)
  VALUES (2, 12, 1400.00)
;
INSERT INTO HOURLY_FEES (vehicle_type, n_hours, fee_price)
  VALUES (3, 12, 1400.00)
;
INSERT INTO HOURLY_FEES (vehicle_type, n_hours, fee_price)
  VALUES (4, 12, 1560.00)
;
INSERT INTO HOURLY_FEES (vehicle_type, n_hours, fee_price)
  VALUES (2, 24, 2800.00)
;
INSERT INTO HOURLY_FEES (vehicle_type, n_hours, fee_price)
  VALUES (3, 24, 2800.00)
;
INSERT INTO HOURLY_FEES (vehicle_type, n_hours, fee_price)
  VALUES (4, 24, 3120.00)
;
-- ------------------------------------------------------------------------------ --

/**************************************************/
/******** Datos de prueba de funcionamiento *******/
/**************************************************/
-- Agregamos algunos vehiculos
INSERT INTO VEHICLES (place_id, vehicle_type, vehicle_color, vehicle_plate)
  VALUES (44, 4, "rojo", "AE203CD")
;
INSERT INTO VEHICLES (place_id, vehicle_type, vehicle_color, vehicle_plate)
  VALUES (44.2, 2, "blanco", "AA235LD")
;
INSERT INTO VEHICLES (place_id, vehicle_type, vehicle_color, vehicle_plate)
  VALUES (49.0, 3, "gris", "AD293EF")
;
INSERT INTO VEHICLES (place_id, vehicle_type, vehicle_color, vehicle_plate)
  VALUES (96.0, 3, "negro", "AE973XW")
;
INSERT INTO VEHICLES (place_id, vehicle_type, vehicle_color, vehicle_plate)
  VALUES (155.0, 2, "gris", "AD271KG")
;
INSERT INTO VEHICLES (place_id, vehicle_type, vehicle_color, vehicle_plate)
  VALUES (139.0, 2, "gris", "KCE941")
;
INSERT INTO VEHICLES (place_id, vehicle_type, vehicle_color, vehicle_plate)
  VALUES (120.0, 4, "gris", "AC923SF")
;
INSERT INTO VEHICLES (place_id, vehicle_type, vehicle_color, vehicle_plate)
  VALUES (115.0, 4, "blanco", "OFX931")
;
INSERT INTO VEHICLES (place_id, vehicle_type, vehicle_color, vehicle_plate)
  VALUES (101.0, 4, "blanco", "AA261FE")
;
INSERT INTO VEHICLES (place_id, vehicle_type, vehicle_color, vehicle_plate)
  VALUES (9, 2, "marron", "MGD707")
;
-- Registramos algunos clientes con servicio por algunas horas
INSERT INTO HOURLY_CLIENTS (vehicle_id, fee_type, entry_date)
  VALUES (1, 3, NOW())
;
INSERT INTO HOURLY_CLIENTS (vehicle_id, fee_type, entry_date)
  VALUES (2, 1, NOW())
;
INSERT INTO HOURLY_CLIENTS (vehicle_id, fee_type, entry_date)
  VALUES (10, 4, NOW())
;
-- Añadimos algunos pagos de clientes mensuales
INSERT INTO PAYMENTS (fee_type, payment_date)
  VALUES (3, NOW())
;
INSERT INTO PAYMENTS (fee_type, payment_date)
  VALUES (3, NOW())
;
INSERT INTO PAYMENTS (fee_type, payment_date)
  VALUES (2, NOW())
;
INSERT INTO PAYMENTS (fee_type, payment_date)
  VALUES (2, NOW())
;
INSERT INTO PAYMENTS (fee_type, payment_date)
  VALUES (4, NOW())
;
INSERT INTO PAYMENTS (fee_type, payment_date)
  VALUES (4, NOW())
;
INSERT INTO PAYMENTS (fee_type, payment_date)
  VALUES (4, NOW())
;
-- Agregamos algunos clientes mensuales
INSERT INTO MONTHLY_CLIENTS (vehicle_id, payment_id, client_name, client_lastname, client_phone)
  VALUES (3, 1, "Jorge", "Mandela", "1123938472")
;
INSERT INTO MONTHLY_CLIENTS (vehicle_id, payment_id, client_name, client_lastname, client_phone)
  VALUES (7, 2, "Javier", "Martinez", "1184345547")
;
INSERT INTO MONTHLY_CLIENTS (vehicle_id, payment_id, client_name, client_lastname, client_phone)
  VALUES (5, 3, "Juan", "Miranda", "1197615428")
;
INSERT INTO MONTHLY_CLIENTS (vehicle_id, payment_id, client_name, client_lastname, client_phone)
  VALUES (4, 4, "Jose", "Molina", "1133124084")
;
INSERT INTO MONTHLY_CLIENTS (vehicle_id, payment_id, client_name, client_lastname, client_phone)
  VALUES (10, 5, "Jairo", "Mesa", "1166203704")
;
INSERT INTO MONTHLY_CLIENTS (vehicle_id, payment_id, client_name, client_lastname, client_phone)
  VALUES (9, 6, "Joaquin", "Mejia", "1100214508")
;
INSERT INTO MONTHLY_CLIENTS (vehicle_id, payment_id, client_name, client_lastname, client_phone)
  VALUES (8, 7, "Joel", "Muñoz", "1197056449")
;