-- This query lists the Services and it's SLAs, only the valid ones
-- Essa consulta lista os Serviços e seus SLAs (apenas válidos)
-- LigeroSmart Ligero Smart
-- ((OTRS)) Community Edition
-- https://ligero.online
-- https://complemento.net.br 
SELECT s.name as service, group_concat(l.name) as slas FROM service_sla ss
inner join service s on ss.service_id=s.id and s.valid_id=1
left join sla l on ss.sla_id=l.id and l.valid_id=1
group by s.name
