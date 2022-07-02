
-- 1. Usuário Comum
INSERT INTO usuario (documento, nacionalidade, nome) VALUES ('55883662129', 'Brasileiro', 'Alexandre Brito');

-- 2. Biólogos

-- Biólogo 1
INSERT INTO usuario (documento, nacionalidade, nome, tipo)
VALUES ('95310896716', 'Brasileiro', 'Matheus Bermudes Viana', 'Biólogo');
INSERT INTO biologo (id, nivel, curriculo)
VALUES ((SELECT(currval('usuario_id_seq'))), 'Graduação', 'Tem CRM de número 01 e trabalhou na FUNAI');

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
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO, TIPO) VALUES ((SELECT(currval('usuario_id_seq'))), '2020-12-08', 14301663000150, 'Gestor');
INSERT INTO GESTOR (ID) VALUES ((SELECT(currval('usuario_id_seq'))));

-- FUNCIONARIO VETERINARIO 'VIANA'
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('11849797', 'Colombiano', 'Matheus Viana', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO, TIPO)
VALUES ((SELECT(currval('usuario_id_seq'))), '2020-06-21', 14301663000150, 'Veterinário');
INSERT INTO VETERINARIO (ID) VALUES ((SELECT(currval('usuario_id_seq'))));

-- FUNCIONARIO CUIDADOR 'LUISA'
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('3755817', 'Italiano', 'Luisa Balleroni', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO, TIPO)
VALUES ((SELECT(currval('usuario_id_seq'))), '2022-02-16', 14301663000150, 'Cuidador');
INSERT INTO CUIDADOR (ID) VALUES ((SELECT(currval('usuario_id_seq'))));

-- Zoológico 2
INSERT INTO ZOOLOGICO (CNPJ, NOME, ENDERECO, DESCRICAO) VALUES (25301663000150, 'ZOO VITORIA', 'Enseada do Suá, Nº 69', 'Tartarugas, tubarões, e todo tipo de peixe!');

-- FUNCIONARIO GESTOR 'Claudio'
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('145555505503', 'Argentino', 'Claudio Bochecha', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO, TIPO)
VALUES ((SELECT(currval('usuario_id_seq'))), '2021-10-02', 25301663000150, 'Gestor');
INSERT INTO GESTOR (ID) VALUES ((SELECT(currval('usuario_id_seq'))));

-- FUNCIONARIO VETERINARIO 'Beatriz'
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('3770981236', 'Brasileiro', 'Beatriz Machado', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO, TIPO) VALUES ((SELECT(currval('usuario_id_seq'))), '2019-04-12', 25301663000150, 'Veterinário');
INSERT INTO VETERINARIO (ID) VALUES ((SELECT(currval('usuario_id_seq'))));

-- FUNCIONARIO CUIDADOR 'Belle Belinha'
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('133769420', 'Brasileiro', 'Belle Belinha', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO, TIPO) VALUES ((SELECT(currval('usuario_id_seq'))), '2022-06-25', 25301663000150, 'Cuidador');
INSERT INTO CUIDADOR (ID) VALUES ((SELECT(currval('usuario_id_seq'))));

-- Zoológico 3
INSERT INTO ZOOLOGICO (CNPJ, NOME, ENDERECO, DESCRICAO) VALUES (55321663333154, 'ZOO OSASCO', 'Rua das Laranjeiras, Nº 750', 'Répteis, Anfíbios, Mamíferos, e todo tipo de animal!');

-- FUNCIONARIO GESTOR 'Anderson'
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('14154300009', 'Brasileiro', 'Anderson Novaes', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO, TIPO) VALUES ((SELECT(currval('usuario_id_seq'))), '2020-05-15', 55321663333154, 'Gestor');
INSERT INTO GESTOR (ID) VALUES ((SELECT(currval('usuario_id_seq'))));

-- FUNCIONARIO VETERINARIO 'Elídio'
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('14154322308', 'Brasileiro', 'Elídio Sanna', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO, TIPO) VALUES ((SELECT(currval('usuario_id_seq'))), '2021-04-12', 55321663333154, 'Veterinário');
INSERT INTO VETERINARIO (ID) VALUES ((SELECT(currval('usuario_id_seq'))));

-- FUNCIONARIO CUIDADOR 'Daniel'
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('19154332009', 'Brasileiro', 'Daniel Nascimento', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO, TIPO) VALUES ((SELECT(currval('usuario_id_seq'))), '2022-02-16', 55321663333154, 'Cuidador');
INSERT INTO CUIDADOR (ID) VALUES ((SELECT(currval('usuario_id_seq'))));

