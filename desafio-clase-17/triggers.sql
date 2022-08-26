USE PARKING_SYSTEM;
/* CREATING A LOG TABLE */
CREATE TABLE `LOG_CARS` (
	`id_log` INT AUTO_INCREMENT NOT NULL,
	`action_name` VARCHAR(10),
	`car_id` INT NOT NULL,
	`car_plate` VARCHAR(7),
	`place_id` INT,
	`car_size` VARCHAR(15),
	`table_name` VARCHAR(50),
	`user_name` VARCHAR(25),
	`edition_date` DATE, 
	PRIMARY KEY (`id_log`)
);
/* CREATING A TRIGGER */

/* With this TRIGGER I will receive information when a new car is added to the database */
DELIMITER %%
CREATE TRIGGER TRG_LOG_CARS AFTER INSERT ON PARKING_SYSTEM_BK.CARS -- DDL sentence
FOR EACH ROW
BEGIN 
	INSERT INTO LOG_CARS (action_name, car_id, car_plate, place_id, car_size, table_name, user_name, edition_date) -- DML sentence
	VALUES ("INSERT", NEW.car_id, NEW.car_plate, NEW.place_id, NEW.car_size, "CARS", SESSION_USER(), NOW());
END%%
DELIMITER ;
-- ======================================================================== --
-- ======================================================================== --
USE PARKING_SYSTEM;
/* CREATING A LOG TABLE */
CREATE TABLE `LOG_MONTHLY_CLIENTS` (
	`id_log` INT AUTO_INCREMENT NOT NULL,
	`action_name` VARCHAR(10),
	`client_id` INT NOT NULL,
	`before_last_payment` DATE NOT NULL,
	`after_last_payment` DATE NOT NULL,
	`table_name` VARCHAR(50),
	`user_name` VARCHAR(25),
	`edition_date` DATE, 
	PRIMARY KEY (`id_log`)
);
/* CREATING A TRIGGER */

/* With this TRIGGER I will receive information when a customer returns to pay for the service */
DELIMITER %%
CREATE TRIGGER TRG_MONTHLY_CLIENTS AFTER UPDATE ON PARKING_SYSTEM_BK.MONTHLY_CLIENTS -- DDL sentence
FOR EACH ROW
BEGIN 
	INSERT INTO LOG_CARS (action_name, client_id, before_last_payment, after_last_payment, table_name, user_name, edition_date)	-- DML sentence
	VALUES ("UPDATE",NEW.client_id, OLD.last_payment, NEW.last_payment,"MONTHLY_CLIENTS", SESSION_USER(), NOW());
END%%
DELIMITER ;
