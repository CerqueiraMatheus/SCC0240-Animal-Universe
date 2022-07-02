CREATE TABLE ZOOLOGICO(
    CNPJ CHAR(14),
    NOME VARCHAR(50),
    ENDERECO VARCHAR(50),
    DESCRICAO VARCHAR(500),
    CONSTRAINT PK_ZOOLOGICO PRIMARY KEY (CNPJ)
);

--
-- USUARIO E DERIVADOS
--

CREATE SEQUENCE USUARIO_ID_SEQ;
CREATE TABLE USUARIO (
    ID NUMERIC(5) NOT NULL DEFAULT nextval('USUARIO_ID_SEQ'),
    DOCUMENTO VARCHAR(30) NOT NULL,
    NACIONALIDADE VARCHAR(50) NOT NULL,
    NOME VARCHAR(50),
    TIPO VARCHAR(20),
    CONSTRAINT PK_USUARIO PRIMARY KEY (ID),
    CONSTRAINT UN_USUARIO UNIQUE (DOCUMENTO, NACIONALIDADE)
);

CREATE TABLE BIOLOGO(
    ID NUMERIC(5),
    NIVEL VARCHAR(30),
    CURRICULO VARCHAR(2000),
    CONSTRAINT PK_BIOLOGO PRIMARY KEY (ID),
    CONSTRAINT FK_ID FOREIGN KEY (ID) REFERENCES USUARIO(ID)
);

CREATE TABLE FUNCIONARIO(
    ID NUMERIC(5),
    DATA_INICIO DATE,
    ZOOLOGICO VARCHAR(14) NOT NULL,
    TIPO VARCHAR(20),
    CONSTRAINT PK_FUNCIONARIO PRIMARY KEY (ID),
    CONSTRAINT FK_ID FOREIGN KEY (ID) REFERENCES USUARIO(ID),
    CONSTRAINT FK_ZOOLOGICO FOREIGN KEY (ZOOLOGICO) REFERENCES ZOOLOGICO(CNPJ)
);

CREATE TABLE CUIDADOR(
    ID NUMERIC(5),
    CONSTRAINT PK_CUIDADOR PRIMARY KEY (ID),
    CONSTRAINT FK_ID FOREIGN KEY (ID) REFERENCES FUNCIONARIO(ID)
);

CREATE TABLE VETERINARIO(
    ID NUMERIC(5),
    CONSTRAINT PK_VETERINARIO PRIMARY KEY (ID),
    CONSTRAINT FK_ID FOREIGN KEY (ID) REFERENCES FUNCIONARIO(ID)
);

CREATE TABLE GESTOR(
    ID NUMERIC(5),
    CONSTRAINT PK_GESTOR PRIMARY KEY (ID),
    CONSTRAINT FK_ID FOREIGN KEY (ID) REFERENCES FUNCIONARIO(ID)
);

CREATE TABLE ORGANIZACAO(
    ID NUMERIC(5),
    CONSTRAINT PK_ORGANIZACAO PRIMARY KEY (ID),
    CONSTRAINT FK_ID FOREIGN KEY (ID) REFERENCES USUARIO(ID)
);

CREATE TABLE CERTIFICACAO(
    ID NUMERIC(5),
    CERTIFICACAO VARCHAR(100),
    CONSTRAINT PK_CERTIFICACAO PRIMARY KEY (ID, CERTIFICACAO),
    CONSTRAINT FK_CERTIFICACAO FOREIGN KEY (ID) REFERENCES ORGANIZACAO(ID)
);

--
-- ALERTA E RELATO
--
CREATE SEQUENCE ALERTA_ID_SEQ;
CREATE TABLE ALERTA(
    ID NUMERIC(5) NOT NULL DEFAULT nextval('ALERTA_ID_SEQ'),
    BIOLOGO NUMERIC(5) NOT NULL,
    DATAHORA TIMESTAMP NOT NULL,
    DESCRICAO VARCHAR(500),
    CONSTRAINT PK_ALERTA PRIMARY KEY (ID),
    CONSTRAINT UN_ALERTA UNIQUE (BIOLOGO, DATAHORA),
    CONSTRAINT FK_BIOLOGO FOREIGN KEY (BIOLOGO) REFERENCES BIOLOGO(ID)
);

