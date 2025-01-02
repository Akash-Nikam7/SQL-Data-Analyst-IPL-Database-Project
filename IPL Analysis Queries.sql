use ipl;

select * from matches;
select * from deliveries;
select * from match_winners;

-- 1. List all matches with the city and venue information.
select city , venue from matches;

-- 2. Find the number of matches held in each city.
select city, count(*) as No_Of_Matches from matches group by city order by No_Of_Matches ;

-- 3. Get the player who won "Player of the Match" for a specific match ID.
select player_of_match from matches where id = 1359505;

-- 4. List the teams that played in a specific city.
select distinct team1,team2 from matches where city = "Pune" ;

-- 5. Retrieve the batting and bowling teams for a particular match.
select distinct batting_team , bowling_team from deliveries where match_id = 1175358;

-- 6. Get the toss winner and their decision for each match.
select id,toss_winner , toss_decision from matches;

-- 7. List all matches where the result was a tie or involved a super over.
select * from matches where result = "tie" or super_over = "y";

-- 8. Count the number of matches won by each team.
select winner , count(*) as Total_Wins from matches group by winner order by count(*) desc ;

-- 9. Find all deliveries where a specific batter scored runs.
select * from deliveries where batter = "V Kohli";

-- 10. Retrieve all final match venues and their winners from each year.
select Year , `Final Match Venue` , Winner from match_winners;

-- 11. Find the average result margin for matches where team1 was the winner. no result
select team1 , avg(result_margin) from matches where winner = "team1" group by team1;

-- 12. List the top 3 players who received the "Player of the Series" title most often.
select year, `Player of the series` , count(*) as Player_of_Series from match_winners group by year , `Player of the series` 
order by Player_of_Series desc limit 3;

-- 13. Identify matches with the highest total runs scored.
select match_id , sum(total_runs) as Total_Runs from deliveries group by match_id order by Total_Runs desc limit 5;

-- 14. List the matches where a specific team batted second and won the match.
select * from matches where team2 = "Rajasthan Royals" and winner = team2;

-- 15. Get the details of all matches played in the most common city.
select * from matches where city = (SELECT city FROM matches GROUP BY city ORDER BY COUNT(*) DESC LIMIT 1);

-- 16. Count the number of sixes scored by each team.
select batting_team, count(*) as Total_Sixes from deliveries where total_runs = 6 group by batting_team order by count(*) desc;

-- 17. Find the player who scored the most runs in a single match.
select batter , match_id , sum(batsman_runs) as Most_Runs from deliveries group by match_id , batter order by Most_runs desc;

-- 18. Get all the captains of the winning teams over the years.
select year , winner , captain from match_winners;

-- 19. Identify which players were dismissed most often and by whom.
select bowler , player_dismissed , count(*) as Dismissals from deliveries where is_wicket = 1 group by bowler , player_dismissed ;

-- 20. Find the top 3 bowlers who dismissed a specific player the most.
select bowler, count(*) as Dismissals from deliveries where player_dismissed = "V Kohli" group by bowler order by count(*) desc limit 3;

-- 21. List matches with the maximum number of sixes hit in an inning.
select match_id , inning , count(*) as No_Of_Sixes from deliveries where total_runs = 6 group by match_id,inning order by No_Of_Sixes desc limit 5;

-- 22. Retrieve the top 5 most dismissed batters along with the types of dismissal.
select player_dismissed , dismissal_kind , count(*) as Dismissals from deliveries where is_wicket = 1 group by player_dismissed , dismissal_kind 
order by count(*) desc limit 5;

-- 23. Identify matches where the toss decision did not correlate with the outcome.
select id ,toss_winner , winner, toss_decision from matches where (toss_decision = "bat" and toss_winner != winner) or (toss_decision = "field" and toss_winner = winner);

-- 24. Calculate the total runs and wickets in the match for each season.
select m.season, m.id , sum(d.total_runs) as Total_Runs , sum(d.is_wicket) as Total_wickets from matches as m join deliveries as d on m.id = d.match_id where m.season is not null group by m.season , m.id order by m.season; 

-- 25. Identify the player with the highest number of "Man of the Match" awards in the final matches.
select `Man of the match`, count(*) as Awards from match_winners group by `Man of the match` order by Awards desc limit 1;

-- 26. Find all players dismissed by a specific bowler with a specific dismissal type.
select batter from deliveries where bowler = "RA Jadeja" and dismissal_kind = "caught" and is_wicket = 1;

-- 27. List the number of sixes and wickets in each inning across all matches.
SELECT match_id, inning, COUNT(CASE WHEN batsman_runs = 6 THEN 1 END) AS sixes, COUNT(CASE WHEN is_wicket = 1 THEN 1 END) AS wickets FROM deliveries GROUP BY match_id, inning;

-- 28. Find the top 5 players who have scored the most total runs across all matches.
select batter , sum(batsman_runs) as Total_Runs from deliveries group by batter order by Total_Runs desc limit 5;

-- 29. List the number of matches each team has won.
select winner , count(*) as Matches_Won from matches group by winner;

