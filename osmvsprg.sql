DROP TABLE IF EXISTS proc.osmvsprg;

CREATE TABLE proc.osmvsprg AS (SELECT simc_nazwa, ulic_nazwa, numer FROM public.osm
EXCEPT
SELECT simc_nazwa, ulic_nazwa, numer FROM prg.prg_punktyadresowe);

ALTER TABLE proc.osmvsprg
	ADD COLUMN geom geometry;
	
UPDATE proc.osmvsprg
SET geom=osm.geom FROM public.osm
WHERE osmvsprg.simc_nazwa=osm.simc_nazwa AND osmvsprg.ulic_nazwa=osm.ulic_nazwa AND osmvsprg.numer=osm.numer
