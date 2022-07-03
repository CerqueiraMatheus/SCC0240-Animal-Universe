--
-- Usuário
--

INSERT INTO usuario (documento, nacionalidade, nome)
VALUES ('55883662129', 'Brasileiro', 'Alexandre Brito');

--
-- Biólogo
--

-- Biólogo 1
INSERT INTO usuario (documento, nacionalidade, nome, tipo)
VALUES ('95310896716', 'Brasileiro', 'Matheus Bermudes Viana', 'Biólogo');
INSERT INTO biologo (id, nivel, curriculo)
VALUES ((SELECT(currval('usuario_id_seq'))), 'Graduação', 'Tem CRM de número 01 e trabalhou na FUNAI');

-- Biólogo 2
INSERT INTO usuario (documento, nacionalidade, nome, tipo)
VALUES ('99221587010', 'Colombiano', 'Gabriel Freitas Ximenes de Vasconcelos', 'Biólogo');
INSERT INTO biologo (id, nivel, curriculo)
VALUES ((SELECT(currval('usuario_id_seq'))), 'Mestrado', 'Tem CRM de número 02 e trabalhou no IBAMA');

-- Biólogo 3
INSERT INTO usuario (documento, nacionalidade, nome, tipo)
VALUES ('27821758310', 'Uruguaio', 'Matheus Henrique de Cerqueira Pinto', 'Biólogo');
INSERT INTO biologo (id, nivel, curriculo)
VALUES ((SELECT(currval('usuario_id_seq'))), 'Graduação', 'Tem CRM de número 03 e trabalhou no IBAMA');

-- Biólogo 4
INSERT INTO usuario (documento, nacionalidade, nome, tipo)
VALUES ('15087406823', 'Polonês', 'Raissa Torres Barreira', 'Biólogo');
INSERT INTO biologo (id, nivel, curriculo)
VALUES ((SELECT(currval('usuario_id_seq'))), 'Mestrado', 'Tem CRM de número 04 e trabalhou na ANA');

--
-- Organizações
--

-- Organização 1
INSERT INTO usuario (documento, nacionalidade, nome, tipo)
VALUES ('51.504.667/0001-62', 'Brasileiro', 'UIPA', 'Organização');
INSERT INTO organizacao (id)
VALUES ((SELECT(currval('usuario_id_seq'))));
INSERT INTO certificacao (organizacao, certificacao)
VALUES (6, 'ISO 14001');
-- Organização 2
INSERT INTO usuario (documento, nacionalidade, nome, tipo)
VALUES ('02.451.194/0001-77', 'Polonês', 'Tierheim', 'Organização');
INSERT INTO organizacao (id)
VALUES ((SELECT(currval('usuario_id_seq'))));
INSERT INTO certificacao (organizacao, certificacao)
VALUES (7, 'ISO 9001');
-- Organização 3
INSERT INTO usuario (documento, nacionalidade, nome, tipo)
VALUES ('78.314.368/0001-11', 'Brasileiro', 'SOPRAP', 'Organização');
INSERT INTO organizacao (id)
VALUES ((SELECT(currval('usuario_id_seq'))));
INSERT INTO certificacao (organizacao, certificacao)
VALUES (8, 'ISO 14001104');
-- Organização 4
INSERT INTO usuario (documento, nacionalidade, nome, tipo)
VALUES ('18.657.421/0001-55', 'Brasileiro', 'ANDA', 'Organização');
INSERT INTO organizacao (id)
VALUES ((SELECT(currval('usuario_id_seq'))));
INSERT INTO certificacao (organizacao, certificacao)
VALUES (9, 'ISO 14001104');

--
-- Zoológicos e funcionários de zoológico
--

-- Zoológico 1
INSERT INTO ZOOLOGICO (CNPJ, NOME, ENDERECO, DESCRICAO)
VALUES (14301663000150, 'ZOO SAO CARLOS', 'RUA DOS BOBOS, Nº 0', 'VOU PARTIR COM ELES PRA MADAGASCAR');

-- Funcionário gestor 'BERMUDES'
INSERT INTO usuario (documento, nacionalidade, nome, tipo)
VALUES ('14155200708', 'Brasileiro', 'Matheus Bermudes', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO, TIPO)
VALUES ((SELECT(currval('usuario_id_seq'))), '2020-12-08', 14301663000150, 'Gestor');
INSERT INTO GESTOR (ID)
VALUES ((SELECT(currval('usuario_id_seq'))));

