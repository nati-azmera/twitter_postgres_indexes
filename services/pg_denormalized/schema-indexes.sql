SET maintenance_work_mem to '16GB';
SET max_parallel_maintenance_workers = 80;


create index on tweets_jsonb using gin((data->'extended_tweet'->'entities'->'hashtags'));
create index on tweets_jsonb using gin((data->'entities'->'hashtags'));
create index on public.tweets_jsonb using gin ((data -> 'lang'::text));
create index on tweets_jsonb using gin(to_tsvector('english', COALESCE(data->'extended_tweet'->>'full_text', data->>'text')));

