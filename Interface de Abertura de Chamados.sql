-- LigeroSmart
-- ((otrs)) Community Edition
-- Grafana
select  t.create_time as time, 
        t.tn,
        concat(
        CASE st.name
            WHEN 'customer' THEN 'Cliente - '
            WHEN 'agent' THEN 'Atendente - '
            ELSE 'Sistema - ' 
        END,
        CASE cc.name
            WHEN 'Internal' THEN 'Interface Web'
            WHEN 'Phone' THEN 'Telefone'
            ELSE 'Indefinido'
        END
        ) as abertura
    from ticket t 
    inner join article a on t.id=a.ticket_id 
    inner join article_sender_type st on a.article_sender_type_id=st.id
    inner join communication_channel cc on a.communication_channel_id=cc.id
where a.id in (select min(id) from article where a.is_visible_for_customer=1 group by ticket_id)
and $__timeFilter(t.create_time)
ORDER BY t.create_time