CREATE SEQUENCE ANIMAL_ID_SEQ;
CREATE TABLE ANIMAL(
    ID              NUMERIC(5) NOT NULL DEFAULT nextval('ANIMAL_ID_SEQ'),
    NOME_CIENTIFICO VARCHAR(50) NOT NULL,
    BIOLOGO         NUMERIC(5)  NOT NULL,
    NOME            VARCHAR(50),
    VERTEBRADO      BOOLEAN,
    NIVEL_TROFICO   VARCHAR(30),
    HABITAT         VARCHAR(100),
    FILO            VARCHAR(30),
    CLASSE          VARCHAR(30),
    ORDEM           VARCHAR(30),
    FAMILIA         VARCHAR(30),
    GENERO          VARCHAR(30),
    ESPECIE         VARCHAR(30),
    REPRODUCAO      VARCHAR(30),
    EXTINTO         BOOLEAN,
    DESCRICAO       VARCHAR(500),
    CONSTRAINT PK_ANIMAL PRIMARY KEY (ID),
    CONSTRAINT UN_ANIMAL UNIQUE (NOME_CIENTIFICO),
    CONSTRAINT FK_BIOLOGO FOREIGN KEY (BIOLOGO) REFERENCES BIOLOGO(ID)
);


CREATE SEQUENCE RELATO_ID_SEQ;
CREATE TABLE RELATO(
    ID NUMERIC(5) NOT NULL DEFAULT nextval('RELATO_ID_SEQ'),
    ANIMAL NUMERIC(5) NOT NULL,
    USUARIO NUMERIC(5) NOT NULL,
    DATA_HORA TIMESTAMP NOT NULL,
    ANIMAL_DETECTADO VARCHAR(40),
    LATITUDE DECIMAL(12,9),
    LONGITUDE DECIMAL(12, 9),
    DESCRICAO VARCHAR(500),
    CONSTRAINT PK_RELATO PRIMARY KEY (ID),
    CONSTRAINT UN_RELATO UNIQUE (ANIMAL, USUARIO, DATA_HORA),
    CONSTRAINT FK_ANIMAL FOREIGN KEY (ANIMAL) REFERENCES ANIMAL(ID),
    CONSTRAINT FK_USUARIO FOREIGN KEY (USUARIO) REFERENCES USUARIO(ID)
);

CREATE TABLE ALERTA_ORGANIZACAO(
    ALERTA NUMERIC(5),
    ORGANIZACAO NUMERIC(5),
    CONSTRAINT PK_ALERTA_ORGANIZACAO PRIMARY KEY (ALERTA, ORGANIZACAO),
    CONSTRAINT FK_ALERTA FOREIGN KEY (ALERTA) REFERENCES ALERTA(ID),
    CONSTRAINT FK_ORGANIZACAO FOREIGN KEY (ORGANIZACAO) REFERENCES ORGANIZACAO(ID)
);

CREATE TABLE ALERTA_RELATO(
    ALERTA NUMERIC(5),
    RELATO NUMERIC(5),
    CONSTRAINT PK_ALERTA_RELATO PRIMARY KEY (ALERTA, RELATO),
    CONSTRAINT FK_ALERTA FOREIGN KEY (ALERTA) REFERENCES ALERTA(ID),
    CONSTRAINT FK_RELATO FOREIGN KEY (RELATO) REFERENCES RELATO(ID)
);

