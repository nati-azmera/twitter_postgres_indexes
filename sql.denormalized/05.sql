SELECT '#' || (jsonb_array_elements(
                COALESCE(data->'entities'->'hashtags','[]') ||
                COALESCE(data->'extended_tweet'->'entities'->'hashtags','[]')
            )->>'text'::TEXT) AS tag, count(DISTINCT data->>'id')
FROM tweets_jsonb
WHERE
    data->'lang' = '"en"'::jsonb AND
     to_tsvector('english', COALESCE(data->'extended_tweet'->>'full_text', data->>'text'))@@to_tsquery('english', 'coronavirus')
GROUP BY tag
ORDER BY count DESC, tag
LIMIT 1000;
