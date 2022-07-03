-- usuario
INSERT INTO usuario (documento, nacionalidade, nome) VALUES ('55883662129', 'Brasileiro', 'Alexandre Brito');

-- biologo
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('95310896716', 'Brasileiro', 'Matheus Bermudes Viana', 'Biólogo');
INSERT INTO biologo (id, nivel, curriculo) VALUES ((SELECT(currval('usuario_id_seq'))), 'Graduação', 'Tem CRM de número 01 e trabalhou na FUNAI');

-- organizacao
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('51.504.667/0001-62', 'Brasileiro', 'UIPA', 'Organização');
INSERT INTO organizacao (id) VALUES ((SELECT(currval('usuario_id_seq'))));

-- funcionario
INSERT INTO USUARIO (DOCUMENTO, NACIONALIDADE, NOME, TIPO) VALUES ('14155200708', 'Brasileiro', 'Matheus Bermudes', 'Funcionário');
INSERT INTO FUNCIONARIO (ID, DATA_INICIO, ZOOLOGICO, TIPO) VALUES ((SELECT(currval('usuario_id_seq'))), '2020-12-08', 14301663000150, 'Gestor');

-- gestor
INSERT INTO USUARIO (DOCUMENTO, NACIONALIDADE, NOME, TIPO) VALUES ('14155200708', 'Brasileiro', 'Matheus Bermudes', 'Funcionário');
INSERT INTO FUNCIONARIO (ID, DATA_INICIO, ZOOLOGICO, TIPO) VALUES ((SELECT(currval('usuario_id_seq'))), '2020-12-08', 14301663000150, 'Gestor');
INSERT INTO GESTOR (ID) VALUES ((SELECT(currval('usuario_id_seq'))));

-- veterinario
INSERT INTO USUARIO (DOCUMENTO, NACIONALIDADE, NOME, TIPO) VALUES ('11849797', 'Colombiano', 'Matheus Viana', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO, TIPO) VALUES ((SELECT(currval('usuario_id_seq'))), '2020-06-21', 14301663000150, 'Veterinário');
INSERT INTO VETERINARIO (ID) VALUES ((SELECT(currval('usuario_id_seq'))));

-- cuidador
INSERT INTO USUARIO (DOCUMENTO, NACIONALIDADE, NOME, TIPO) VALUES ('3755817', 'Italiano', 'Luisa Balleroni', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO, TIPO) VALUES ((SELECT(currval('usuario_id_seq'))), '2022-02-16', 14301663000150, 'Cuidador');
INSERT INTO CUIDADOR (ID) VALUES ((SELECT(currval('usuario_id_seq'))));