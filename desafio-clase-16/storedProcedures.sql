-- ======================================================================== --
-- ======================================================================== --
/* CREATING A STORED PROCEDURE */

/* With this SP we can see the clients who paid after the beginning of actual month */
DELIMITER %%
CREATE PROCEDURE PARKING_SYSTEM_BK.SP_CLIENTS_LAST_PAYMENT -- DDL sentence.
(INOUT ORDER_PARAM VARCHAR(15), INOUT ASC_DESC_PARAM VARCHAR(4)) -- We have 2 INOUT parameters.
-- ORDER_PARAM do reference to the field that I want to order my query.
-- ASC_DESC_PARAM do reference to the order that I want to the info. It can be ascendant or descending.
BEGIN
	SET @query = CONCAT('SELECT * FROM MONTHLY_CLIENTS mc WHERE last_payment > DATE_SUB(CURRENT_DATE(), INTERVAL DAY(CURRENT_DATE()) DAY) ORDER BY', ' ', order_param, ' ', asc_desc_param);
	PREPARE params FROM @query;
	EXECUTE params;
	DEALLOCATE PREPARE params;
END%%
DELIMITER ;
/* VARIABLES */
SET @ORDER_PARAM = 'client_id';
SET @ASC_DESC_PARAM = 'DESC';
/* CALLING TO THE STORED PROCEDURE CREATED ABOVE */
CALL PARKING_SYSTEM_BK.SP_CLIENTS_LAST_PAYMENT(@ORDER_PARAM, @ASC_DESC_PARAM);
-- ======================================================================== --
-- ======================================================================== --

-- ======================================================================== --
-- ======================================================================== --
/* CREATING A STORED PROCEDURE */

/* With this SP we can add a new car to the CARS table in the database */
DELIMITER %%
CREATE PROCEDURE PARKING_SYSTEM_BK.SP_ADD_CAR -- DDL sentence.
(IN car_place INT, IN plate VARCHAR(7), IN carSize VARCHAR(6)) -- We have 3 IN parameters.
BEGIN
	INSERT INTO CARS (car_id, place_id, car_plate, car_size) VALUES (NULL, car_place, plate, carSize); -- DML sentence.
END %%
DELIMITER ;
/* VARIABLES */
SET @CAR_PLACE = 16;
SET @PLATE = 'xcw923';
SET @CARSIZE = 'small';
/* CALLING TO THE STORED PROCEDURE CREATED ABOVE */
CALL PARKING_SYSTEM_BK.SP_ADD_CAR(@CAR_PLACE, @PLATE, @CARSIZE);
-- ======================================================================== --
-- ======================================================================== --