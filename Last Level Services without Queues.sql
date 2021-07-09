select s.id,s.name as service,q.name as queue,qe.preferences_value as expression,
t.filename as imagem
  from service s 
left join service_preferences qx on s.id=qx.service_id and qx.preferences_key='TicketQueue' left join queue q on qx.preferences_value=q.id
left join service_preferences qe on s.id=qe.service_id and qe.preferences_key='TicketQueueExpression'
left join service_preferences c on s.id=c.service_id and c.preferences_key='ServiceImageBackground'
left join df_attachment t on s.id=t.article_id
where s.valid_id=1
and q.name is null
and (select count(*) from service x where x.name like concat(s.name,'::%'))=0
and s.id in (select service_id from service_customer_user where customer_user_login='<DEFAULT>')
order by s.name
