-- 1. META ANALYSIS: Highest Average Rating with Sample Size Control
SELECT 
  class,
  spec,
  COUNT(name) AS total_players,
  ROUND(AVG(rating), 0) AS avg_rating,
  ROUND(AVG(SAFE_DIVIDE(wins, (wins + losses))) * 100, 1) AS avg_win_rate_percentage
FROM 
  `wow_arena_analysis.season3_top1000` 
WHERE
  class != 'Unknown'
GROUP BY 
  class,
  spec
HAVING 
  total_players >= 10
ORDER BY 
  avg_rating DESC;


-- 2. WIN RATE FOCUS: Specs maintaining a 60%+ Win Rate
SELECT 
  class,
  spec,
  COUNT(name) AS total_players,
  ROUND(AVG(SAFE_DIVIDE(wins, (wins + losses))) * 100, 1) AS avg_win_rate_percentage
FROM 
  `wow_arena_analysis.season3_top1000` 
WHERE
  class != 'Unknown'
GROUP BY 
  class,
  spec
HAVING 
  avg_win_rate_percentage >= 60
ORDER BY 
  total_players DESC;


-- 3. FACTION IMBALANCE: Alliance vs. Horde Representation and Total Wins
SELECT 
  faction,
  COUNT(name) AS total_players,
  SUM(wins) AS total_faction_wins,
  ROUND(AVG(SAFE_DIVIDE(wins, (wins + losses))) * 100, 1) AS avg_win_rate_percentage
FROM 
  `wow_arena_analysis.season3_top1000` 
WHERE
  class != 'Unknown'
GROUP BY 
  faction
ORDER BY 
  total_players DESC;