-- Funcionário veterinário 'VIANA'
INSERT INTO usuario (documento, nacionalidade, nome, tipo)
VALUES ('11849797', 'Colombiano', 'Matheus Viana', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO, TIPO)
VALUES ((SELECT(currval('usuario_id_seq'))), '2020-06-21', 14301663000150, 'Veterinário');
INSERT INTO VETERINARIO (ID)
VALUES ((SELECT(currval('usuario_id_seq'))));

-- Funcionário cuidador 'LUISA'
INSERT INTO usuario (documento, nacionalidade, nome, tipo)
VALUES ('3755817', 'Italiano', 'Luisa Balleroni', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO, TIPO)
VALUES ((SELECT(currval('usuario_id_seq'))), '2022-02-16', 14301663000150, 'Cuidador');
INSERT INTO CUIDADOR (ID)
VALUES ((SELECT(currval('usuario_id_seq'))));

-- Zoológico 2
INSERT INTO ZOOLOGICO (CNPJ, NOME, ENDERECO, DESCRICAO)
VALUES (25301663000150, 'ZOO VITORIA', 'Enseada do Suá, Nº 69', 'Tartarugas, tubarões, e todo tipo de peixe!');

-- Funcionário gestor 'Claudio'
INSERT INTO usuario (documento, nacionalidade, nome, tipo)
VALUES ('145555505503', 'Argentino', 'Claudio Bochecha', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO, TIPO)
VALUES ((SELECT(currval('usuario_id_seq'))), '2021-10-02', 25301663000150, 'Gestor');
INSERT INTO GESTOR (ID)
VALUES ((SELECT(currval('usuario_id_seq'))));

-- Funcionário veterinário 'Beatriz'
INSERT INTO usuario (documento, nacionalidade, nome, tipo)
VALUES ('3770981236', 'Brasileiro', 'Beatriz Machado', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO, TIPO)
VALUES ((SELECT(currval('usuario_id_seq'))), '2019-04-12', 25301663000150, 'Veterinário');
INSERT INTO VETERINARIO (ID)
VALUES ((SELECT(currval('usuario_id_seq'))));

-- Funcionário cuidador 'Belle Belinha'
INSERT INTO usuario (documento, nacionalidade, nome, tipo)
VALUES ('133769420', 'Brasileiro', 'Belle Belinha', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO, TIPO)
VALUES ((SELECT(currval('usuario_id_seq'))), '2022-06-25', 25301663000150, 'Cuidador');
INSERT INTO CUIDADOR (ID)
VALUES ((SELECT(currval('usuario_id_seq'))));

-- Zoológico 3
INSERT INTO ZOOLOGICO (CNPJ, NOME, ENDERECO, DESCRICAO)
VALUES (55321663333154, 'ZOO OSASCO', 'Rua das Laranjeiras, Nº 750',
        'Répteis, Anfíbios, Mamíferos, e todo tipo de animal!');

-- Funcionário gestor 'Anderson'
INSERT INTO usuario (documento, nacionalidade, nome, tipo)
VALUES ('14154300009', 'Brasileiro', 'Anderson Novaes', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO, TIPO)
VALUES ((SELECT(currval('usuario_id_seq'))), '2020-05-15', 55321663333154, 'Gestor');
INSERT INTO GESTOR (ID)
VALUES ((SELECT(currval('usuario_id_seq'))));

-- Funcionário veterinário 'Elídio'
INSERT INTO usuario (documento, nacionalidade, nome, tipo)
VALUES ('14154322308', 'Brasileiro', 'Elídio Sanna', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO, TIPO)
VALUES ((SELECT(currval('usuario_id_seq'))), '2021-04-12', 55321663333154, 'Veterinário');
INSERT INTO VETERINARIO (ID)
VALUES ((SELECT(currval('usuario_id_seq'))));

-- Funcionário cuidador 'Daniel'
INSERT INTO usuario (documento, nacionalidade, nome, tipo)
VALUES ('19154332009', 'Brasileiro', 'Daniel Nascimento', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO, TIPO)
VALUES ((SELECT(currval('usuario_id_seq'))), '2022-02-16', 55321663333154, 'Cuidador');
INSERT INTO CUIDADOR (ID)
VALUES ((SELECT(currval('usuario_id_seq'))));

-- Funcionário cuidador 'CLODOALDO'
INSERT INTO usuario (documento, nacionalidade, nome, tipo)
VALUES ('19555222559', 'Brasileiro', 'Clodoaldo Pereira', 'Funcionário');
INSERT INTO FUNCIONARIO (id, DATA_INICIO, ZOOLOGICO, TIPO)
VALUES ((SELECT(currval('usuario_id_seq'))), '2022-04-16', 55321663333154, 'Cuidador');
INSERT INTO CUIDADOR (ID)
VALUES ((SELECT(currval('usuario_id_seq'))));

