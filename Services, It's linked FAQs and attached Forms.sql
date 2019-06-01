-- This query lists all services and it's relations to Forms created using Forms AddOn from Ligero Subscription
-- and the linked FAQs for Ligero Smart Portal Service Catalog
-- Essta consulta lista os serviços cadastrados no sistema e seu relacionamento com Formulários e artigos de serviço
-- associados para o Catálogo de Serviços do Portal Ligero Smart
-- Ligero Smart
-- ((OTRS)) Community Edition
-- https://ligero.online
-- https://complemento.net.br
select s.id, s.name,
    substring(ExtractValue(f_field3, '//*'),1,400) as FaqBody,
    substring(ExtractValue(d.body, '//*'),1,400) as formBody,
    fs.name as state,
    d.frontend as formFrontends,
    p.preferences_value as formId,d.name as formName,
    f.f_subject as FAQ,
    f_keywords
    from service s
    left join service_preferences p on s.id=p.service_id and preferences_key='Forms'
    left join dfs d on d.id=p.preferences_value and d.valid_id=1
    left join 
        (select source_key, target_key from link_relation where source_object_id=1 and target_object_id=3
             union
          select target_key as source_key, source_key as target_key from link_relation where source_object_id=3 and target_object_id=1
        ) r on s.id=r.source_key
    left join faq_item f on f.id=r.target_key
    left join faq_state fs on fs.id=f.state_id

where s.valid_id=1
order by s.name
