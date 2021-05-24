--liquibase formatted sql

--changeset viniciusaugusto:1
CREATE TABLE usuario(
	id serial not null,
	nome text,
	data date default date(now()),
	CONSTRAINT usuario_pkey PRIMARY KEY (id)
);
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from information_schema.tables where table_schema = 'public' and table_name = 'usuario'