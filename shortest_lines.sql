DROP TABLE IF EXISTS PROC.SHORTEST;


CREATE TABLE PROC.SHORTEST AS
	(SELECT ST_SHORTESTLINE(PRG_PUNKTYADRESOWE.GEOM,

										PRG_ULICE.GEOM)
		FROM PRG.PRG_PUNKTYADRESOWE,
			PRG.PRG_ULICE
		WHERE PRG_PUNKTYADRESOWE.SIMC_NAZWA = PRG_ULICE.SIMC_NAZWA
			AND PRG_PUNKTYADRESOWE.ULIC_NAZWA = PRG_ULICE.ULIC_NAZWA)
ALTER TABLE PROC.SHORTEST
	ADD length int;
UPDATE proc.shortest
	SET length=ST_Length(st_shortestline);
