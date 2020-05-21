-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/OQdyd7
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Cancellation Code
-- Table Cancellation Code
CREATE TABLE "cancellation_code" (
    -- DOT Flight Cancellation Reason Code
    "CANCELLATION_REASON_CODE" TEXT   NOT NULL,
    -- Cancellation Reason
    "CANCELLATION_REASON" TEXT   NOT NULL,
    CONSTRAINT "pk_cancellation_code" PRIMARY KEY (
        "CANCELLATION_REASON_CODE"
     )
);

-- Airport
-- Table Airport
CREATE TABLE "airports" (
    -- IATA Airport Code
    "IATA_CODE" TEXT   NOT NULL,
    -- Airport Name
    "AIRPORT" TEXT   NOT NULL,
    -- City
    "CITY" TEXT   NOT NULL,
    -- State
    "STATE" TEXT   NOT NULL,
    -- Country
    "COUNTRY" TEXT   NOT NULL,
    -- Latitude of the Airport
    "LATITUDE" INT   NULL,
    -- Longitude of the Airport
    "LONGITUDE" INT   NULL,
    CONSTRAINT "pk_airports" PRIMARY KEY (
        "IATA_CODE"
     )
);

-- Airlines
-- Table Airlines
CREATE TABLE "airlines" (
    -- IATA Airlines Code
    "IATA_CODE" TEXT   NOT NULL,
    -- Airline Name
    "AIRLINE" TEXT   NOT NULL,
    CONSTRAINT "pk_airlines" PRIMARY KEY (
        "IATA_CODE"
     )
);

-- Cancelled Flights
-- Table Cancelled Flights
CREATE TABLE "cancelled_flights" (
    -- ID
    "ID" TEXT   NOT NULL,
    -- Date
    "DATE" TEXT   NOT NULL,
    -- IATA Airline Code
    "AIRLINE_CODE" TEXT   NOT NULL,
    -- IATA Origin Airport Code
    "ORIGIN_AIRPORT_CODE" TEXT   NOT NULL,
    -- IATA Destination Airport Code
    "DESTINATION_AIRPORT_CODE" TEXT   NOT NULL,
    -- DOT Flight Cancellation Reason Code
    "CANCELLATION_REASON_CODE" TEXT   NOT NULL,
    CONSTRAINT "pk_cancelled_flights" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "cancelled_flights" ADD CONSTRAINT "fk_cancelled_flights_AIRLINE_CODE" FOREIGN KEY("AIRLINE_CODE")
REFERENCES "airlines" ("IATA_CODE");

ALTER TABLE "cancelled_flights" ADD CONSTRAINT "fk_cancelled_flights_ORIGIN_AIRPORT_CODE" FOREIGN KEY("ORIGIN_AIRPORT_CODE")
REFERENCES "airports" ("IATA_CODE");

ALTER TABLE "cancelled_flights" ADD CONSTRAINT "fk_cancelled_flights_DESTINATION_AIRPORT_CODE" FOREIGN KEY("DESTINATION_AIRPORT_CODE")
REFERENCES "airports" ("IATA_CODE");

ALTER TABLE "cancelled_flights" ADD CONSTRAINT "fk_cancelled_flights_CANCELLATION_REASON_CODE" FOREIGN KEY("CANCELLATION_REASON_CODE")
REFERENCES "cancellation_code" ("CANCELLATION_REASON_CODE");

-- Create view cancelled_flights_vw
-- Create view cancelled_flights_vw
create or replace view cancelled_flights_vw as (
 select cf."ID"
       ,cf."DATE" as "Date"
       ,cf."AIRLINE_CODE" as "Airline Code"
       ,al."AIRLINE" as "Airline"
       ,cf."ORIGIN_AIRPORT_CODE" as "Origin Airport Code"
       ,oap."AIRPORT" || ', ' || oap."CITY" || ', ' || oap."STATE" as "Origin Airport"
       ,cf."DESTINATION_AIRPORT_CODE" as "Destination Airport Code"
       ,dap."AIRPORT" || ', ' || dap."CITY" || ', ' || dap."STATE" as "Destination Airport"
       ,cf."CANCELLATION_REASON_CODE" as "Cancellation Code"
       ,cc."CANCELLATION_REASON" AS "Cancellation Reason"
   from cancelled_flights cf
        left join airlines as al on (cf."AIRLINE_CODE" = al."IATA_CODE")
        left join airports as oap on (cf."ORIGIN_AIRPORT_CODE" = oap."IATA_CODE")
        left join airports as dap on (cf."DESTINATION_AIRPORT_CODE" = dap."IATA_CODE")
        left join cancellation_code cc on (cf."CANCELLATION_REASON_CODE" = cc."CANCELLATION_REASON_CODE")
);