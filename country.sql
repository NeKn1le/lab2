DROP TABLE IF EXISTS data.country;

CREATE TABLE IF NOT EXISTS data.country
(
    identifier integer NOT NULL,
    region integer,
    description character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT country_pkey PRIMARY KEY (identifier),
    CONSTRAINT fk_country_region FOREIGN KEY (region)
        REFERENCES data.region (identifier) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS data.country
    OWNER to postgres;
DROP INDEX IF EXISTS data.fki_fk_country_region;

CREATE INDEX IF NOT EXISTS fki_fk_country_region
    ON data.country USING btree
    (region ASC NULLS LAST)
    TABLESPACE pg_default;
 
