UPDATE prg.prg_ulice
	SET ulic_nazwa=osm_street_mapping.osm_ulica
	FROM prg.osm_street_mapping
	WHERE prg_ulice.ulic_nazwa=osm_street_mapping.ulic_nazwa AND prg_ulice.simc_nazwa=osm_street_mapping.msc
