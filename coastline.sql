DROP TABLE IF EXISTS data.coastline;

CREATE TABLE IF NOT EXISTS data.coastline
(
    shape integer,
    segment integer,
    latitude double precision,
    longtitude double precision
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS data.coastline
    OWNER to postgres; 
