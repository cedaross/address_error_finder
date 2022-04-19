CREATE TABLE proc.dist_prg_osm  AS (SELECT ST_MakeLine (osm.geom, prg_punktyadresowe.geom) FROM public.osm, prg.prg_punktyadresowe
WHERE prg_punktyadresowe.simc_nazwa=osm.simc_nazwa 
							   AND prg_punktyadresowe.ulic_nazwa=osm.ulic_nazwa 
							   AND prg_punktyadresowe.numer=osm.numer);
ALTER TABLE proc.dist_prg_osm
	ADD length int;
UPDATE proc.dist_prg_osm
	SET length=ST_Length(st_makeline)
