select
    p.prod_name,
    sum(oi.quantity * oi.unit_price) as revenue
from
    orders o
join
    order_items oi on o.order_id = io.order_id
join
    products p on oi.prod_id = p.prod_id
where
    o.order_date >= (
        select
            min(order_date)
        from
            orders
        where
            order_date >= date_sub(current_date, interval 1 year)
        )
        group by
            p.prod_name
        order by
            revenue desc
        limit 5