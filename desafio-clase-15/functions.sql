USE PARKING_SYSTEM_BK;

DELIMITER $$ 
-- Esta función muestra la cantidad de lugares que tiene cada piso.
-- Como parámetro recibe un número. Este número representa el nivel o piso del edificio
-- según el piso que ingresemos, nos devolverá un número diferente.
CREATE FUNCTION `fn_places_per_floor`(floor INT) RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE floorId INT;
	DECLARE query INT;
	SET floorId = floor;
	SELECT COUNT(cp.place_id) FROM CAR_PLACES cp WHERE cp.level_id = floorId INTO query;
	RETURN query;
END$$
DELIMITER ;

SELECT fn_places_per_floor(3) AS places_floor_3;
-- Actual output: places_floor_3 = 58
SELECT fn_places_per_floor(2) AS places_floor_2;
-- Actual output: places_floor_3 = 51

/*=======================================================================================*/

DELIMITER $$ 
-- Esta función muestra la cantidad de pagos que se han recibido después
-- de la fecha indicada en el argumento o parámetro.
CREATE FUNCTION `fn_payments_gt`(date DATE) RETURNS VARCHAR(60)
READS SQL DATA
BEGIN
	DECLARE query INT;
	SELECT COUNT(mc.client_id) 
	FROM MONTHLY_CLIENTS mc
	WHERE mc.last_payment > date
	INTO query;	
	RETURN CONCAT("Number of people who paid after [", date, "]: ", query);	
END$$
DELIMITER ;

SELECT fn_payments_gt('2022-08-01') AS payment_after_date;
-- Actual output: Number of people who paid after [2022-08-01]: 8