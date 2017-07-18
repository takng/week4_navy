--
-- PostgreSQL database dump
--
CREATE DATABASE navy;
\c navy
CREATE SCHEMA navy;



-- Dumped from database version 9.2.0
-- Dumped by pg_dump version 9.2.0
-- Started on 2013-05-19 16:05:10 BST

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 7 (class 2615 OID 32769)
-- Name: cd; Type: SCHEMA; Schema: -; Owner: -
--

SET search_path = navy, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;


DROP TABLE IF EXISTS fleet CASCADE;
DROP TABLE IF EXISTS ships CASCADE;
DROP TABLE IF EXISTS sailors CASCADE;
DROP TABLE IF EXISTS duties CASCADE;
DROP TABLE IF EXISTS rank CASCADE;
 
 
CREATE TABLE fleet (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200) NOT NULL
);
 
CREATE TABLE ships (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  date_built DATE NOT NULL,
  fleet_id INTEGER NOT NULL
);
 
CREATE TABLE sailors (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  date_of_birth DATE NOT NULL,
  active_duty VARCHAR(200),
  duty_id INTEGER,
  rank_id INTEGER
);
 
CREATE TABLE duties (
  id SERIAL PRIMARY KEY,
  start_date DATE,
  end_date DATE,
  ship_id INTEGER
);
 
CREATE TABLE rank (
  id SERIAL PRIMARY KEY,
  title VARCHAR(200)
);

ALTER TABLE "navy"."ships" ADD FOREIGN KEY ("fleet_id") REFERENCES "navy"."fleet"("id");

ALTER TABLE "navy"."duties" ADD FOREIGN KEY ("ship_id") REFERENCES "navy"."ships"("id");

ALTER TABLE "navy"."sailors"
  ADD FOREIGN KEY ("duty_id") REFERENCES "navy"."duties"("id"),
  ADD FOREIGN KEY ("rank_id") REFERENCES "navy"."rank"("id");


ANALYZE;

