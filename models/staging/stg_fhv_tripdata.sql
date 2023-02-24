{{ config(materialized='view') }}

select
    -- identifiers
    {{ dbt_utils.surrogate_key(['int64_field_0']) }} as tripid,
    PUlocationID,
    DOlocationID,
    
    -- timestamps
    pickup_datetime,
    dropoff_datetime,
    
    -- trip info
    SR_Flag,
    dispatching_base_num,
    affiliated_base_number,
from {{ source('staging','bqtable') }}

{% if var('is_test_run', default=false) %}

{% endif %}