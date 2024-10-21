SELECT column1,
  CASE
    WHEN column2 = 'value1' THEN 'result1'
    WHEN column2 = 'value2' THEN 'result2'
    ELSE 'other'
  END AS alias_name
FROM table_name;
