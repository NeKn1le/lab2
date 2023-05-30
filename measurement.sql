DROP TABLE IF EXISTS data.measurement;

CREATE TABLE IF NOT EXISTS data.measurement
(
    city integer,
    mark timestamp without time zone,
    temperature double precision,
    CONSTRAINT fk_measurement_city FOREIGN KEY (city)
        REFERENCES data.city (identifier) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS data.measurement
    OWNER to postgres;
DROP INDEX IF EXISTS data.fki_fk_measurement_city;

CREATE INDEX IF NOT EXISTS fki_fk_measurement_city
    ON data.measurement USING btree
    (city ASC NULLS LAST)
    TABLESPACE pg_default;

 
