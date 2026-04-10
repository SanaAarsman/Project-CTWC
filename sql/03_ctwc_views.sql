-- CTWC views

CREATE OR REPLACE VIEW ctwc_project.vw_competition_detail AS
SELECT
    g.year,
    g.round,
    g.match_id,
    g.game_id,
    g.game,
    g.player,
    g.won,
    g.playstyle,
    g.final_score,
    g.total_lines,
    g.no_mullen_score,
    g.no_mullen_lines,
    g.score_lvl_19_transition,
    g.lines_lvl_19_transition,
    g.score_lvl_29_transition,
    g.lines_lvl_29_transition,
    g.score_lvl_39_transition,
    g.lines_lvl_39_transition,
    g.topout_type,
    g.start_level,
    g.line_cap,
    g.same_piece_sets_active,
    g.post,
    g.post_post,
    g.game_link,
    p.twitch,
    p.youtube,
    p.country_code,
    c.name AS country_name
FROM ctwc_project.ctwc_all_games g
LEFT JOIN ctwc_project.ctwc_player_info p
    ON g.player = p.player
LEFT JOIN ctwc_project.ctwc_countries c
    ON p.country_code = c.code;
    
SELECT COUNT(*) AS row_count
FROM ctwc_project.vw_competition_detail;


--
CREATE OR REPLACE VIEW ctwc_project.vw_competition_yearly AS
SELECT
    year,
    COUNT(*) AS total_game_rows,
    COUNT(DISTINCT player) AS distinct_players,
    AVG(final_score) AS avg_final_score,
    AVG(total_lines) AS avg_total_lines,
    AVG(start_level) AS avg_start_level,
    MIN(start_level) AS min_start_level,
    MAX(start_level) AS max_start_level,
    SUM(CASE WHEN score_lvl_19_transition IS NOT NULL THEN 1 ELSE 0 END) AS games_with_19_transition,
    SUM(CASE WHEN score_lvl_29_transition IS NOT NULL THEN 1 ELSE 0 END) AS games_with_29_transition,
    SUM(CASE WHEN score_lvl_39_transition IS NOT NULL THEN 1 ELSE 0 END) AS games_with_39_transition,
    SUM(CASE WHEN no_mullen_score IS NOT NULL THEN 1 ELSE 0 END) AS games_with_no_mullen_score,
    SUM(CASE WHEN playstyle = 'DAS' THEN 1 ELSE 0 END) AS das_games,
    SUM(CASE WHEN playstyle = 'Tap' THEN 1 ELSE 0 END) AS tap_games,
    SUM(CASE WHEN playstyle = 'Roll' THEN 1 ELSE 0 END) AS roll_games,
    SUM(CASE WHEN round = 'Finals' THEN 1 ELSE 0 END) AS finals_games,
    SUM(CASE WHEN round = 'GF' THEN 1 ELSE 0 END) AS gf_games,
    SUM(CASE WHEN round = 'GFBR' THEN 1 ELSE 0 END) AS gfbr_games,
    SUM(CASE WHEN round = 'LF' THEN 1 ELSE 0 END) AS lf_games,
    SUM(CASE WHEN round = 'LQ' THEN 1 ELSE 0 END) AS lq_games,
    SUM(CASE WHEN round = 'LS' THEN 1 ELSE 0 END) AS ls_games,
    SUM(CASE WHEN round = 'Semis' THEN 1 ELSE 0 END) AS semis_games,
    SUM(CASE WHEN round = 'Top 16' THEN 1 ELSE 0 END) AS top16_games,
    SUM(CASE WHEN round = 'Top 32' THEN 1 ELSE 0 END) AS top32_games,
    SUM(CASE WHEN round = 'Top 64' THEN 1 ELSE 0 END) AS top64_games,
    SUM(CASE WHEN round = 'Top 8' THEN 1 ELSE 0 END) AS top8_games,
    SUM(CASE WHEN round = 'WF' THEN 1 ELSE 0 END) AS wf_games,
    SUM(CASE WHEN round = 'WQ' THEN 1 ELSE 0 END) AS wq_games,
    SUM(CASE WHEN round = 'WS' THEN 1 ELSE 0 END) AS ws_games
FROM ctwc_project.ctwc_all_games
GROUP BY year;

SELECT COUNT(*) AS row_count
FROM ctwc_project.vw_competition_yearly;


--
CREATE OR REPLACE VIEW ctwc_project.vw_twitch_yearly AS
SELECT
    year,
    COUNT(*) AS total_stream_rows,
    COUNT(DISTINCT channel_name) AS distinct_channels,
    SUM(duration_minutes) AS total_duration_minutes,
    AVG(duration_minutes) AS avg_duration_minutes,
    AVG(avg_viewers) AS avg_avg_viewers,
    MAX(peak_viewers) AS max_peak_viewers,
    AVG(peak_viewers) AS avg_peak_viewers,
    SUM(hours_watched) AS total_hours_watched,
    SUM(followers_gained) AS total_followers_gained,
    SUM(views_gained) AS total_views_gained
FROM ctwc_project.twitch_twitchtracker_stream_data
GROUP BY year;

SELECT COUNT(*) AS row_count
FROM ctwc_project.vw_twitch_yearly;

SELECT DISTINCT year
FROM ctwc_project.twitch_twitchtracker_stream_data
ORDER BY year;


--
CREATE OR REPLACE VIEW ctwc_project.vw_yearly_comparison AS
SELECT
    cy.year,

    -- competition yearly
    cy.total_game_rows,
    cy.distinct_players,
    cy.avg_final_score,
    cy.avg_total_lines,
    cy.avg_start_level,
    cy.min_start_level,
    cy.max_start_level,
    cy.games_with_19_transition,
    cy.games_with_29_transition,
    cy.games_with_39_transition,
    cy.games_with_no_mullen_score,
    cy.das_games,
    cy.tap_games,
    cy.roll_games,
    cy.finals_games,
    cy.gf_games,
    cy.gfbr_games,
    cy.lf_games,
    cy.lq_games,
    cy.ls_games,
    cy.semis_games,
    cy.top16_games,
    cy.top32_games,
    cy.top64_games,
    cy.top8_games,
    cy.wf_games,
    cy.wq_games,
    cy.ws_games,

    -- twitch yearly
    ty.total_stream_rows,
    ty.distinct_channels,
    ty.total_duration_minutes,
    ty.avg_duration_minutes,
    ty.avg_avg_viewers,
    ty.max_peak_viewers,
    ty.avg_peak_viewers,
    ty.total_hours_watched,
    ty.total_followers_gained,
    ty.total_views_gained,

    -- year stats
    ys.total_games AS year_stats_total_games,
    ys.median_score,
    ys.transitions,
    ys.killscreens,
    ys.level_39s,
    ys.transition_pct,
    ys.killscreen_pct,
    ys.level_39_pct,
    ys.average_score,
    ys.average_win,
    ys.average_loss,
    ys.median_lines,
    ys.average_lines,
    ys.median_19_trans,
    ys.median_29_trans

FROM ctwc_project.vw_competition_yearly cy
LEFT JOIN ctwc_project.vw_twitch_yearly ty
    ON cy.year = ty.year
LEFT JOIN ctwc_project.ctwc_year_stats ys
    ON cy.year = ys.year;

SELECT COUNT(*) AS row_count
FROM ctwc_project.vw_yearly_comparison;

SELECT year
FROM ctwc_project.vw_yearly_comparison
ORDER BY year;






