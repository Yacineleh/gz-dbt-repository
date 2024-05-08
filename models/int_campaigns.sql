WITH campaign AS(

SELECT *
FROM {{ ref('stg_raw__bing') }}
UNION ALL 
SELECT *
FROM {{ ref('stg_raw__adwords') }}
UNION ALL 
SELECT *
FROM {{ ref('stg_raw__criteo') }}
UNION ALL 
SELECT *
FROM {{ ref('stg_raw__facebook') }}
)
SELECT *, 
concat(date_date,"_",campaign_key,"_",campaign_name) as campaign_primary_key
from campaign
order by date_date