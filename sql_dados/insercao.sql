-- usuario do biologo
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES (%s, %s, %s, %s);
-- tornar usuario biologo
INSERT INTO biologo (id, nivel, curriculo) VALUES ((SELECT(currval('usuario_id_seq'))), %s, %s);

-- tornar usuario organizacao
INSERT INTO organizacao (id) VALUES ((SELECT(currval('usuario_id_seq'))));

-- tornar usuario funcionario
INSERT INTO FUNCIONARIO (ID, DATA_INICIO, ZOOLOGICO, TIPO) VALUES ((SELECT(currval('usuario_id_seq'))), %s, %s, %s);

-- tornar funcionario gestor
INSERT INTO GESTOR (ID) VALUES ((SELECT(currval('usuario_id_seq'))));

-- tornar funcionario veterinario
INSERT INTO VETERINARIO (ID) VALUES ((SELECT(currval('usuario_id_seq'))));

-- tornar funcionario cuidador
INSERT INTO CUIDADOR (ID) VALUES ((SELECT(currval('usuario_id_seq'))));

-- Fim do arquivo