USE PARKING_SYSTEMV3;
/* Creando vistas | DDL sub-language (Data Definition Language) */
CREATE OR REPLACE VIEW VW_info_disponibilidad_total AS (
  SELECT pl.place_id AS numero_cochera, pt.place_size AS tamaño_cochera, l.level_name AS piso
  FROM PLACES pl
  INNER JOIN PLACE_TYPE pt ON pt.place_type = pl.place_type
  INNER JOIN LEVELS l ON l.level_id = pl.level_id
  WHERE pl.place_id NOT IN 
    (SELECT v.place_id FROM VEHICLES v)
  ORDER BY pl.place_id
);
-- SELECT * FROM VW_info_disponibilidad_total vidt;
CREATE OR REPLACE VIEW VW_info_cocheras_ocupadas AS (
  SELECT pl.place_id AS numero_cochera, pt.place_size AS tamaño_cochera, l.level_name AS piso, vt.type_name AS vehiculo, v.vehicle_color AS color, v.vehicle_plate AS matrícula
  FROM PLACES pl
  INNER JOIN PLACE_TYPE pt ON pt.place_type = pl.place_type
  INNER JOIN VEHICLES v ON v.place_id = pl.place_id 
  INNER JOIN LEVELS l ON l.level_id = pl.level_id
  INNER JOIN VEHICLE_TYPE vt ON vt.vehicle_type = v.vehicle_type
);
-- SELECT * FROM VW_info_cocheras_ocupadas vico;
CREATE OR REPLACE VIEW VW_info_clientes_mensuales AS (
  SELECT mc.client_name AS nombre, mc.client_lastname AS apellido, mc.client_phone AS teléfono, vt.type_name AS vehiculo, v.vehicle_plate AS matrícula, v.vehicle_color AS color, v.place_id AS cochera, l.level_name AS piso, p.payment_date AS útlimo_pago
  FROM MONTHLY_CLIENTS mc
  INNER JOIN VEHICLES v ON v.vehicle_id = mc.vehicle_id
  INNER JOIN VEHICLE_TYPE vt ON vt.vehicle_type = v.vehicle_type
  INNER JOIN PLACES pl ON pl.place_id = v.place_id
  INNER JOIN LEVELS l ON l.level_id = pl.level_id
  INNER JOIN PAYMENTS p ON p.payment_id = mc.payment_id
  ORDER BY v.place_id
);
CREATE OR REPLACE VIEW VW_info_clientes_diarios AS (
  SELECT vt.type_name AS vehiculo, v.vehicle_plate AS matrícula, v.vehicle_color AS color ,v.place_id AS cochera, pt.place_size AS tamaño_cochera, l.level_name AS piso, hc.entry_date AS llegada, hc.leaving_date AS salida
  FROM HOURLY_CLIENTS hc
  INNER JOIN VEHICLES v ON v.vehicle_id = hc.vehicle_id
  INNER JOIN VEHICLE_TYPE vt ON vt.vehicle_type = v.vehicle_type
  INNER JOIN PLACES pl ON pl.place_id = v.place_id
  INNER JOIN PLACE_TYPE pt ON pt.place_type = pl.place_type 
  INNER JOIN LEVELS l ON l.level_id = pl.level_id
  INNER JOIN HOURLY_FEES hf ON hf.fee_type = hc.fee_type
  WHERE hf.n_hours < 12
  ORDER BY v.place_id
);
-- SELECT * FROM VW_info_clientes_diarios vicd;
CREATE OR REPLACE VIEW VW_info_vehiculos_por_estadia AS (
	SELECT v.place_id AS cochera, l.level_name AS piso, v.vehicle_plate AS matricula, vt.type_name AS vehiculo, v.vehicle_color AS color, hf.n_hours AS horas, hf.fee_price AS total, hc.entry_date AS llegada
	FROM VEHICLES v
	INNER JOIN PLACES p ON p.place_id = v.place_id
	INNER JOIN LEVELS l ON l.level_id = p.level_id
	INNER JOIN VEHICLE_TYPE vt ON vt.vehicle_type = v.vehicle_type
	INNER JOIN HOURLY_CLIENTS hc ON hc.vehicle_id = v.vehicle_id 
	INNER JOIN HOURLY_FEES hf ON hf.fee_type = hc.fee_type
	WHERE hf.n_hours >= 12
	ORDER BY v.place_id
);
-- SELECT * FROM VW_info_vehiculos_por_estadia vivpe;
-- =================================================================== --
-- =================================================================== --