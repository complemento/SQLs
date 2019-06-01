-- This query lists all services and it's relations to Queues and Queues Expressions Ligero Subscription
-- Esta consulta lista os serviços cadastrados no sistema e seu relacionamento com Filas e Expressões de 
-- encaminhamento de filas
-- LigeroSmart Ligero Smart
-- ((OTRS)) Community Edition
-- https://ligero.online
-- https://complemento.net.br
select s.id,s.name as service,q.name as queue,qe.preferences_value as expression,
case c.preferences_value when 'rgb(238, 125, 12)' then 'laranja' when 'rgb(0, 141, 166)' then 'azul' end as corDeFundo,
t.filename as imagem
  from service s 
left join service_preferences qx on s.id=qx.service_id and qx.preferences_key='TicketQueue' left join queue q on qx.preferences_value=q.id
left join service_preferences qe on s.id=qe.service_id and qe.preferences_key='TicketQueueExpression'
left join service_preferences c on s.id=c.service_id and c.preferences_key='ServiceImageBackground'
left join df_attachment t on s.id=t.article_id
order by s.name
