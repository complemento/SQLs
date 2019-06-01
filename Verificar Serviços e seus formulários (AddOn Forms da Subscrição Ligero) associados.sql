-- Essta consulta lista os serviços cadastrados no sistema e seu relacionamento com Formulários
-- https://ligero.online
-- https://complemento.net.br
select s.id, s.name, p.preferences_value as for_id,d.name as formName,
    substring(ExtractValue(body, '//*'),1,100) as body
    from service s
    left join service_preferences p on s.id=p.service_id and preferences_key='Forms'
    left join dfs d on d.id=p.preferences_value and d.valid_id=1
where s.valid_id=1 order by s.name