-- FUNCIONARIO CUIDADOR 'CLODOALDO'
INSERT INTO usuario (documento, nacionalidade, nome, tipo) VALUES ('19555222559', 'Brasileiro', 'Clodoaldo Pereira', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO, TIPO) VALUES ((SELECT(currval('usuario_id_seq'))), '2022-04-16', 55321663333154, 'Cuidador');
INSERT INTO CUIDADOR (ID) VALUES ((SELECT(currval('usuario_id_seq'))));



-- ANIMAL 1: ONÇA-PINTADA
INSERT INTO ANIMAL (NOME_CIENTIFICO, BIOLOGO, NOME, VERTEBRADO, NIVEL_TROFICO, HABITAT,
                    FILO, CLASSE, ORDEM, FAMILIA, GENERO, ESPECIE, REPRODUCAO, EXTINTO, DESCRICAO)
VALUES ('Panthera onca', 2, 'Onça-pintada', true, 'Consumidor', 'Florestas tropicais', 'Chordata',
        'Mammalia', 'Carnivora', 'Felídeos', 'Panthera', 'Panthera onca', 'Sexuada', false, 'A onça-pintada ou jaguar, também conhecida como onça-preta, é uma espécie de mamífero carnívoro da família dos felídeos encontrada nas Américas. É o terceiro maior felino do mundo, após o tigre e o leão, e o maior do continente americano.');

INSERT INTO ANIMAL_FOTO (ANIMAL, FOTO) VALUES (1, 'https://static.mundoeducacao.uol.com.br/mundoeducacao/2022/01/onca-pintada.jpg');
INSERT INTO ANIMAL_AUDIO (ANIMAL, AUDIO) VALUES (1, 'https://www.youtube.com/watch?v=c8ffwglAX7A&ab_channel=wesleypradoII');
INSERT INTO ANIMAL_VIDEO (ANIMAL, VIDEO) VALUES (1, 'https://www.youtube.com/shorts/SMX9cepqyRo');

-- ANIMAL 2: CERVO
INSERT INTO ANIMAL (NOME_CIENTIFICO, BIOLOGO, NOME, VERTEBRADO, NIVEL_TROFICO, HABITAT,
                    FILO, CLASSE, ORDEM, FAMILIA, GENERO, ESPECIE, REPRODUCAO, EXTINTO, DESCRICAO)
VALUES ('Blastocerus dichotomus', 3, 'Cervo-do-pantanal', true, 'Consumidor', 'Cerrado', 'Chordata',
        'Mammalia', 'Artiodáctilos', 'Cervídeos', 'Blastocerus', 'Blastocerus dichotomus', 'Sexuada', false, 'O cervo-do-pantanal é o maior veado da América do Sul, com quase 200 cm de comprimento e até 2,1 metros de altura.');

