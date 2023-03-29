{% snapshot employees_snapshot_hard_delete %}

    {{
        config(
          target_schema='snapshots',
          strategy='check',
          unique_key='employee_id',
          check_cols='all',
          invalidate_hard_deletes=True,
        )
    }}

    select * from {{ source('postgres_hr', 'employees') }}

{% endsnapshot %}