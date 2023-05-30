DROP TABLE IF EXISTS data.city;

CREATE TABLE IF NOT EXISTS data.city
(
    identifier integer NOT NULL,
    country integer,
    description character varying(50) COLLATE pg_catalog."default",
    latitude double precision,
    longtitude double precision,
    dataset character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT city_pkey PRIMARY KEY (identifier),
    CONSTRAINT fk_city_country FOREIGN KEY (country)
        REFERENCES data.country (identifier) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS data.city
    OWNER to postgres;
DROP INDEX IF EXISTS data.fki_fk_city_country;

CREATE INDEX IF NOT EXISTS fki_fk_city_country
    ON data.city USING btree
    (country ASC NULLS LAST)
    TABLESPACE pg_default;
 
