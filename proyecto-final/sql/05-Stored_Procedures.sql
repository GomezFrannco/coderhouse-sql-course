USE PARKING_SYSTEMV3;
/* Creando Stored Procedures | DDL sub-language (Data Definition Language) */
DELIMITER //
CREATE PROCEDURE PARKING_SYSTEMV3.SP_add_new_vehicle
(IN place INT, IN vehicleType TEXT(9), IN color TEXT(10), plate VARCHAR(7))
BEGIN
  DECLARE vtype INT;
  SELECT vehicle_type
  FROM VEHICLE_TYPE
  WHERE type_name = vehicleType
  INTO vtype;
  INSERT INTO VEHICLES (place_id, vehicle_type, vehicle_color, vehicle_plate)
  VALUES (place, vtype, color, plate);
END
//
DELIMITER ;
-- ------------------------------------------------------------------- --
DELIMITER //
CREATE PROCEDURE PARKING_SYSTEMV3.SP_add_new_client
(IN c_name TEXT(10), IN c_lastname TEXT(15), IN c_phone VARCHAR(10), IN plate VARCHAR(7), IN vehicleType TEXT(9))
BEGIN
  DECLARE vehicleId INT;
  DECLARE fee INT;
  DECLARE lastPayment INT;
  SELECT vehicle_id 
  FROM VEHICLES 
  WHERE vehicle_plate = plate
  INTO vehicleId;
  SELECT fee_type
  FROM MONTHLY_FEES
  WHERE vehicle_type = 
    (SELECT vehicle_type FROM VEHICLE_TYPE WHERE type_name = vehicleType)
  INTO fee;
  INSERT INTO PAYMENTS (fee_type, payment_date)
  VALUES (fee, NOW());
  SELECT (payment_id)
  FROM PAYMENTS
  ORDER BY payment_id DESC
  LIMIT 1 INTO lastPayment;
  INSERT INTO MONTHLY_CLIENTS(vehicle_id, payment_id, client_name, client_lastname, client_phone)
  VALUES (vehicleId, lastPayment, c_name, c_lastname, c_phone);
END
//
DELIMITER ;
-- =================================================================== --
-- =================================================================== --