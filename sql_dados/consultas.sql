-- Função para cálculo de distância
CREATE OR REPLACE FUNCTION calculate_distance(lat1 float, lon1 float, lat2 float, lon2 float, units varchar)
RETURNS float AS $dist$
    DECLARE
        dist float = 0;
        radlat1 float;
        radlat2 float;
        theta float;
        radtheta float;
    BEGIN
        IF lat1 = lat2 AND lon1 = lon2
            THEN RETURN dist;
        ELSE
            radlat1 = pi() * lat1 / 180;
            radlat2 = pi() * lat2 / 180;
            theta = lon1 - lon2;
            radtheta = pi() * theta / 180;
            dist = sin(radlat1) * sin(radlat2) + cos(radlat1) * cos(radlat2) * cos(radtheta);

            IF dist > 1 THEN dist = 1; END IF;

            dist = acos(dist);
            dist = dist * 180 / pi();
            dist = dist * 60 * 1.1515;

            IF units = 'K' THEN dist = dist * 1.609344; END IF;
            IF units = 'N' THEN dist = dist * 0.8684; END IF;

            RETURN dist;
        END IF;
    END;
$dist$ LANGUAGE plpgsql;


-- Consulta 1: verificar a existência de pares presa, predador num determinado raio e espaço de dias. Retornar os nomes, descrição de relato, data e hora do relato de presa e predador, a distância entre os relatos em quilômetros e a diferença de dias entre os relatos.

SELECT
    apresa.nome AS presa,
    rpresa.data_hora AS dia_relato_presa,
    rpresa.descricao AS descricao_relato_presa,
    apredador.nome AS predador,
    rpredador.data_hora AS dia_relato_predador,
    rpredador.descricao AS descricao_relato_predador,
    calculate_distance(
    rpresa.latitude,
    rpresa.longitude,
    rpredador.latitude,
    rpredador.longitude, 'K') AS distancia_km,
    abs(EXTRACT (day from (rpresa.data_hora - rpredador.data_hora))) AS dias_diferenca

FROM relato rpresa
JOIN predacao p ON rpresa.animal = p.presa
JOIN animal apresa ON rpresa.animal = apresa.id
JOIN relato rpredador ON rpredador.animal = p.predador
JOIN animal apredador ON rpredador.animal = apredador.id
WHERE calculate_distance(
    rpresa.latitude,
    rpresa.longitude,
    rpredador.latitude,
    rpredador.longitude, 'K') < 1000
  AND
      abs(EXTRACT (day from (rpresa.data_hora - rpredador.data_hora))) < 30
ORDER BY distancia_km, dias_diferenca;
      
-- Consulta 2: Verificar possibilidades de "casais" de espécimes em um mesmo zoológico (Exemplo: pinguim macho com pinguim fêmea, cervo macho com cervo fêmea). Além disso, a diferença de idade entre as 2 espécimes deve ser menor do que 5 anos.
SELECT 
    e.nome, 
    e2.nome 
FROM especime e
JOIN especime e2 ON 
    e.zoologico = e2.zoologico AND 
    e.animal = e2.animal AND 
    (
        e.sexo = 'Masculino' AND
        e2.sexo = 'Feminino' AND
        (e.idade - e2.idade) < 5
    );

  
 -- Consulta 3: Veterinário que consultou todas as espécimes do seu zoológico
SELECT
    u.nome,
    u.documento,
    z.nome,
    z.cnpj
FROM veterinario v
JOIN funcionario f ON v.id = f.id
JOIN usuario u ON f.id = u.id
JOIN zoologico z ON f.zoologico = z.cnpj
WHERE NOT EXISTS(
        (SELECT
             e.id
         FROM especime e
         WHERE e.zoologico = f.zoologico)
        EXCEPT
        (SELECT
             c.especime
         FROM consulta c
         WHERE v.id = c.veterinario)
    );
    
-- Consulta 4: Animais que menos demandam consultas e atualizações de estado (custo menor a um zoológico) junto da quantidade de espécimes que demandam consulta e atualização. Apresentar nome do animal, quantidade de consultas, atualizações de estado e quantidade de espécimes, organizado de acordo com o menor número de consultas e atualizações.
SELECT
    a.id,
    a.nome,
    SUM (CASE WHEN c IS NOT NULL THEN 1 ELSE 0 END) AS contagem_consultas,
    SUM (CASE WHEN es IS NOT NULL THEN 1 ELSE 0 END) AS contagem_estados,
    contagem_especimes.qtde_especimes
FROM
    animal a
LEFT JOIN especime e on a.id = e.animal
LEFT JOIN consulta c on e.id = c.especime
LEFT JOIN estado es on e.id = es.especime
JOIN (SELECT
          ani.id,
          SUM (CASE WHEN e IS NOT NULL THEN 1 ELSE 0 END) AS qtde_especimes
      FROM
          animal ani
              LEFT JOIN especime e ON ani.id = e.animal
      GROUP BY ani.id) contagem_especimes ON a.id = contagem_especimes.id
GROUP BY a.id, contagem_especimes.qtde_especimes
HAVING contagem_especimes.qtde_especimes > 0
ORDER BY contagem_consultas, contagem_estados DESC;
  
  
-- Consulta 5: Ver quantas consultas cada veterinário fez, exibindo o nome do veterinário, seu documento, zoológico que trabalha e a quantidade:
 SELECT
    u.nome, u.documento, z.nome,
    SUM (CASE WHEN c IS NOT NULL THEN 1 ELSE 0 END) AS quantidade_de_consultas
FROM
     veterinario v join funcionario f on v.id = f.id join zoologico z on f.zoologico = z.cnpj join usuario u on  f.id = u.id
LEFT JOIN consulta c on v.id = c.veterinario
GROUP BY u.nome, u.documento, z.nome
ORDER BY SUM (CASE WHEN c IS NOT NULL THEN 1 ELSE 0 END) DESC;


-- Consulta 6: listar os nomes dos espécimes dos zoológicos, quais animais são, qual o gestor responsável pelo cadastro e o nome do zoológico em que mora
SELECT
    a.nome AS nome_animal, 
    e.nome AS nome_especime, 
    z.nome AS nome_zoologico, 
    u.nome AS nome_gestor
FROM especime e
JOIN zoologico z on z.cnpj = e.zoologico
JOIN animal a on e.animal = a.id
JOIN usuario u ON e.gestor = u.id
ORDER BY a.nome;
