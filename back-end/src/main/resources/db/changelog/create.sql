--liquibase formatted sql

--changeset viniciusaugusto:0
CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;
--preconditions onFail:HALT onError:HALT

--changeset viniciusfaria:1
CREATE TABLE public.heroku_c0741e1536a4e62.teste (
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

--changeset viniciusfaria:2
CREATE TABLE public.heroku_c0741e1536a4e62.agenda (
	id serial NOT NULL,
	dados_agenda datetime NOT NULL,
	ocupado_agenda text NOT NULL,

);
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from information_schema.tables where table_schema = 'public' and table_name = 'agenda'

--changeset viniciusfaria:3
CREATE TABLE public.heroku_c0741e1536a4e62.carteira (
	id serial NOT NULL,

);
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from information_schema.tables where table_schema = 'public' and table_name = 'carteira'

--changeset viniciusfaria:4
CREATE TABLE public.heroku_c0741e1536a4e62.paciente (
	id serial NOT NULL,
	name_paciente text NOT NULL,
	cpf_paciente text NOT NULL,
	dn_paciente text,
	telefone_paciente text,
	cidade_paciente text,
	bairro_paciente text,
	rua_paciente text,
	tipo_sangue_paciente text,
	genero_paciente text,
	doador_paciente text,
	email_paciente text,
	CONSTRAINT carteira_id PRIMARY KEY(id)
);
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from information_schema.tables where table_schema = 'public' and table_name = 'paciente'

--changeset viniciusfaria:5
CREATE TABLE public.heroku_c0741e1536a4e62.cadastro (
	id serial NOT NULL,
	email text NOT NULL,
	senha text NOT NULL,
	paciente_id text,
	carteira_id text 
);
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from information_schema.tables where table_schema = 'public' and table_name = 'carteira'

--changeset viniciusfaria:6
CREATE TABLE public.heroku_c0741e1536a4e62.medico (
	id serial NOT NULL,
	name_medico text NOT NULL,
	crm_medico text NOT NULL,
	telefone_medico text,
	especialidade_medico text,
	clinica_id text,
	cateira_id text,
	agenda_id text,
	cadastro_id text
);
--preconditions onFail:MARK_RAN onError:HALT
--precondition-sql-check expectedResult:0 select count(*) from information_schema.tables where table_schema = 'public' and table_name = 'medico'

