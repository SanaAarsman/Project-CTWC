---------------
LOAD DATA LOCAL INFILE '/Users/sanaaarsman/dev/ironhack/projects/CTWC/Project-CTWC/data/processed/csv_files/ctwc_countries_cleaned.csv'
INTO TABLE ctwc_project.ctwc_countries
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@code, @name)
SET
  code = NULLIF(TRIM(@code), ''),
  name = NULLIF(TRIM(@name), '');

SELECT COUNT(*) AS row_count
FROM ctwc_project.ctwc_countries;
---------------


---------------
LOAD DATA LOCAL INFILE '/Users/sanaaarsman/dev/ironhack/projects/CTWC/Project-CTWC/data/processed/csv_files/ctwc_player_info_cleaned.csv'
INTO TABLE ctwc_project.ctwc_player_info
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@player, @twitch, @youtube, @country_code)
SET
  player = NULLIF(TRIM(@player), ''),
  twitch = NULLIF(TRIM(@twitch), ''),
  youtube = NULLIF(TRIM(@youtube), ''),
  country_code = NULLIF(TRIM(@country_code), '');
  
SELECT COUNT(*) AS row_count
FROM ctwc_project.ctwc_player_info;
---------------


---------------
LOAD DATA LOCAL INFILE '/Users/sanaaarsman/dev/ironhack/projects/CTWC/Project-CTWC/data/processed/csv_files/ctwc_all_games_cleaned.csv'
INTO TABLE ctwc_project.ctwc_all_games
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
  @year,
  @round,
  @match_id,
  @game_id,
  @game,
  @player,
  @won,
  @playstyle,
  @final_score,
  @total_lines,
  @no_mullen_score,
  @no_mullen_lines,
  @score_lvl_19_transition,
  @lines_lvl_19_transition,
  @score_lvl_29_transition,
  @lines_lvl_29_transition,
  @score_lvl_39_transition,
  @lines_lvl_39_transition,
  @topout_type,
  @start_level,
  @line_cap,
  @same_piece_sets_active,
  @post,
  @post_post,
  @game_link
)
SET
  year = NULLIF(TRIM(@year), ''),
  round = NULLIF(TRIM(@round), ''),
  match_id = NULLIF(TRIM(@match_id), ''),
  game_id = NULLIF(TRIM(@game_id), ''),
  game = NULLIF(TRIM(@game), ''),
  player = NULLIF(TRIM(@player), ''),
  won = NULLIF(TRIM(@won), ''),
  playstyle = NULLIF(TRIM(@playstyle), ''),
  final_score = NULLIF(TRIM(@final_score), ''),
  total_lines = NULLIF(TRIM(@total_lines), ''),
  no_mullen_score = NULLIF(TRIM(@no_mullen_score), ''),
  no_mullen_lines = NULLIF(TRIM(@no_mullen_lines), ''),
  score_lvl_19_transition = NULLIF(TRIM(@score_lvl_19_transition), ''),
  lines_lvl_19_transition = NULLIF(TRIM(@lines_lvl_19_transition), ''),
  score_lvl_29_transition = NULLIF(TRIM(@score_lvl_29_transition), ''),
  lines_lvl_29_transition = NULLIF(TRIM(@lines_lvl_29_transition), ''),
  score_lvl_39_transition = NULLIF(TRIM(@score_lvl_39_transition), ''),
  lines_lvl_39_transition = NULLIF(TRIM(@lines_lvl_39_transition), ''),
  topout_type = NULLIF(TRIM(@topout_type), ''),
  start_level = NULLIF(TRIM(@start_level), ''),
  line_cap = NULLIF(TRIM(@line_cap), ''),
  same_piece_sets_active = NULLIF(TRIM(@same_piece_sets_active), ''),
  post = NULLIF(TRIM(@post), ''),
  post_post = NULLIF(TRIM(@post_post), ''),
  game_link = NULLIF(TRIM(@game_link), '');

SELECT COUNT(*) AS row_count
FROM ctwc_project.ctwc_all_games;
---------------


---------------
LOAD DATA LOCAL INFILE '/Users/sanaaarsman/dev/ironhack/projects/CTWC/Project-CTWC/data/processed/csv_files/ctwc_year_stats_cleaned.csv'
INTO TABLE ctwc_project.ctwc_year_stats
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
  @year,
  @total_games,
  @median_score,
  @transitions,
  @killscreens,
  @level_39s,
  @transition_pct,
  @killscreen_pct,
  @level_39_pct,
  @average_score,
  @average_win,
  @average_loss,
  @median_lines,
  @average_lines,
  @median_19_trans,
  @median_29_trans
)
SET
  year = NULLIF(TRIM(@year), ''),
  total_games = NULLIF(TRIM(@total_games), ''),
  median_score = NULLIF(TRIM(@median_score), ''),
  transitions = NULLIF(TRIM(@transitions), ''),
  killscreens = NULLIF(TRIM(@killscreens), ''),
  level_39s = NULLIF(TRIM(@level_39s), ''),
  transition_pct = NULLIF(TRIM(@transition_pct), ''),
  killscreen_pct = NULLIF(TRIM(@killscreen_pct), ''),
  level_39_pct = NULLIF(TRIM(@level_39_pct), ''),
  average_score = NULLIF(TRIM(@average_score), ''),
  average_win = NULLIF(TRIM(@average_win), ''),
  average_loss = NULLIF(TRIM(@average_loss), ''),
  median_lines = NULLIF(TRIM(@median_lines), ''),
  average_lines = NULLIF(TRIM(@average_lines), ''),
  median_19_trans = NULLIF(TRIM(@median_19_trans), ''),
  median_29_trans = NULLIF(TRIM(@median_29_trans), '');

SELECT COUNT(*) AS row_count
FROM ctwc_project.ctwc_year_stats;
---------------


---------------
LOAD DATA LOCAL INFILE '/Users/sanaaarsman/dev/ironhack/projects/CTWC/Project-CTWC/data/processed/csv_files/twitch_twitchtracker_stream_data_cleaned.csv'
INTO TABLE ctwc_project.twitch_twitchtracker_stream_data
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
  @year,
  @stream_date,
  @channel_name,
  @stream_title,
  @duration,
  @duration_minutes,
  @avg_viewers,
  @peak_viewers,
  @hours_watched,
  @followers_gained,
  @views_gained,
  @source_stream_id,
  @twitchtracker_url
)
SET
  year = NULLIF(TRIM(@year), ''),
  stream_date = NULLIF(TRIM(@stream_date), ''),
  channel_name = NULLIF(TRIM(@channel_name), ''),
  stream_title = NULLIF(TRIM(@stream_title), ''),
  duration = NULLIF(TRIM(@duration), ''),
  duration_minutes = NULLIF(TRIM(@duration_minutes), ''),
  avg_viewers = NULLIF(TRIM(@avg_viewers), ''),
  peak_viewers = NULLIF(TRIM(@peak_viewers), ''),
  hours_watched = NULLIF(TRIM(@hours_watched), ''),
  followers_gained = NULLIF(TRIM(@followers_gained), ''),
  views_gained = NULLIF(TRIM(@views_gained), ''),
  source_stream_id = NULLIF(TRIM(@source_stream_id), ''),
  twitchtracker_url = NULLIF(TRIM(@twitchtracker_url), '');

SELECT COUNT(*) AS row_count
FROM ctwc_project.twitch_twitchtracker_stream_data;
---------------


---------------













