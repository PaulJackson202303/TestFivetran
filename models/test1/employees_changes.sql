WITH report AS (
  SELECT e.*, count(*) OVER (PARTITION BY employee_id) as count FROM {{ source('postgres_hr', 'employees_df') }} e
)
SELECT * FROM report WHERE count > 1
