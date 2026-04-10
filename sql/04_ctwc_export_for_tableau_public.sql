-- vw_yearly_comparison.csv
SELECT *
FROM ctwc_project.vw_yearly_comparison
ORDER BY year;

-- vw_competition_detail.csv
SELECT *
FROM ctwc_project.vw_competition_detail
ORDER BY year, game_id;

-- vw_competition_yearly.csv
SELECT *
FROM ctwc_project.vw_competition_yearly
ORDER BY year;

-- vw_twitch_yearly.csv
SELECT *
FROM ctwc_project.vw_twitch_yearly
ORDER BY year;