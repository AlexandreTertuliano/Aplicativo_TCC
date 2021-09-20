--liquibase formatted sql

--changeset danilocgraciano:0
CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;
--preconditions onFail:HALT onError:HALT

--changeset viniciusfaria:1
CREATE TABLE public.clinica (
	id serial NOT NULL,
	name_clinica text NOT NULL,
	cnpj_clinica text NOT NULL,
	telefone_clinica text,
	cep_clinica text,
	estado_clinica text,
	cidade_clinica text,
	bairro_clinica text,
	rua_clinica text,
	numero_clinica text,
);
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from information_schema.tables where table_schema = 'public' and table_name = 'clinica'