-- 30. Find the average number of runs scored per match.
select avg(total_runs) as avg_runs_per_match from (select match_id , sum(total_runs) as total_runs from deliveries group by match_id) as Match_totals;

-- 31. List the matches where the toss_winner won the match.
select id, toss_winner, winner from matches where toss_winner = winner;

-- 32. Find the player who hit the most sixes across all matches.
select batter, COUNT(*) AS sixes from deliveries where batsman_runs = 6 group by batter order by sixes desc limit 1;

-- 33. List all bowlers and the number of wickets they have taken.
SELECT bowler, COUNT(*) AS wickets FROM deliveries WHERE is_wicket = 1 GROUP BY bowler ORDER BY wickets DESC;

-- 34. Find the top 3 most common types of dismissals.
SELECT dismissal_kind, COUNT(*) AS count FROM deliveries WHERE dismissal_kind <> "NA" GROUP BY dismissal_kind ORDER BY count DESC LIMIT 3;

-- 35. Identify matches where the result_margin was above 50 runs.
SELECT id, winner, result_margin FROM matches WHERE result = 'runs' AND CAST(result_margin AS UNSIGNED) > 50;

-- 36. Find the total number of extras bowled in each match.
SELECT match_id, SUM(extra_runs) AS total_extras FROM deliveries GROUP BY match_id ORDER BY total_extras DESC;

-- 37. Find the player who scored the highest total runs in a season.
SELECT m.Season, d.batter, SUM(d.batsman_runs) AS total_runs FROM matches m JOIN deliveries d ON m.id = d.match_id GROUP BY m.Season, d.batter
ORDER BY total_runs DESC LIMIT 1;

-- 38. Identify the bowler who has dismissed a specific player the most times.
SELECT bowler, COUNT(*) AS dismissals FROM deliveries WHERE player_dismissed = 'MS Dhoni' GROUP BY bowler ORDER BY dismissals DESC LIMIT 1;
 
-- 39. List all match_ids where the match was won by chasing down the target.
SELECT id, team2 AS chasing_team, winner FROM matches WHERE team2 = winner AND toss_decision = 'field';

-- 40. Identify matches that ended in a tie, listing both teams and the city.
SELECT id, team1, team2, city FROM matches WHERE result = 'tie';

-- 41. Retrieve the match with the highest number of total runs scored by both teams.
SELECT match_id, SUM(total_runs) AS total_runs FROM deliveries GROUP BY match_id ORDER BY total_runs DESC LIMIT 1;

-- 42. List all captains of winning teams over the years.
SELECT Year, Winner, Captain FROM match_winners;

-- 43. List all players who have won both "Man of the Match" and "Player of the Series" awards in any season.
SELECT DISTINCT mw.`Player of the Series` FROM match_winners mw JOIN matches m ON mw.`Man of the Match` = mw.`Player of the Series`;

-- 44. List the players who have hit at least one six and one four in a single match.
SELECT match_id, batter FROM deliveries WHERE batsman_runs = 6 GROUP BY match_id, batter HAVING SUM(CASE WHEN batsman_runs = 4 THEN 1 ELSE 0 END) > 0;

-- 45. Calculate the average number of runs scored by teams when batting first.
SELECT team1 AS batting_team, AVG(total_runs) AS avg_first_innings_score FROM ( SELECT match_id, team1, SUM(total_runs) AS total_runs FROM deliveries
GROUP BY match_id, team1) AS first_innings_scores GROUP BY batting_team ORDER BY avg_first_innings_score DESC;

-- 46. Identify the most common venue for finals matches across seasons.
SELECT `Final Match Venue`, COUNT(*) AS final_matches FROM match_winners GROUP BY `Final Match Venue` ORDER BY final_matches DESC LIMIT 1;

-- 47. Find the players who have scored exactly 100 runs (a century) in a single match.
SELECT match_id, batter, SUM(batsman_runs) AS total_runs FROM deliveries GROUP BY match_id, batter HAVING total_runs = 100;

-- 48. Calculate the strike rate of each batter who has faced more than 200 balls.
SELECT batter, SUM(batsman_runs) AS total_runs, COUNT(*) AS balls_faced, ROUND(SUM(batsman_runs) / COUNT(*) * 100, 2) AS strike_rate
FROM deliveries GROUP BY batter HAVING balls_faced > 200 ORDER BY strike_rate DESC;

-- 49. Find the match_id and team that scored the most runs in a single over.
SELECT match_id, batting_team, over, SUM(total_runs) AS runs_in_over FROM deliveries GROUP BY match_id, batting_team, over ORDER BY runs_in_over DESC
LIMIT 1;

-- 50. List the players who have hit more than 20 sixes and 20 fours across all matches.
SELECT batter, SUM(CASE WHEN batsman_runs = 6 THEN 1 ELSE 0 END) AS sixes, SUM(CASE WHEN batsman_runs = 4 THEN 1 ELSE 0 END) AS fours
FROM deliveries GROUP BY batter HAVING sixes > 20 AND fours > 20 ORDER BY sixes DESC, fours DESC;


























