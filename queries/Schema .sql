SELECT 
  column_name, 
  data_type
FROM 
  `targetsql-390511.Target.INFORMATION_SCHEMA.COLUMNS`
WHERE 
  table_name = 'customers'