--
-- Animais
--

-- ANIMAL 1: ONÇA-PINTADA
INSERT INTO ANIMAL (NOME_CIENTIFICO, BIOLOGO, NOME, VERTEBRADO, NIVEL_TROFICO, HABITAT,
                    FILO, CLASSE, ORDEM, FAMILIA, GENERO, ESPECIE, REPRODUCAO, EXTINTO, DESCRICAO)
VALUES ('Panthera onca', 2, 'Onça-pintada', true, 'Consumidor', 'Florestas tropicais', 'Chordata',
        'Mammalia', 'Carnivora', 'Felídeos', 'Panthera', 'Panthera onca', 'Sexuada', false,
        'A onça-pintada ou jaguar, também conhecida como onça-preta, é uma espécie de mamífero carnívoro da família dos felídeos encontrada nas Américas. É o terceiro maior felino do mundo, após o tigre e o leão, e o maior do continente americano.');

INSERT INTO ANIMAL_FOTO (ANIMAL, FOTO)
VALUES (1, 'https://static.mundoeducacao.uol.com.br/mundoeducacao/2022/01/onca-pintada.jpg');
INSERT INTO ANIMAL_AUDIO (ANIMAL, AUDIO)
VALUES (1, 'https://www.youtube.com/watch?v=c8ffwglAX7A&ab_channel=wesleypradoII');
INSERT INTO ANIMAL_VIDEO (ANIMAL, VIDEO)
VALUES (1, 'https://www.youtube.com/shorts/SMX9cepqyRo');

-- ANIMAL 2: CERVO
INSERT INTO ANIMAL (NOME_CIENTIFICO, BIOLOGO, NOME, VERTEBRADO, NIVEL_TROFICO, HABITAT,
                    FILO, CLASSE, ORDEM, FAMILIA, GENERO, ESPECIE, REPRODUCAO, EXTINTO, DESCRICAO)
VALUES ('Blastocerus dichotomus', 3, 'Cervo-do-pantanal', true, 'Consumidor', 'Cerrado', 'Chordata',
        'Mammalia', 'Artiodáctilos', 'Cervídeos', 'Blastocerus', 'Blastocerus dichotomus', 'Sexuada', false,
        'O cervo-do-pantanal é o maior veado da América do Sul, com quase 200 cm de comprimento e até 2,1 metros de altura.');

