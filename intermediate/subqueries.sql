SELECT column1, (
    SELECT MAX(column2) 
    FROM table2) AS max_value 
    FROM table1;
