CREATE SCHEMA PARKING_SYSTEMV3;

USE PARKING_SYSTEMV3;

/* Creando las tablas | DDL sub-language (Data Definition Language) */
-- Tablas con información de los vehículos
CREATE TABLE VEHICLES(
  -- En esta tabla se registran los datos de los vehiculos
  vehicle_id INT NOT NULL AUTO_INCREMENT,
  place_id DECIMAL(4,1) NOT NULL,
  vehicle_type INT NOT NULL,
  vehicle_color TEXT(10) NOT NULL,
  vehicle_plate VARCHAR(7) NOT NULL,
  PRIMARY KEY (vehicle_id)
);
CREATE TABLE VEHICLE_TYPE(
  -- En esta tabla se indican los tipos de vehiculos
  vehicle_type INT NOT NULL AUTO_INCREMENT,
  type_name TEXT(9) NOT NULL,
  PRIMARY KEY (vehicle_type)
);
-- ------------------------------------------------------------------------ --
-- Tablas con información de los garages
CREATE TABLE PLACES(
  -- En esta tabla se indica el numero de la cochera y su tipo
  place_id DECIMAL(4,1) NOT NULL,
  level_id INT NOT NULL,
  place_type INT NOT NULL,
  PRIMARY KEY (place_id)
);
CREATE TABLE PLACE_TYPE(
  -- En esta tabla se indican los tipos de cocheras
  place_type INT NOT NULL AUTO_INCREMENT,
  place_size TEXT(6),
  PRIMARY KEY (place_type)
);
CREATE TABLE LEVELS(
  -- En esta tabla se indica el piso del garage
  level_id INT NOT NULL AUTO_INCREMENT,
  level_name TEXT(12),
  PRIMARY KEY (level_id)
);
-- ------------------------------------------------------------------------ --
-- Tablas con información de los clientes
CREATE TABLE MONTHLY_CLIENTS(
  -- En esta tabla se registra toda la información relacionada al cliente
  client_id INT NOT NULL AUTO_INCREMENT,
  vehicle_id INT NOT NULL,
  payment_id INT NOT NULL,
  client_name TEXT(10) NOT NULL,
  client_lastname TEXT(15) NOT NULL,
  client_phone VARCHAR(10) NOT NULL,
  PRIMARY KEY (client_id)
);
CREATE TABLE HOURLY_CLIENTS(
  -- En esta tabla se registran algunos datos necesarios para clientes que utilizan el garage por pocas horas
  vehicle_id INT NOT NULL,
  fee_type INT NOT NULL,
  entry_date DATETIME NOT NULL,
  leaving_date DATETIME
);
-- ------------------------------------------------------------------------ --
-- Tablas con información de los pagos
CREATE TABLE PAYMENTS(
  -- Esta tabla guarda información sobre el pago de clientes mensuales
  payment_id INT NOT NULL AUTO_INCREMENT,
  fee_type INT NOT NULL,
  payment_date DATETIME NOT NULL,
  PRIMARY KEY (payment_id) 
);
CREATE TABLE MONTHLY_FEES(
  -- Esta tabla guarda información de precios del servicio mensual
  fee_type INT NOT NULL AUTO_INCREMENT,
  vehicle_type INT NOT NULL,
  fee_price DECIMAL(8,2),
  PRIMARY KEY (fee_type)
);
CREATE TABLE HOURLY_FEES(
  -- Esta tabla guarda información de precios del servicio por hora
  fee_type INT NOT NULL AUTO_INCREMENT,
  vehicle_type INT NOT NULL,
  n_hours INT NOT NULL,
  fee_price DECIMAL(8,2),
  PRIMARY KEY (fee_type)
);
-- =================================================================== --
-- =================================================================== --
/* Añadiendo relaciones y restricciones | DDL sub-language (Data Definition Language) */
ALTER TABLE VEHICLES
  ADD CONSTRAINT `FK_VEHICLES_PLACES`
      FOREIGN KEY (`place_id`)
      REFERENCES `PLACES` (`place_id`),
  ADD CONSTRAINT `FK_VEHICLE_TYPE`
      FOREIGN KEY (`vehicle_type`)
      REFERENCES `VEHICLE_TYPE` (`vehicle_type`)
;
ALTER TABLE PLACES
  ADD CONSTRAINT `FK_PLACE_TYPE`
      FOREIGN KEY (`place_type`)
      REFERENCES `PLACE_TYPE` (`place_type`),
  ADD CONSTRAINT `FK_PLACE_FLOOR`
      FOREIGN KEY (`level_id`)
      REFERENCES `LEVELS` (`level_id`)
;
ALTER TABLE MONTHLY_CLIENTS
  ADD CONSTRAINT `FK_CUSTOMERS_VEHICLE_MONTH`
      FOREIGN KEY (`vehicle_id`)
      REFERENCES `VEHICLES` (`vehicle_id`)
      ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMERS_PAYMENT_MONTH`
      FOREIGN KEY (`payment_id`)
      REFERENCES `PAYMENTS` (`payment_id`)
;
ALTER TABLE HOURLY_CLIENTS
  ADD CONSTRAINT `FK_CUSTOMER_VEHICLE_HOUR`
      FOREIGN KEY (`vehicle_id`)
      REFERENCES `VEHICLES` (`vehicle_id`)
      ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_PAYMENT_HOUR`
      FOREIGN KEY (`fee_type`)
      REFERENCES `HOURLY_FEES` (`fee_type`)
;
ALTER TABLE PAYMENTS
  ADD CONSTRAINT `FK_PAYMENTS_FEE`
      FOREIGN KEY (`fee_type`)
      REFERENCES `MONTHLY_FEES` (`fee_type`)
;
ALTER TABLE MONTHLY_FEES
  ADD CONSTRAINT `FK_VEHICLE_PRICE_MONTH`
      FOREIGN KEY (`vehicle_type`)
      REFERENCES `VEHICLE_TYPE` (`vehicle_type`)
;
ALTER TABLE HOURLY_FEES
  ADD CONSTRAINT `FK_VEHICLE_PRICE_HOUR`
      FOREIGN KEY (`vehicle_type`)
      REFERENCES `VEHICLE_TYPE` (`vehicle_type`)
;
-- =================================================================== --
-- =================================================================== --