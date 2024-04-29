SET max_parallel_workers = 80; 
SET maintenance_work_mem = '16 GB';


CREATE INDEX ON tweet_tags(tag, id_tweets);
CREATE INDEX ON tweets(id_tweets, lang);
CREATE INDEX ON tweets USING gin(to_tsvector('english', text));
CREATE INDEX ON tweet_tags(id_tweets, tag);

