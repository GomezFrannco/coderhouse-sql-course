CREATE VIEW info_clientes_mensuales AS -- Esta vista enseña toda la información relevante sobre los clientes con servicio mensual 
(
	SELECT cl.client_name AS client, c.car_plate AS car, cp.place_id AS place, mc.last_payment 
	FROM CLIENT cl
	INNER JOIN CARS c ON c.car_id = cl.car_id
	INNER JOIN CAR_PLACES cp ON cp.place_id = c.place_id
	INNER JOIN MONTHLY_CLIENTS mc ON mc.client_id = cl.client_id
	ORDER BY mc.last_payment DESC
	LIMIT 20
);
CREATE VIEW info_mes_pago AS -- Esta vista brinda información sobre los clientes que ya han abonado el servicio (servicio mensual) en el mes actual
(
	SELECT cl.client_name AS name, c.car_plate AS car, mc.last_payment 
	FROM MONTHLY_CLIENTS mc
	INNER JOIN CLIENT cl ON cl.client_id = mc.client_id
	INNER JOIN CARS c ON c.car_id = cl.car_id 
	WHERE mc.last_payment > DATE_SUB(CURRENT_DATE(), INTERVAL DAY(CURRENT_DATE()) DAY)
	ORDER BY mc.last_payment DESC
);
CREATE VIEW info_autos_diario AS -- Esta vista nos proporciona información sobre los clientes que ingresaron y se fueron en el dia
(
	SELECT dc.entry_date, c.car_plate AS car, cp.place_id AS place, fl.level_name AS floor, dc.leaving_date
	FROM DAILY_CLIENTS dc
	INNER JOIN CARS c ON c.car_id = dc.car_id
	INNER JOIN CAR_PLACES cp ON cp.place_id = c.place_id
	INNER JOIN FLOOR_LEVEL fl ON fl.level_id = cp.level_id
	LIMIT 20
);
CREATE VIEW autos_planta_baja AS -- Esta vista nos indica qué autos se encuentran en la planta baja
(
	SELECT c.car_plate AS car, c.car_size AS size, cp.place_id AS place, fl.level_name AS floor 
	FROM CARS c 
	INNER JOIN CAR_PLACES cp ON cp.place_id = c.place_id
	INNER JOIN FLOOR_LEVEL fl ON fl.level_id = cp.level_id
	WHERE cp.place_id < 52
	ORDER BY cp.place_id DESC
	LIMIT 20
);
CREATE VIEW lugares_disp_1er_piso AS -- Esta vista nos muestra los lugares disponibles en el primer piso
(
	SELECT cp.place_id AS place, cp.place_size AS size, fl.level_name AS floor
	FROM FLOOR_LEVEL fl
	INNER JOIN CAR_PLACES cp ON cp.level_id = fl.level_id
	WHERE fl.level_name = 'primer piso'
	AND cp.place_id NOT IN (SELECT c.place_id FROM CARS c WHERE c.place_id > 51)
);