select
    o.order_id,
    o.customer_id (
        select
            c.name as customer_name
        from
            customers c
        where
            c.customer_id = o.customer_id
    ) as customer_name, (
        select
            sum(oi.quantity)
        from
            ordered_items oi
        where
            oi.order_id = o.order_id
    ) as total_items, (
        select
            p.prod_name
        from
            products p
        where
            p.prod_id = (
                select
                    oi.prod_id
                from 
                    order_items oi
                where
                    oi.order_id = o.order_id
                limit 1
            )            
    ) as first_prod, (
        select
            count()
    )