CREATE SEQUENCE COMENTARIO_RELATO_ID_SEQ;
CREATE TABLE COMENTARIO_RELATO(
    ID NUMERIC(5) NOT NULL DEFAULT nextval('COMENTARIO_RELATO_ID_SEQ'),
    USUARIO NUMERIC(5) NOT NULL,
    RELATO NUMERIC(5) NOT NULL,
    DATA_HORA TIMESTAMP NOT NULL,
    DESCRICAO VARCHAR(500),
    COMENTARIO NUMERIC(5),
    CONSTRAINT PK_COMENTARIO_RELATO PRIMARY KEY (ID),
    CONSTRAINT UN_COMENTARIO_RELATO UNIQUE (USUARIO, RELATO, DATA_HORA),
    CONSTRAINT FK_USUARIO FOREIGN KEY (USUARIO) REFERENCES USUARIO(ID),
    CONSTRAINT FK_RELATO FOREIGN KEY (RELATO) REFERENCES RELATO(ID),
    CONSTRAINT FK_COMENTARIO FOREIGN KEY (COMENTARIO) REFERENCES COMENTARIO_RELATO(ID)
);

CREATE SEQUENCE COMENTARIO_ANIMAL_ID_SEQ;
CREATE TABLE COMENTARIO_ANIMAL(
    ID NUMERIC(5) NOT NULL DEFAULT nextval('COMENTARIO_ANIMAL_ID_SEQ'),
    USUARIO NUMERIC(5) NOT NULL,
    ANIMAL NUMERIC (5) NOT NULL,
    DATA_HORA TIMESTAMP NOT NULL,
    DESCRICAO VARCHAR(500),
    COMENTARIO NUMERIC(5),
    CONSTRAINT PK_COMENTARIO_ANIMAL PRIMARY KEY (ID),
    CONSTRAINT UN_COMENTARIO_ANIMAL UNIQUE (USUARIO, ANIMAL, DATA_HORA),
    CONSTRAINT FK_USUARIO FOREIGN KEY (USUARIO) REFERENCES USUARIO(ID),
    CONSTRAINT FK_ANIMAL FOREIGN KEY (ANIMAL) REFERENCES ANIMAL(ID),
    CONSTRAINT FK_COMENTARIO FOREIGN KEY (COMENTARIO) REFERENCES COMENTARIO_ANIMAL(ID)
);

CREATE TABLE FOTO(
    RELATO NUMERIC(5),
    FOTO VARCHAR(300),
    CONSTRAINT PK_FOTO PRIMARY KEY (RELATO, FOTO),
    CONSTRAINT FK_RELATO FOREIGN KEY (RELATO) REFERENCES RELATO(ID)
);

CREATE TABLE VIDEO(
    RELATO NUMERIC(5),
    VIDEO VARCHAR(300),
    CONSTRAINT PK_VIDEO PRIMARY KEY (RELATO, VIDEO),
    CONSTRAINT FK_RELATO FOREIGN KEY (RELATO) REFERENCES RELATO(ID)
);

CREATE TABLE AUDIO(
    RELATO NUMERIC(5),
    AUDIO VARCHAR(300),
    CONSTRAINT PK_AUDIO PRIMARY KEY (RELATO, AUDIO),
    CONSTRAINT FK_RELATO FOREIGN KEY (RELATO) REFERENCES RELATO(ID)
);

--
-- ESPÉCIME E DERIVADOS
--

CREATE SEQUENCE ESPECIME_ID_SEQ;
CREATE TABLE ESPECIME
(
    ID NUMERIC(5) NOT NULL DEFAULT nextval('ESPECIME_ID_SEQ'),
    NOME VARCHAR(50) NOT NULL,
    SEXO VARCHAR(10),
    IDADE NUMERIC(2),
    HABITOS VARCHAR(100),
    TEMPERAMENTO VARCHAR(20),
    ZOOLOGICO CHAR(14) NOT NULL,
    ANIMAL NUMERIC(5) NOT NULL,
    GESTOR NUMERIC(5) NOT NULL,
    CONSTRAINT PK_ESPECIME PRIMARY KEY (ID),
    CONSTRAINT FK_ZOOLOGICO FOREIGN KEY (ZOOLOGICO) REFERENCES ZOOLOGICO(CNPJ),
    CONSTRAINT FK_ANIMAL FOREIGN KEY (ANIMAL) REFERENCES ANIMAL(ID),
    CONSTRAINT FK_GESTOR FOREIGN KEY (GESTOR) REFERENCES GESTOR(ID)
);

