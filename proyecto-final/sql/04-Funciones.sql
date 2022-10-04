USE PARKING_SYSTEMV3;
/* Creando funciones | DDL sub-language (Data Definition Language) */
DELIMITER $$
CREATE FUNCTION FN_n_cocheras_disponibles (piso INT) RETURNS INT
NO SQL
BEGIN
  DECLARE query INT;
  DECLARE levelId INT;
  SET levelId = piso;
  SELECT COUNT(pl.place_id)
  FROM PLACES pl
  WHERE pl.place_id NOT IN 
    (SELECT v.place_id FROM VEHICLES v) 
  AND pl.level_id = levelId
  INTO query;
  RETURN query;
END$$
DELIMITER ;
-- SELECT FN_n_cocheras_disponibles(2) AS disponibilidad_1er_piso;
-- =================================================================== --
DELIMITER //
CREATE FUNCTION FN_fee_por_servicio (matricula VARCHAR(7)) RETURNS INT
NO SQL
BEGIN
	DECLARE fee INT; -- Monto por el tipo de servicio
 	SELECT hf.fee_price
	FROM HOURLY_FEES hf
	INNER JOIN HOURLY_CLIENTS hc ON hc.fee_id = hf.fee_id
	INNER JOIN VEHICLES v ON v.vehicle_id = hc.vehicle_id
	WHERE v.vehicle_plate = matricula
	INTO fee;
	RETURN fee;
END
//
DELIMITER ;
-- SELECT FN_fee_por_servicio("ae203cd");
-- =================================================================== --
DELIMITER //
CREATE FUNCTION FN_horas_en_cochera (matricula VARCHAR(7)) RETURNS INT
NO SQL
BEGIN
	DECLARE entryDate DATETIME; -- Cuando entró el vehiculo.
	DECLARE leavingDate DATETIME; -- Cuando se retiró el vehiculo.
	DECLARE hours INT; -- Cantidad de tiempo que estuvo el vehiculo dentro del garage.
	SELECT entry_date
	FROM HOURLY_CLIENTS 
	WHERE vehicle_id = 
	(SELECT vehicle_id FROM VEHICLES WHERE vehicle_plate = matricula)
	INTO entryDate;
	SELECT leaving_date
	FROM HOURLY_CLIENTS 
	WHERE vehicle_id = 
	(SELECT vehicle_id FROM VEHICLES WHERE vehicle_plate = matricula)
	INTO leavingDate;
	SELECT ROUND((TIMESTAMPDIFF(MINUTE, entryDate, leavingDate) / 60))
	INTO hours; /* Se divide a los minutos entre 60 para obtener las horas y redondearlas hacia arriba (lógica propia del negocio) */
	IF hours > 4 && hours <= 12 THEN
		RETURN 4;
	ELSE
		RETURN hours;
	END IF;
END
//
DELIMITER ;
-- SELECT FN_horas_en_cochera("ae203cd");
-- =================================================================== --
DELIMITER //
CREATE FUNCTION FN_precio_total (matricula VARCHAR(7)) RETURNS INT
NO SQL
BEGIN
	DECLARE fee INT;
	DECLARE hours INT;
	DECLARE total INT;
	SELECT FN_horas_en_cochera(matricula) INTO hours;
	SELECT FN_fee_por_servicio(matricula) INTO fee;
	SELECT (hours * fee) INTO total;
	RETURN total;
END
//
DELIMITER ;
-- SELECT FN_precio_total("ae203cd") AS monto_total;
-- =================================================================== --
-- =================================================================== --