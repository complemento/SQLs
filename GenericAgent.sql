SELECT * FROM generic_agent_jobs where job_name='XXXX' and job_value <> '' and job_key not like '%Day'
and job_key not like '%Hour'
and job_key not like '%Minute'
and job_key not like '%Month'
and job_key not like '%Year'
and job_key not like '%Used'
and job_key not like '%Second'
and job_key not like '%TimePoint'
and job_key not like '%TimeType'
and job_key not like '%PointFormat'
and job_key not like '%PointStart'