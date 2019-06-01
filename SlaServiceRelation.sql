-- This query lists the Services linked to SLAs. It may help comparing with QA 
-- environments as well checking if all desired relations are match
-- Essa consulta lista os Serviços relacionados a SLAs. Ela pode ser útil para compara com ambientes de QA como
-- também verificar se as relações desejadas estão foram cumpridas no ambiente
-- LigeroSmart Ligero Smart
-- ((OTRS)) Community Edition
-- https://ligero.online
-- https://complemento.net.br 
select concat(l.name," - ",s.name) as SlaServiceRelation,
        ss.service_id,
        ss.sla_id,
        s.name as service,
        l.name as sla 
        from service_sla ss
left join service s on ss.service_id = s.id
left join sla l on ss.sla_id = l.id