INSERT INTO ANIMAL_FOTO (ANIMAL, FOTO)
VALUES (2, 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Cervo_do_pantano.jpg/420px-Cervo_do_pantano.jpg');
INSERT INTO ANIMAL_AUDIO (ANIMAL, AUDIO)
VALUES (2, 'https://www.youtube.com/watch?v=c8ffwglAX7A&ab_channel=wesleypradoII');
INSERT INTO ANIMAL_VIDEO (ANIMAL, VIDEO)
VALUES (2, 'https://www.youtube.com/watch?v=gxekKBYEB5w&ab_channel=CantinhoSelvagem');

-- ANIMAL 3: CAPIVARA
INSERT INTO ANIMAL (NOME_CIENTIFICO, BIOLOGO, NOME, VERTEBRADO, NIVEL_TROFICO, HABITAT,
                    FILO, CLASSE, ORDEM, FAMILIA, GENERO, ESPECIE, REPRODUCAO, EXTINTO, DESCRICAO)
VALUES ('Hydrochoerus hydrochaeris', 4, 'Capivara', true, 'Consumidor', 'Lagos', 'Chordata',
        'Mammalia', 'Rodentia', 'Caviidae', 'Hydrochoerus', 'Hydrochoerus hydrochaeris', 'Sexuada', false,
        'É o maior roedor do mundo, pesando até 91 kg e medindo até 1,2 m de comprimento e 60 cm de altura. A pelagem é densa, de cor avermelhada a marrom escuro.');

INSERT INTO ANIMAL_FOTO (ANIMAL, FOTO)
VALUES (3,
        'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Capybara_%28Hydrochoerus_hydrochaeris%29.JPG/420px-Capybara_%28Hydrochoerus_hydrochaeris%29.JPG');
INSERT INTO ANIMAL_AUDIO (ANIMAL, AUDIO)
VALUES (3, 'https://www.youtube.com/watch?v=R3yqKpMiG2Q&ab_channel=CanalInacredit%C3%A1vel');
INSERT INTO ANIMAL_VIDEO (ANIMAL, VIDEO)
VALUES (3, 'https://www.youtube.com/watch?v=wNzmHIAapZ8&ab_channel=Neg%C3%B3ciosdaTerra');

-- ANIMAL 4: PINGUIM
INSERT INTO ANIMAL (NOME_CIENTIFICO, BIOLOGO, NOME, VERTEBRADO, NIVEL_TROFICO, HABITAT,
                    FILO, CLASSE, ORDEM, FAMILIA, GENERO, ESPECIE, REPRODUCAO, EXTINTO, DESCRICAO)
VALUES ('Spheniscus magellanicus', 4, 'Pinguim-de-Magalhães', true, 'Consumidor',
        'Águas temperadas, zonas costeiras da Argentina, Chile e Ilhas Malvinas', 'Chordata',
        'Aves', 'Sphenisciformes', 'Spheniscidae', 'Spheniscus', 'Spheniscus magellanicus', 'Sexuada', false,
        'O pinguim-de-magalhães tem estatura média de 70 cm. A sua plumagem é negra nas costas e nas asas, e branca na zona ventral e no pescoço. A maior parte dos exemplares tem na cabeça uma risca branca.');

INSERT INTO ANIMAL_FOTO (ANIMAL, FOTO)
VALUES (3,
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Magellanic-penguin02.jpg/420px-Magellanic-penguin02.jpg');
INSERT INTO ANIMAL_AUDIO (ANIMAL, AUDIO)
VALUES (3, 'https://www.youtube.com/watch?v=O2WHwWmA_Ro&ab_channel=BinhoDF3');
INSERT INTO ANIMAL_VIDEO (ANIMAL, VIDEO)
VALUES (3, 'https://www.youtube.com/watch?v=kJwgLTgcE_0&ab_channel=Aqu%C3%A1riodeUbatuba');

-- ANIMAL 5: LOBO-GUARÁ
INSERT INTO ANIMAL (NOME_CIENTIFICO, BIOLOGO, NOME, VERTEBRADO, NIVEL_TROFICO, HABITAT,
                    FILO, CLASSE, ORDEM, FAMILIA, GENERO, ESPECIE, REPRODUCAO, EXTINTO, DESCRICAO)
VALUES ('Chrysocyon brachyurus', 2, 'Lobo-guará', true, 'Consumidor', 'Cerrado', 'Chordata','Mammalia', 'Carnívoro', 'Canídeos', 'Chrysocyon', 'C. brachyurus', 'Sexuada', false, 'O lobo-guará (nome científico: Chrysocyon brachyurus), também chamado guará, aguará, aguaraçu, lobo-de-crina, lobo-de-juba e lobo-vermelho, é uma espécie de canídeo endêmico da América do Sul.');

-- ANIMAL 6: TAMANDUÁ-BANDEIRA
INSERT INTO ANIMAL (NOME_CIENTIFICO, BIOLOGO, NOME, VERTEBRADO, NIVEL_TROFICO, HABITAT,
                    FILO, CLASSE, ORDEM, FAMILIA, GENERO, ESPECIE, REPRODUCAO, EXTINTO, DESCRICAO)
VALUES ('Myrmecophaga tridactyla', 3, 'Tamanduá-bandeira', true, 'Consumidor', 'Ambientes florestados', 'Chordata', 'Mammalia', 'Pilosa', 'Mirmecofagídeos', 'Myrmecophaga', 'M. tridactyla', 'Sexuada', false, 'Ele mede cerca de 2,20 metros, pesa até 45kg, tem uma cauda grande e com pelos grossos e compridos e um focinho longo. O tamanduá-bandeira (Myrmecophaga tridactyla) usa suas garras dianteiras para escavar vários formigueiros e cupinzeiros ao longo do dia para capturar, com sua língua extensível, até 30 mil formigas e cupins.');


-- ANIMAL 7: Jacaré-Açu
INSERT INTO ANIMAL (NOME_CIENTIFICO, BIOLOGO, NOME, VERTEBRADO, NIVEL_TROFICO, HABITAT,
                    FILO, CLASSE, ORDEM, FAMILIA, GENERO, ESPECIE, REPRODUCAO, EXTINTO, DESCRICAO)
VALUES ('Melanosuchus niger', 3, 'Jacaré-Açu', true, 'Consumidor',
        'Rios e Lagos', 'Chordata','Reptilia', 'Crocodylia', 'Alligatoridae', 'Melanosuchus', 'Melanosuchus niger', 'Sexuada', false, 'O jacaré-açu é uma espécie de jacaré exclusiva da América do Sul. Também conhecido como jacaré-negro ou jacaré-preto, é um predador de topo de cadeia alimentar.');

--
-- Predação
--

-- PREDAÇÃO 1: ONÇA X CERVO
INSERT INTO PREDACAO (presa, predador)
VALUES (2, 1);

-- PREDAÇÃO 2: ONÇA X CAPIVARA
INSERT INTO PREDACAO (presa, predador)
VALUES (3, 1);

-- PREDAÇÃO 3: ONÇA X LOBO-GUARÁ
INSERT INTO PREDACAO (presa, predador)
VALUES (5, 1);

-- PREDAÇÃO 4: ONÇA X TAMANDUÁ-BANDEIRA
INSERT INTO PREDACAO (presa, predador)
VALUES (6, 1);

-- PREDAÇÃO 5: LOBO-GUARÁ X TAMANDUÁ-BANDEIRA
INSERT INTO PREDACAO (presa, predador)
VALUES (6, 5);

-- Predação 6: Jacaré x Capivara
INSERT INTO PREDACAO (PRESA, PREDADOR) VALUES (3, 5);

--
-- Relatos e alertas
--

-- RELATO + ALERTA 1 - Bermudes
INSERT INTO RELATO (ANIMAL, USUARIO, DATA_HORA, ANIMAL_DETECTADO, LATITUDE, LONGITUDE, DESCRICAO)
VALUES (1, 2, '2022-04-06 15:30:00', 'Onça-pintada', -23.55052, -46.633309,
        'Avistei uma onça preta nas redondezas do campus 2 da USP, parecia estar fraca e magra.');

INSERT INTO ALERTA (BIOLOGO, DATAHORA, DESCRICAO)
VALUES (3, '2022-04-06 15:54:30',
        'Foi relatada a presença de uma onça preta no campus 2 da USP, precisamos enviar alguém para analisar a situação.');
INSERT INTO ALERTA_ORGANIZACAO (ALERTA, ORGANIZACAO)
VALUES (1, 6);
INSERT INTO ALERTA_RELATO (ALERTA, RELATO)
VALUES (1, 1);
INSERT INTO FOTO(RELATO, FOTO)
VALUES (1, 'https://img.freepik.com/fotos-gratis/bela-e-rara-onca-preta-no-brasil-panthera-onca_437937-1741.jpg');
INSERT INTO VIDEO(RELATO, VIDEO)
VALUES (1, 'https://www.youtube.com/watch?v=oWtTqZqMl3g&ab_channel=ca%C3%A7aepescapvh');
INSERT INTO AUDIO(RELATO, AUDIO)
VALUES (1, 'https://www.youtube.com/watch?v=l9r4vyIfLV8&ab_channel=MATHEUSTIGER');
INSERT INTO comentario_relato (usuario, relato, data_hora, descricao)
VALUES (1, 1, '2022-04-06 15:40:04', 'Que belo animal! Espero que ela fique bem!');
INSERT INTO comentario_animal (usuario, animal, data_hora, descricao)
VALUES (1, 1, '2022-04-06 17:50:30',
        'Muito bonita! Sabiam que a pantera negra pertence à mesma espécie que a onça-pintada?');
--

-- RELATO + ALERTA 2 - Belle Belinha
INSERT INTO RELATO (ANIMAL, USUARIO, DATA_HORA, ANIMAL_DETECTADO, LATITUDE, LONGITUDE, DESCRICAO)
VALUES (2, 3, '2022-05-06 15:05:15', 'Cervo-do-pantanal', -26.2295, -52.6716,
        'Avistei o que parece ser um cervo andando perto da minha fazenda, ele parecia machucado.');
INSERT INTO ALERTA (BIOLOGO, DATAHORA, DESCRICAO)
VALUES (4, '2022-05-06 15:15:30',
        'Foi relatada a presença de um cervo machucado próximo à fazenda Rico Caipira, precisamos enviar alguém para checar o estado do animal.');
INSERT INTO ALERTA_ORGANIZACAO (ALERTA, ORGANIZACAO)
VALUES (2, 7);
INSERT INTO ALERTA_RELATO (ALERTA, RELATO)
VALUES (2, 2);
INSERT INTO FOTO(RELATO, FOTO)
VALUES (2, 'https://www.coisasdaroca.com/wp-content/uploads/2021/04/cervo-do-pantanal.jpg');
INSERT INTO VIDEO(RELATO, VIDEO)
VALUES (2, 'https://www.youtube.com/watch?v=gxekKBYEB5w&ab_channel=CantinhoSelvagem');
INSERT INTO AUDIO(RELATO, AUDIO)
VALUES (2, 'https://www.youtube.com/shorts/pgFj735CgH4');
INSERT INTO comentario_relato (usuario, relato, data_hora, descricao)
VALUES (15, 2, '2022-05-06 15:40:04', 'Oh, que cervo bonito! Espero que ele fique bem.');
INSERT INTO comentario_animal (usuario, animal, data_hora, descricao)
VALUES (15, 2, '2022-05-06 17:50:30', 'Cervos são muito bonitos, amo estes animais');

-- RELATO 3
INSERT INTO RELATO (ANIMAL, USUARIO, DATA_HORA, ANIMAL_DETECTADO, LATITUDE, LONGITUDE, DESCRICAO)
VALUES (3, 1, '2022-05-22 12:00:10', 'Capivara', -23.1593, -49.9718,
        'Tinha uma capivara andando no centro da cidade.');

-- RELATO 4
INSERT INTO RELATO (ANIMAL, USUARIO, DATA_HORA, ANIMAL_DETECTADO, LATITUDE, LONGITUDE, DESCRICAO)
VALUES (3, 1, '2022-01-22 12:00:10', 'Capivara', -23.1593, -49.9718,
        'Uma capivara invadiu minha casa');

-- RELATO 5
INSERT INTO RELATO (ANIMAL, USUARIO, DATA_HORA, ANIMAL_DETECTADO, LATITUDE, LONGITUDE, DESCRICAO)
VALUES (3, 3, '2022-01-05 12:00:10', 'Capivara', -25.4372, -49.2700,
        'Vi uma capivara no lago');

-- RELATO 6
INSERT INTO RELATO (ANIMAL, USUARIO, DATA_HORA, ANIMAL_DETECTADO, LATITUDE, LONGITUDE, DESCRICAO)
VALUES (3, 3, '2022-01-05 18:00:10', 'Capivara', -25.4372, -49.2700,
        'Capivaras nadando no lago');

-- RELATO 7
INSERT INTO RELATO (ANIMAL, USUARIO, DATA_HORA, ANIMAL_DETECTADO, LATITUDE, LONGITUDE, DESCRICAO)
VALUES (5, 2, '2022-03-05 18:00:10', 'Lobo', -23.2940, -50.0774,
        'Lobo perto da rodoviária');

-- RELATO 8
INSERT INTO RELATO (ANIMAL, USUARIO, DATA_HORA, ANIMAL_DETECTADO, LATITUDE, LONGITUDE, DESCRICAO)
VALUES (5, 4, '2022-03-15 18:00:00', 'Lobo', -23.2940, -50.0774,
        'Um lobo matou um cachorro');

-- RELATO 9
INSERT INTO RELATO (ANIMAL, USUARIO, DATA_HORA, ANIMAL_DETECTADO, LATITUDE, LONGITUDE, DESCRICAO)
VALUES (6, 4, '2022-04-05 18:00:00', 'Tamanduá', -23.0418, -50.0737,
        'Vi um tamanduá atropelado');

-- RELATO 10
INSERT INTO RELATO (ANIMAL, USUARIO, DATA_HORA, ANIMAL_DETECTADO, LATITUDE, LONGITUDE, DESCRICAO)
VALUES (1, 6, '2022-04-05 23:00:00', 'Onça', -23.1593, -49.9718,
        'Vi uma onça na Usina');

--
-- Espécimes
--

-- Espécimes ZOOLOGICO 1

-- Espécime 1
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor)
VALUES ('Paçoca', 'Femininino', 18, 'Gosta de carinho', 'Mansa', 14301663000150, 1,
        (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Brasileiro' AND u.documento = '14155200708')));

-- Espécime 2
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor)
VALUES ('Café', 'Masculino', 3, 'Brincalhão', 'Manso', 14301663000150, 2,
        (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Brasileiro' AND u.documento = '14155200708')));

-- Espécime 3
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor)
VALUES ('Lentilha', 'Femininino', 10, 'Gosta de correr', 'Amigável', 14301663000150, 3,
        (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Brasileiro' AND u.documento = '14155200708')));

-- Espécime 4
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor)
VALUES ('Feijão', 'Masculino', 20, 'Não brinca', 'Bravo', 14301663000150, 4,
        (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Brasileiro' AND u.documento = '14155200708')));


-- Espécimes ZOOLOGICO 2

-- Espécime 5
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor)
VALUES ('Mojito', 'Masculino', 18, 'Morde a pata', 'Arisco', 25301663000150, 1,
        (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Argentino' AND u.documento = '145555505503')));

-- Espécime 6
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor)
VALUES ('Tequila', 'Femininino', 18, 'Corre atrás do cuidador', 'Medrosa', 25301663000150, 2,
        (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Argentino' AND u.documento = '145555505503')));

-- Espécime 7
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor)
VALUES ('Gin', 'Masculino', 18, 'Gosta de carinho', 'Bravo', 25301663000150, 3,
        (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Argentino' AND u.documento = '145555505503')));

-- Espécime 8
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor)
VALUES ('Paçoca', 'Femininino', 18, 'Dorme de barriga para cima', 'Brincalhona', 25301663000150, 4,
        (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Argentino' AND u.documento = '145555505503')));

-- Espécimes ZOOLOGICO 3

-- Espécime 9
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor)
VALUES ('Recife', 'Masculino', 2, 'Dormir', 'Calmo', 55321663333154, 1,
        (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Brasileiro' AND u.documento = '14154300009')));

-- Espécime 10
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor)
VALUES ('Pinda', 'Femininino', 5, 'Brincar com cuidador', 'Medrosa', 55321663333154, 2,
        (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Brasileiro' AND u.documento = '14154300009')));

-- Espécime 11
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor)
VALUES ('Salvador', 'Masculino', 7, 'Gosta de carinho', 'Arisco', 55321663333154, 3,
        (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Brasileiro' AND u.documento = '14154300009')));

-- Espécime 12
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor)
VALUES ('Marília', 'Femininino', 9, 'Dorme de barriga para cima', 'Brincalhona', 55321663333154, 4,
        (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Brasileiro' AND u.documento = '14154300009')));
        
-- Espécime 13
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor)
VALUES ('Arroz', 'Feminino', 19, 'Gosta de dormir', 'Tranquila', 14301663000150, 4, (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Brasileiro' AND u.documento = '14155200708')));

-- Espécime 14
INSERT INTO especime (nome, sexo, idade, habitos, temperamento, zoologico, animal, gestor) 
VALUES ('Farofa', 'Feminino', 18, 'Gosta de nadar', 'Agitada', 14301663000150, 4, (SELECT u.id FROM usuario u WHERE (u.nacionalidade = 'Brasileiro' AND u.documento = '14155200708')));


--
-- Consultas e atualizações de estado
--

-- Zoológico 1

-- CONSULTA 1 : ESPECIME -> Paçoca, VETERINÁRIO: Matheus Viana
INSERT INTO consulta (datahora, especime, veterinario, diagnostico, tratamento)
VALUES ('2022-07-20 11:50:00', 1, 11, 'Infecção bacteriana nas patas traseiras',
        'Utilização de antibiótico todo dia às 10h da manhã.');

-- ESTADO 1 :
INSERT INTO estado (datahora, especime, cuidador, condicao_especime)
VALUES ('2022-07-30 10:10:00', 1, 12, 'Está bem, com as patas curadas');

-- CONSULTA 2 : ESPECIME -> CAFÉ, VETERINÁRIO: Matheus Viana
INSERT INTO consulta (datahora, especime, veterinario, diagnostico, tratamento)
VALUES ('2022-05-07 10:50:00', 2, 11, 'Está com as patas um pouco queimadas',
        'Utilização de gaze e curativo e um remédio para queimadura.');

-- ESTADO 2 :
INSERT INTO estado (datahora, especime, cuidador, condicao_especime)
VALUES ('2022-05-07 15:30:00', 2, 12, 'Está melhorando bem. Está saudável.');

-- CONSULTA 3
INSERT INTO consulta (datahora, especime, veterinario, diagnostico, tratamento)
VALUES ('2022-05-07 16:00:00', 3, 11, 'Está com verme', 'Utilização de vermífugo');

-- ESTADO 3 :
INSERT INTO estado (datahora, especime, cuidador, condicao_especime)
VALUES ('2022-05-10 16:00:00', 3, 12, 'Está completamente saudável.');

-- CONSULTA 4:
INSERT INTO consulta (datahora, especime, veterinario, diagnostico, tratamento)
VALUES ('2022-05-12 16:00:00', 4, 11, 'Está com um machucado superficial na barriga.',
        'Pomada na superfície da barriga, massageando-a');

-- ESTADO 4:
INSERT INTO estado (datahora, especime, cuidador, condicao_especime)
VALUES ('2022-05-20 16:00:00', 4, 12, 'O machucado sarou completamente. Está saudável.');

-- Zoológico 2

-- CONSULTA 5 : ESPECIME -> Mojito, VETERINÁRIO: Beatriz Machado
INSERT INTO consulta (datahora, especime, veterinario, diagnostico, tratamento)
VALUES ('2020-07-20 12:00:00', 5, 14, 'Corte profundo no pescoço',
        'Necessita de limpeza diária do ferimento e troca de curativos');

-- ESTADO 5 : ESPECIME -> Mojito, CUIDADOR:
INSERT INTO estado (datahora, especime, cuidador, condicao_especime)
VALUES ('2020-07-22 12:00:00', 5, 15, 'Curativos trocados, recuperando');

-- CONSULTA 6 : ESPECIME -> Mojito, VETERINÁRIO: Beatriz Machado
INSERT INTO consulta (datahora, especime, veterinario, diagnostico, tratamento)
VALUES ('2020-07-28 12:00:00', 5, 14, 'Ferida em cicatrização no pescoço',
        'Necessita de remoção de curativos intensos');

-- ESTADO 6 : ESPECIME -> Mojito, CUIDADOR: Belle Belinha
INSERT INTO estado (datahora, especime, cuidador, condicao_especime)
VALUES ('2020-07-29 12:00:00', 5, 15, 'Curativos removidos');

-- CONSULTA 7 : ESPECIME -> Tequila, VETERINÁRIO: Beatriz Machado
INSERT INTO consulta (datahora, especime, veterinario, diagnostico, tratamento)
VALUES ('2021-05-28 12:00:00', 6, 14, 'Tristeza profunda', 'Necessita de passeios com a cuidadora');

-- ESTADO 7 : ESPECIME -> Tequila, CUIDADOR: Belle Belinha
INSERT INTO estado (datahora, especime, cuidador, condicao_especime)
VALUES ('2021-05-29 12:00:00', 6, 15, 'Passeio realizado, Tequila feliz.');

-- CONSULTA 8 : ESPECIME -> Gin, VETERINÁRIO: Beatriz Machado
INSERT INTO consulta (datahora, especime, veterinario, diagnostico, tratamento)
VALUES ('2021-04-23 12:00:00', 7, 14, 'Dente quebrado', 'Necessita de anestésicos por 3 dias');

-- ESTADO 8 : ESPECIME -> Gin, CUIDADOR: Belle Belinha
INSERT INTO estado (datahora, especime, cuidador, condicao_especime)
VALUES ('2021-04-26 12:00:00', 7, 15, 'Tratamento finalizado, Gin recuperado');

-- Zoológico 3

-- CONSULTA 9:
INSERT INTO consulta (datahora, especime, veterinario, diagnostico, tratamento)
VALUES ('2022-04-15 16:00:00', 9, 17, 'Está com queimaduras na barriga', 'Pomada na superfície da barriga, massageando-a');

-- ESTADO 9:
INSERT INTO estado (datahora, especime, cuidador, condicao_especime)
VALUES ('2022-04-20 16:00:00', 9, 18, 'O machucado sarou completamente. Está saudável.');

-- CONSULTA 10:
INSERT INTO consulta (datahora, especime, veterinario, diagnostico, tratamento)
VALUES ('2022-04-25 16:00:00', 10, 17, 'Está com queimaduras nas patas da frente',
        'Aplicação de pomada para queimaduras na pata, e mantê-las enfaixadas.');

-- ESTADO 10:
INSERT INTO estado (datahora, especime, cuidador, condicao_especime)
VALUES ('2022-05-20 16:00:00', 10, 18, 'As patas estão perfeitas e o animal está saudável.');

--
-- Apadrinhamentos
--

-- APADRINHAMENTO 1
insert into apadrinhamento (data_inicial, data_final, especime, usuario, valor)
VALUES ('2022-08-01', '2022-12-01', 1, 1, 1040);

-- APADRINHAMENTO 2
insert into apadrinhamento (data_inicial, data_final, especime, usuario, valor)
VALUES ('2022-08-10', '2022-12-10', 2, 2, 930);

-- APADRINHAMENTO 3
insert into apadrinhamento (data_inicial, data_final, especime, usuario, valor)
VALUES ('2022-09-01', '2022-12-20', 3, 3, 510);

-- APADRINHAMENTO 4
insert into apadrinhamento (data_inicial, data_final, especime, usuario, valor)
VALUES ('2022-09-01', '2022-12-20', 4, 4, 1180);

-- APADRINHAMENTO 5
insert into apadrinhamento (data_inicial, data_final, especime, usuario, valor)
VALUES ('2022-09-30', '2022-12-30', 5, 5, 1060);

