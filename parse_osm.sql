DROP TABLE IF EXISTS PUBLIC.OSM;


CREATE TABLE OSM AS
	(SELECT "addr:city",
			"addr:place",
			"addr:street",
			"addr:housenumber",
			OSM_ID,
			ST_CENTROID(WAY)
		FROM PUBLIC.PLANET_OSM_LINE
		WHERE "addr:housenumber" IS NOT NULL
		UNION SELECT "addr:city",
			"addr:place",
			"addr:street",
			"addr:housenumber",
			OSM_ID,
			ST_CENTROID(WAY)
		FROM PUBLIC.PLANET_OSM_POLYGON
		WHERE "addr:housenumber" IS NOT NULL
		UNION SELECT "addr:city",
			"addr:place",
			"addr:street",
			"addr:housenumber",
			OSM_ID,
			WAY
		FROM PUBLIC.PLANET_OSM_POINT
		WHERE "addr:housenumber" IS NOT NULL);


UPDATE PUBLIC.OSM
SET "addr:city" = "addr:place"
WHERE "addr:city" IS NULL;


ALTER TABLE PUBLIC.OSM
DROP COLUMN "addr:place";


ALTER TABLE PUBLIC.OSM ADD COLUMN ID serial NOT NULL;


ALTER TABLE PUBLIC.OSM ADD PRIMARY KEY (ID);


ALTER TABLE PUBLIC.OSM RENAME COLUMN "addr:city" TO SIMC_NAZWA;


ALTER TABLE PUBLIC.OSM RENAME COLUMN "addr:street" TO ULIC_NAZWA;


ALTER TABLE PUBLIC.OSM RENAME COLUMN "addr:housenumber" TO NUMER;


UPDATE PUBLIC.OSM
SET NUMER = UPPER(NUMER);

ALTER TABLE IF EXISTS public.osm
    RENAME st_centroids TO geom;
	
UPDATE PUBLIC.OSM
SET geom=ST_Transform(geom, 2180)

