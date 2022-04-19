UPDATE prg.prg_punktyadresowe
	SET ulic_nazwa=osm_street_mapping.osm_ulica
	FROM prg.osm_street_mapping
	WHERE "prg_punktyadresowe".ulic_nazwa=osm_street_mapping.ulic_nazwa
	AND prg_punktyadresowe.simc_nazwa=osm_street_mapping.msc
UPDATE prg.prg_punktyadresowe
SET NUMER = UPPER(NUMER);
