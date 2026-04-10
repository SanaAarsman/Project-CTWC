-- CTWC validation checks

-- 1. Row counts
SELECT 'ctwc_countries' AS table_name, COUNT(*) AS row_count
FROM ctwc_project.ctwc_countries

UNION ALL

SELECT 'ctwc_player_info' AS table_name, COUNT(*) AS row_count
FROM ctwc_project.ctwc_player_info

UNION ALL

SELECT 'ctwc_all_games' AS table_name, COUNT(*) AS row_count
FROM ctwc_project.ctwc_all_games

UNION ALL

SELECT 'ctwc_year_stats' AS table_name, COUNT(*) AS row_count
FROM ctwc_project.ctwc_year_stats

UNION ALL

SELECT 'twitch_twitchtracker_stream_data' AS table_name, COUNT(*) AS row_count
FROM ctwc_project.twitch_twitchtracker_stream_data;



-- 2. Primary key duplicate check

SELECT 'ctwc_countries' AS table_name, COUNT(*) - COUNT(DISTINCT code) AS duplicate_pk_count
FROM ctwc_project.ctwc_countries

UNION ALL

SELECT 'ctwc_player_info' AS table_name, COUNT(*) - COUNT(DISTINCT player) AS duplicate_pk_count
FROM ctwc_project.ctwc_player_info

UNION ALL

SELECT 'ctwc_all_games' AS table_name, COUNT(*) - COUNT(DISTINCT game_id) AS duplicate_pk_count
FROM ctwc_project.ctwc_all_games

UNION ALL

SELECT 'ctwc_year_stats' AS table_name, COUNT(*) - COUNT(DISTINCT year) AS duplicate_pk_count
FROM ctwc_project.ctwc_year_stats

UNION ALL

SELECT 'twitch_twitchtracker_stream_data' AS table_name, COUNT(*) - COUNT(DISTINCT twitchtracker_url) AS duplicate_pk_count
FROM ctwc_project.twitch_twitchtracker_stream_data;


-- 3. Foreign key coverage check

SELECT 'all_games -> player_info' AS relationship_name,
       COUNT(*) AS missing_matches
FROM ctwc_project.ctwc_all_games g
LEFT JOIN ctwc_project.ctwc_player_info p
  ON g.player = p.player
WHERE p.player IS NULL

UNION ALL

SELECT 'player_info -> countries' AS relationship_name,
       COUNT(*) AS missing_matches
FROM ctwc_project.ctwc_player_info p
LEFT JOIN ctwc_project.ctwc_countries c
  ON p.country_code = c.code
WHERE p.country_code IS NOT NULL
  AND c.code IS NULL;
  


-- 4. Null check in key columns

SELECT 'ctwc_countries.code' AS field_name, COUNT(*) AS null_count
FROM ctwc_project.ctwc_countries
WHERE code IS NULL

UNION ALL

SELECT 'ctwc_player_info.player' AS field_name, COUNT(*) AS null_count
FROM ctwc_project.ctwc_player_info
WHERE player IS NULL

UNION ALL

SELECT 'ctwc_all_games.game_id' AS field_name, COUNT(*) AS null_count
FROM ctwc_project.ctwc_all_games
WHERE game_id IS NULL

UNION ALL

SELECT 'ctwc_all_games.player' AS field_name, COUNT(*) AS null_count
FROM ctwc_project.ctwc_all_games
WHERE player IS NULL

UNION ALL

SELECT 'ctwc_year_stats.year' AS field_name, COUNT(*) AS null_count
FROM ctwc_project.ctwc_year_stats
WHERE year IS NULL

UNION ALL

SELECT 'twitch_twitchtracker_stream_data.twitchtracker_url' AS field_name, COUNT(*) AS null_count
FROM ctwc_project.twitch_twitchtracker_stream_data
WHERE twitchtracker_url IS NULL;



-- 5. Core join row stability check

SELECT COUNT(*) AS joined_row_count
FROM ctwc_project.ctwc_all_games g
JOIN ctwc_project.ctwc_player_info p
  ON g.player = p.player;
  


-- 6. Core 3-table join row stability check

SELECT COUNT(*) AS joined_row_count
FROM ctwc_project.ctwc_all_games g
JOIN ctwc_project.ctwc_player_info p
  ON g.player = p.player
LEFT JOIN ctwc_project.ctwc_countries c
  ON p.country_code = c.code;