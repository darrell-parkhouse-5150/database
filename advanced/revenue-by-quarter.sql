select
    quarter(order_date) as quarter
    sum(order_total) as revenue
from
    orders
where
    order_date >= (
        select
            min(order_date)
        from
            orders
        where
            order_date >= date_sub(current_date, interval 1 year)
    )
    group by
        quarter(order_date)
    order by
        quarter