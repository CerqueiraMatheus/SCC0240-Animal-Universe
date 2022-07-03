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
      
      
  -- Consulta 2: Verificar possibilidades de "casais" de espécimes em um mesmo zoológico (Exemplo: pinguim macho com pinguim fêmea, cervo macho com cervo fêmea)
  -- Além disso, a diferença de idade entre as 2 espécimes deve ser menor do que 5 anos.
select e.nome, e2.nome from especime e
join especime e2 on e.zoologico = e2.zoologico and e.animal = e2.animal and (e.sexo = 'Masculino' and e2.sexo = 'Feminino' and (e.idade - e2.idade) < 5);

  
  
  
  
  