INSERT INTO ANIMAL_FOTO (ANIMAL, FOTO) VALUES (2, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Cervo_do_pantano.jpg/420px-Cervo_do_pantano.jpg');
INSERT INTO ANIMAL_AUDIO (ANIMAL, AUDIO) VALUES (2, 'https://www.youtube.com/watch?v=c8ffwglAX7A&ab_channel=wesleypradoII');
INSERT INTO ANIMAL_VIDEO (ANIMAL, VIDEO) VALUES (2, 'https://www.youtube.com/watch?v=gxekKBYEB5w&ab_channel=CantinhoSelvagem');

-- ANIMAL 3: CAPIVARA
INSERT INTO ANIMAL (NOME_CIENTIFICO, BIOLOGO, NOME, VERTEBRADO, NIVEL_TROFICO, HABITAT,
                    FILO, CLASSE, ORDEM, FAMILIA, GENERO, ESPECIE, REPRODUCAO, EXTINTO, DESCRICAO)
VALUES ('Hydrochoerus hydrochaeris', 4, 'Capivara', true, 'Consumidor', 'Lagos', 'Chordata',
        'Mammalia', 'Rodentia', 'Caviidae', 'Hydrochoerus', 'Hydrochoerus hydrochaeris', 'Sexuada', false, 'É o maior roedor do mundo, pesando até 91 kg e medindo até 1,2 m de comprimento e 60 cm de altura. A pelagem é densa, de cor avermelhada a marrom escuro.');

INSERT INTO ANIMAL_FOTO (ANIMAL, FOTO) VALUES (3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Capybara_%28Hydrochoerus_hydrochaeris%29.JPG/420px-Capybara_%28Hydrochoerus_hydrochaeris%29.JPG');
INSERT INTO ANIMAL_AUDIO (ANIMAL, AUDIO) VALUES (3, 'https://www.youtube.com/watch?v=R3yqKpMiG2Q&ab_channel=CanalInacredit%C3%A1vel');
INSERT INTO ANIMAL_VIDEO (ANIMAL, VIDEO) VALUES (3, 'https://www.youtube.com/watch?v=wNzmHIAapZ8&ab_channel=Neg%C3%B3ciosdaTerra');

-- ANIMAL 4: PINGUIM
INSERT INTO ANIMAL (NOME_CIENTIFICO, BIOLOGO, NOME, VERTEBRADO, NIVEL_TROFICO, HABITAT,
                    FILO, CLASSE, ORDEM, FAMILIA, GENERO, ESPECIE, REPRODUCAO, EXTINTO, DESCRICAO)
VALUES ('Spheniscus magellanicus', 4, 'Pinguim-de-Magalhães', true, 'Consumidor', 'Águas temperadas, zonas costeiras da Argentina, Chile e Ilhas Malvinas', 'Chordata',
        'Aves', 'Sphenisciformes', 'Spheniscidae', 'Spheniscus', 'Spheniscus magellanicus', 'Sexuada', false, 'O pinguim-de-magalhães tem estatura média de 70 cm. A sua plumagem é negra nas costas e nas asas, e branca na zona ventral e no pescoço. A maior parte dos exemplares tem na cabeça uma risca branca.');

INSERT INTO ANIMAL_FOTO (ANIMAL, FOTO) VALUES (3, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Magellanic-penguin02.jpg/420px-Magellanic-penguin02.jpg');
INSERT INTO ANIMAL_AUDIO (ANIMAL, AUDIO) VALUES (3, 'https://www.youtube.com/watch?v=O2WHwWmA_Ro&ab_channel=BinhoDF3');
INSERT INTO ANIMAL_VIDEO (ANIMAL, VIDEO) VALUES (3, 'https://www.youtube.com/watch?v=kJwgLTgcE_0&ab_channel=Aqu%C3%A1riodeUbatuba');

-- PREDAÇÃO 1: ONÇA X CERVO
INSERT INTO PREDACAO (PRESA, PREDADOR) VALUES (2, 1);


-- RELATO + ALERTA 1 - Bermudes
INSERT INTO RELATO (ANIMAL, USUARIO, DATA_HORA, ANIMAL_DETECTADO, LATITUDE, LONGITUDE, DESCRICAO)
VALUES (1, 2, '2022-04-06 15:30:00', 'Onça-pintada', -23.55052, -46.633309, 'Avistei uma onça preta nas redondezas do campus 2 da USP, parecia estar fraca e magra.');

INSERT INTO ALERTA (BIOLOGO, DATAHORA, DESCRICAO) VALUES ( 3, '2022-04-06 15:54:30', 'Foi relatada a presença de uma onça preta no campus 2 da USP, precisamos enviar alguém para analisar a situação.');
INSERT INTO ALERTA_ORGANIZACAO (ALERTA, ORGANIZACAO) VALUES (1, 6);
INSERT INTO ALERTA_RELATO (ALERTA, RELATO) VALUES (1, 1);
INSERT INTO FOTO(RELATO, FOTO) VALUES (1, 'https://img.freepik.com/fotos-gratis/bela-e-rara-onca-preta-no-brasil-panthera-onca_437937-1741.jpg');
INSERT INTO VIDEO(RELATO, VIDEO) VALUES (1, 'https://www.youtube.com/watch?v=oWtTqZqMl3g&ab_channel=ca%C3%A7aepescapvh');
INSERT INTO AUDIO(RELATO, AUDIO) VALUES (1, 'https://www.youtube.com/watch?v=l9r4vyIfLV8&ab_channel=MATHEUSTIGER');
INSERT INTO comentario_relato (usuario, relato, data_hora, descricao)
VALUES (1, 1, '2022-04-06 15:40:04', 'Que belo animal! Espero que ela fique bem!');
INSERT INTO comentario_animal (usuario, animal, data_hora, descricao)
VALUES (1, 1, '2022-04-06 17:50:30', 'Muito bonita! Sabiam que a pantera negra pertence à mesma espécie que a onça-pintada?')
--

-- RELATO + ALERTA 2 - Belle Belinha
INSERT INTO RELATO (ANIMAL, USUARIO, DATA_HORA, ANIMAL_DETECTADO, LATITUDE, LONGITUDE, DESCRICAO)
VALUES (2, 3, '2022-05-06 15:05:15', 'Cervo-do-pantanal', -26.2295, -52.6716, 'Avistei o que parece ser um cervo andando perto da minha fazenda, ele parecia machucado.');
INSERT INTO ALERTA (BIOLOGO, DATAHORA, DESCRICAO)
VALUES (4, '2022-05-06 15:15:30', 'Foi relatada a presença de um cervo machucado próximo à fazenda Rico Caipira, precisamos enviar alguém para checar o estado do animal.');
INSERT INTO ALERTA_ORGANIZACAO (ALERTA, ORGANIZACAO) VALUES (2, 7);
INSERT INTO ALERTA_RELATO (ALERTA, RELATO) VALUES (2, 2);
INSERT INTO FOTO(RELATO, FOTO) VALUES (2, 'https://www.coisasdaroca.com/wp-content/uploads/2021/04/cervo-do-pantanal.jpg');
INSERT INTO VIDEO(RELATO, VIDEO) VALUES (2, 'https://www.youtube.com/watch?v=gxekKBYEB5w&ab_channel=CantinhoSelvagem');
INSERT INTO AUDIO(RELATO, AUDIO) VALUES (2, 'https://www.youtube.com/shorts/pgFj735CgH4');
INSERT INTO comentario_relato (usuario, relato, data_hora, descricao)
VALUES (15, 2, '2022-05-06 15:40:04', 'Oh, que cervo bonito! Espero que ele fique bem.');
INSERT INTO comentario_animal (usuario, animal, data_hora, descricao)
VALUES (15, 2, '2022-05-06 17:50:30', 'Cervos são muito bonitos, amo estes animais');
--

-- Espécimes ZOOLOGICO 1

-- Espécime 1
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor) VALUES ('Paçoca', 'Femininino', 18, 'Gosta de carinho', 'Mansa', 14301663000150, 1, (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Brasileiro' AND u.documento = '14155200708')));

-- Espécime 2
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor) VALUES ('Café', 'Masculino', 3, 'Brincalhão', 'Manso', 14301663000150, 2, (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Brasileiro' AND u.documento = '14155200708')));

-- Espécime 3
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor) VALUES ('Lentilha', 'Femininino', 10, 'Gosta de correr', 'Amigável', 14301663000150, 3, (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Brasileiro' AND u.documento = '14155200708')));

-- Espécime 4
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor) VALUES ('Feijão', 'Masculino', 20, 'Não brinca', 'Bravo', 14301663000150, 4, (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Brasileiro' AND u.documento = '14155200708')));


-- Espécimes ZOOLOGICO 2

-- Espécime 5
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor) VALUES ('Mojito', 'Masculino', 18, 'Morde a pata', 'Arisco', 25301663000150, 1, (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Argentino' AND u.documento = '145555505503')));

-- Espécime 6
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor) VALUES ('Tequila', 'Femininino', 18, 'Corre atrás do cuidador', 'Medrosa', 25301663000150, 2, (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Argentino' AND u.documento = '145555505503')));

-- Espécime 7
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor) VALUES ('Gin', 'Masculino', 18, 'Gosta de carinho', 'Bravo', 25301663000150, 3, (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Argentino' AND u.documento = '145555505503')));

-- Espécime 8
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor) VALUES ('Paçoca', 'Femininino', 18, 'Dorme de barriga para cima', 'Brincalhona', 25301663000150, 4, (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Argentino' AND u.documento = '145555505503')));

-- Espécimes ZOOLOGICO 3

-- Espécime 9
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor) VALUES ('Recife', 'Masculino', 2, 'Dormir', 'Calmo', 55321663333154, 1, (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Brasileiro' AND u.documento = '14154300009')));

-- Espécime 10
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor) VALUES ('Pinda', 'Femininino', 5, 'Brincar com cuidador', 'Medrosa', 55321663333154, 2, (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Brasileiro' AND u.documento = '14154300009')));

-- Espécime 11
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor) VALUES ('Salvador', 'Masculino', 7, 'Gosta de carinho', 'Arisco', 55321663333154, 3, (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Brasileiro' AND u.documento = '14154300009')));

-- Espécime 12
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor) VALUES ('Marília', 'Femininino', 9, 'Dorme de barriga para cima', 'Brincalhona', 55321663333154, 4, (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Brasileiro' AND u.documento = '14154300009')));

-- CONSULTA 1 : ESPECIME -> CAFÉ, VETERINÁRIO: Matheus Viana
INSERT INTO consulta (datahora, especime, veterinario, diagnostico, tratamento)
VALUES ('2022-07-20 11:50:00', 2, 11, 'Infecção bacteriana nas patas traseiras', 'Utilização de antibiótico todo dia às 10h da manhã.');

-- ESTADO 1 :
INSERT INTO estado (datahora, especime, cuidador, condicao_especime)
VALUES ('2022-07-30 10:10:00', 2, 12, 'Está bem, com as patas curadas');
