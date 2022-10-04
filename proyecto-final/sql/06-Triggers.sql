USE PARKING_SYSTEMV3;
/* Creando triggers y tablas relacionadas a estos | DDL sub-language (Data Definition Language) */
CREATE TABLE LOG_MONTHLY_CLIENTS (
  log_id INT AUTO_INCREMENT NOT NULL,
  action_name VARCHAR(10),
  client_id INT NOT NULL,
  vehicle_id INT NOT NULL,
  vehicle_id_updt INT,
  client_name_updt TEXT(10),
  client_lastname_updt TEXT(15),
  client_phone_updt VARCHAR(10),
  user_name VARCHAR(40),
  log_date DATETIME,
  PRIMARY KEY (log_id)
);
DELIMITER //
CREATE TRIGGER TRG_new_monthly_clients_logger AFTER INSERT ON PARKING_SYSTEMV3.MONTHLY_CLIENTS
FOR EACH ROW
BEGIN
  INSERT INTO LOG_MONTHLY_CLIENTS (action_name, client_id, vehicle_id, user_name, log_date)
  VALUES ("INSERT", NEW.client_id, NEW.vehicle_id, SESSION_USER(), NOW());
END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER TRG_changes_monthly_clients_logger AFTER UPDATE ON PARKING_SYSTEMV3.MONTHLY_CLIENTS
FOR EACH ROW
BEGIN
  INSERT INTO LOG_MONTHLY_CLIENTS (action_name, client_id,vehicle_id, vehicle_id_updt, client_name_updt, client_lastname_updt, client_phone_updt, user_name, log_date)
  VALUES ("UPDATE", NEW.client_id, OLD.vehicle_id, NEW.vehicle_id, NEW.client_name, NEW.client_lastname, NEW.client_phone, SESSION_USER(), NOW());
END
//
DELIMITER ;
-- ------------------------------------------------------------------- --
CREATE TABLE LOG_PAYMENTS (
  log_id INT AUTO_INCREMENT NOT NULL,
  action_name VARCHAR(10),
  payment_id INT NOT NULL,
  payment_date DATETIME NOT NULL,
  user_name VARCHAR(40),
  log_date DATETIME ,
  PRIMARY KEY (log_id)
);
DELIMITER //
CREATE TRIGGER TRG_new_payments_logger AFTER INSERT ON PARKING_SYSTEMV3.PAYMENTS 
FOR EACH ROW 
BEGIN
  INSERT INTO LOG_PAYMENTS (action_name, payment_id, payment_date, user_name, log_date)
  VALUES ("INSERT", NEW.payment_id, NEW.payment_date, SESSION_USER(), NOW());
END
//
DELIMITER ;
-- =================================================================== --
-- =================================================================== --