CREATE TABLE ANIMAL_FOTO(
    ANIMAL NUMERIC(5),
    FOTO VARCHAR(300),
    CONSTRAINT PK_ANIMAL_FOTO PRIMARY KEY (ANIMAL, FOTO),
    CONSTRAINT FK_RELATO FOREIGN KEY (ANIMAL) REFERENCES ANIMAL(ID)
);

CREATE TABLE ANIMAL_VIDEO(
    ANIMAL NUMERIC(5),
    VIDEO VARCHAR(300),
    CONSTRAINT PK_ANIMAL_VIDEO PRIMARY KEY (ANIMAL, VIDEO),
    CONSTRAINT FK_RELATO FOREIGN KEY (ANIMAL) REFERENCES ANIMAL(ID)
);

CREATE TABLE ANIMAL_AUDIO(
    ANIMAL NUMERIC(5),
    AUDIO VARCHAR(300),
    CONSTRAINT PK_ANIMAL_AUDIO PRIMARY KEY (ANIMAL, AUDIO),
    CONSTRAINT FK_RELATO FOREIGN KEY (ANIMAL) REFERENCES ANIMAL(ID)
);

CREATE TABLE PREDACAO(
    PRESA NUMERIC(5),
    PREDADOR NUMERIC(5),
    CONSTRAINT PK_PREDACAO PRIMARY KEY (PRESA, PREDADOR),
    CONSTRAINT FK_PRESA FOREIGN KEY (PRESA) REFERENCES ANIMAL(ID),
    CONSTRAINT FK_PREDADOR FOREIGN KEY (PREDADOR) REFERENCES ANIMAL(ID)
);

CREATE TABLE APADRINHAMENTO(
    DATA_INICIAL DATE,
    DATA_FINAL DATE,
    ESPECIME NUMERIC(5),
    USUARIO NUMERIC(5),
    VALOR NUMERIC(6, 2),
    CONSTRAINT PK_APADRINHAMENTO PRIMARY KEY (DATA_INICIAL, DATA_FINAL, ESPECIME, USUARIO),
    CONSTRAINT FK_ESPECIME FOREIGN KEY (ESPECIME) REFERENCES ESPECIME(ID),
    CONSTRAINT FK_USUARIO FOREIGN KEY (USUARIO) REFERENCES USUARIO(ID)
);

CREATE TABLE ESTADO(
    DATAHORA TIMESTAMP,
    ESPECIME NUMERIC(5),
    CUIDADOR NUMERIC(5),
    CONDICAO_ESPECIME VARCHAR(200),
    CONSTRAINT PK_ESTADO PRIMARY KEY (DATAHORA, ESPECIME, CUIDADOR),
    CONSTRAINT FK_ESPECIME FOREIGN KEY (ESPECIME) REFERENCES ESPECIME(ID),
    CONSTRAINT FK_CUIDADOR FOREIGN KEY (CUIDADOR) REFERENCES CUIDADOR(ID)
);

CREATE TABLE CONSULTA(
    DATAHORA TIMESTAMP,
    ESPECIME NUMERIC(5),
    VETERINARIO NUMERIC(5),
    DIAGNOSTICO VARCHAR(250),
    TRATAMENTO VARCHAR(250),
    CONSTRAINT PK_CONSULTA PRIMARY KEY (DATAHORA, ESPECIME, VETERINARIO),
    CONSTRAINT FK_ESPECIME FOREIGN KEY (ESPECIME) REFERENCES ESPECIME(ID),
    CONSTRAINT FK_VETERINARIO FOREIGN KEY (VETERINARIO) REFERENCES VETERINARIO(ID)
);

