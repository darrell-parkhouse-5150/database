select
    name,
    salary
    case
        when salary < 6000 then 'low'
        where salary between 6000 and 7000 then 'medium'
        else 'high'
    end as salary_category