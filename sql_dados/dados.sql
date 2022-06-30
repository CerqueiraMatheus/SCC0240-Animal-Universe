-- 1. Usuário Comum
INSERT INTO usuario (documento, nacionalidade, nome) VALUES ('55883662129', 'Brasileiro', 'Alexandre Brito');

-- 2. Biólogos

-- Biólogo 1
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('95310896716', 'Brasileiro', 'Matheus Bermudes Viana', 'Biólogo');
INSERT INTO biologo (id, nivel, curriculo) VALUES ((SELECT(currval('usuario_id_seq'))), 'Graduação', 'Tem CRM de número 01 e trabalhou na FUNAI');

-- Biólogo 2
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('99221587010', 'Colombiano', 'Gabriel Freitas Ximenes de Vasconcelos', 'Biólogo');
INSERT INTO biologo (id, nivel, curriculo) VALUES ((SELECT(currval('usuario_id_seq'))), 'Mestrado', 'Tem CRM de número 02 e trabalhou no IBAMA');

-- Biólogo 3
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('27821758310', 'Uruguaio', 'Matheus Henrique de Cerqueira Pinto', 'Biólogo');
INSERT INTO biologo (id, nivel, curriculo) VALUES ((SELECT(currval('usuario_id_seq'))), 'Graduação', 'Tem CRM de número 03 e trabalhou no IBAMA');

-- Biólogo 4
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('15087406823', 'Polonês', 'Raissa Torres Barreira', 'Biólogo');
INSERT INTO biologo (id, nivel, curriculo) VALUES ((SELECT(currval('usuario_id_seq'))), 'Mestrado', 'Tem CRM de número 04 e trabalhou na ANA');

-- 3. Organizações

-- Organização 1
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('51.504.667/0001-62', 'Brasileiro', 'UIPA', 'Organização');
INSERT INTO organizacao (id) VALUES ((SELECT(currval('usuario_id_seq'))));

-- Organização 2
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('02.451.194/0001-77', 'Polonês', 'Tierheim', 'Organização');
INSERT INTO organizacao (id) VALUES ((SELECT(currval('usuario_id_seq'))));

-- Organização 3
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('78.314.368/0001-11', 'Brasileiro', 'SOPRAP', 'Organização');
INSERT INTO organizacao (id) VALUES ((SELECT(currval('usuario_id_seq'))));

-- Organização 4
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('18.657.421/0001-55', 'Brasileiro', 'ANDA', 'Organização');
INSERT INTO organizacao (id) VALUES ((SELECT(currval('usuario_id_seq'))));

-- 4. Zoológicos e funcionários de zoológico

-- Zoológico 1
INSERT INTO ZOOLOGICO (CNPJ, NOME, ENDERECO, DESCRICAO) VALUES (14301663000150, 'ZOO SAO CARLOS', 'RUA DOS BOBOS, Nº 0', 'VOU PARTIR COM ELES PRA MADAGASCAR');

-- FUNCIONARIO GESTOR 'BERMUDES'
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('14155200708', 'Brasileiro', 'Matheus Bermudes', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO) VALUES ((SELECT(currval('usuario_id_seq'))), '2020-12-08', 14301663000150);
INSERT INTO GESTOR (ID) VALUES ((SELECT(currval('usuario_id_seq'))));

-- FUNCIONARIO VETERINARIO 'VIANA'
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('11849797', 'Colombiano', 'Matheus Viana', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO)
VALUES ((SELECT(currval('usuario_id_seq'))), '2020-06-21', 14301663000150);
INSERT INTO VETERINARIO (ID) VALUES ((SELECT(currval('usuario_id_seq'))));

-- FUNCIONARIO CUIDADOR 'LUISA'
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('3755817', 'Italiano', 'Luisa Balleroni', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO)
VALUES ((SELECT(currval('usuario_id_seq'))), '2022-02-16', 14301663000150);
INSERT INTO CUIDADOR (ID) VALUES ((SELECT(currval('usuario_id_seq'))));

-- Zoológico 2
INSERT INTO ZOOLOGICO (CNPJ, NOME, ENDERECO, DESCRICAO) VALUES (25301663000150, 'ZOO VITORIA', 'Enseada do Suá, Nº 69', 'Tartarugas, tubarões, e todo tipo de peixe!');

-- FUNCIONARIO GESTOR 'Claudio'
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('145555505503', 'Argentino', 'Claudio Bochecha', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO)
VALUES ((SELECT(currval('usuario_id_seq'))), '2021-10-02', 25301663000150);
INSERT INTO GESTOR (ID) VALUES ((SELECT(currval('usuario_id_seq'))));

-- FUNCIONARIO VETERINARIO 'Beatriz'
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('3770981236', 'Brasileiro', 'Beatriz Machado', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO) VALUES ((SELECT(currval('usuario_id_seq'))), '2019-04-12', 25301663000150);
INSERT INTO VETERINARIO (ID) VALUES ((SELECT(currval('usuario_id_seq'))));

-- FUNCIONARIO CUIDADOR 'Belle Belinha'
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('133769420', 'Brasileiro', 'Belle Belinha', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO) VALUES ((SELECT(currval('usuario_id_seq'))), '2022-06-25', 25301663000150);
INSERT INTO CUIDADOR (ID) VALUES ((SELECT(currval('usuario_id_seq'))));

-- Zoológico 3
INSERT INTO ZOOLOGICO (CNPJ, NOME, ENDERECO, DESCRICAO) VALUES (55321663333154, 'ZOO OSASCO', 'Rua das Laranjeiras, Nº 750', 'Répteis, Anfíbios, Mamíferos, e todo tipo de animal!');

-- FUNCIONARIO GESTOR 'Anderson'
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('14154300009', 'Brasileiro', 'Anderson Novaes', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO) VALUES ((SELECT(currval('usuario_id_seq'))), '2020-05-15', 55321663333154);
INSERT INTO GESTOR (ID) VALUES ((SELECT(currval('usuario_id_seq'))));

-- FUNCIONARIO VETERINARIO 'Elídio'
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('14154322309', 'Brasileiro', 'Elídio Sanna', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO) VALUES ((SELECT(currval('usuario_id_seq'))), '2021-04-12', 55321663333154);
INSERT INTO VETERINARIO (ID) VALUES ((SELECT(currval('usuario_id_seq'))));

-- FUNCIONARIO CUIDADOR 'Daniel'
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('19154332009', 'Brasileiro', 'Daniel Nascimento', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO) VALUES ((SELECT(currval('usuario_id_seq'))), '2022-02-16', 55321663333154);
INSERT INTO CUIDADOR (ID) VALUES ((SELECT(currval('usuario_id_seq'))));
