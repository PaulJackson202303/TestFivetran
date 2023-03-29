
{{ config(materialized='table') }}

select 
	employee_id, 
	job_id, 
	{{ source('postgres_hr', 'departments') }}.department_id, 
	department_name,  
	'test' newvarcharcol, 
	2*25 newintgerecol 
from 
	{{ ref('employees_snapshot_hard_delete') }}, 
	{{ source('postgres_hr', 'departments') }}
where 
	dbt_valid_to is null
and {{ source('postgres_hr', 'departments')}}.department_id = {{ ref('employees_snapshot_hard_delete')}}.department_id