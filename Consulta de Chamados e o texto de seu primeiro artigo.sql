-- This query lists all tickets and it's first article body
-- Essta consulta lista os chamados e o texto de seu primeiro artigo
-- LigeroSmart Ligero Smart
-- ((OTRS)) Community Edition
-- https://ligero.online
-- https://complemento.net.br
select t.tn, v.value_text as empresa, x.a_body texto_inicial
 from article x
  left join ticket t on x.ticket_id=t.id
  left join dynamic_field_value v on x.ticket_id=v.object_id and v.field_id=65
   where  x.id in
(select min(a.id) from article a 
group by a.ticket_id) and a_body like '%obrigatoriedade%'
