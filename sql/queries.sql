--Retrieve the game type and map name for a specific game:
SELECT
  gametype.name AS game_type,
  map.name AS map_name
FROM
  game
  JOIN gametype ON game.gameType_id = gametype.id
  JOIN map ON game.map_id = map.id
WHERE
  game.id = 1;

-- Retrieve the players and their selected heroes for a specific game:
SELECT
  player.name AS player_name,
  hero.name AS hero_name
FROM
  selectedhero
  JOIN player ON selectedhero.player_id = player.id
  JOIN hero ON selectedhero.hero_id = hero.id
  JOIN team on selectedhero.team_id = team.id
WHERE
  team.game_id = 1;

-- Retrieve the number of games played by each team:
SELECT
  team.id,
  COUNT(game.id) AS game_count
FROM
  team
  LEFT JOIN game ON team.game_id = game.id
GROUP BY
  team.id;

-- This query retrieves the total number of games for each game type from the "gametype" and "game" tables.
SELECT
  gt.name AS game_type,
  COUNT(g.id) AS total_games
FROM
  gametype gt
  LEFT JOIN game g ON gt.id = g.gameType_id
GROUP BY
  gt.name;

-- Retrieve the names of players and their corresponding accounts:
SELECT
  p.name AS player_name,
  a.mail AS account_mail
FROM
  player p
  JOIN account a ON p.account_id = a.id;

-- Get the list of heroes and their abilities:
SELECT
  h.name AS hero_name,
  ha.name AS ability_name,
  ha.ultimate
FROM
  hero h
  JOIN hero_ability ha ON h.id = ha.hero_id;

--Retrieve the players who have selected a specific hero in any game:
SELECT
  DISTINCT player.name AS player_name
FROM
  selectedhero
  JOIN player ON selectedhero.player_id = player.id
WHERE
  selectedhero.hero_id = 1;

-- Get the most polular hero types based on the number of selected heroes:
SELECT
  ht.name AS hero_type,
  COUNT(sh.hero_id) AS hero_count
FROM
  selectedHero sh
  JOIN hero h ON sh.hero_id = h.id
  JOIN hero_type ht ON h.type_id = ht.id
GROUP BY
  ht.name
ORDER BY
  hero_count DESC -- Retrieve the most commonly selected skin for each hero:
SELECT
  hero.name AS hero_name,
  skin.file_name AS skin_name,
  COUNT(selectedhero.skin_id) AS selection_count
FROM
  hero
  JOIN skin ON hero.id = skin.hero_id
  JOIN selectedhero ON skin.id = selectedhero.skin_id
GROUP BY
  hero.name,
  skin.file_name
HAVING
  COUNT(selectedhero.skin_id) = (
    SELECT
      MAX(skin_count)
    FROM
      (
        SELECT
          hero.name,
          skin.file_name,
          COUNT(selectedhero.skin_id) AS skin_count
        FROM
          hero
          JOIN skin ON hero.id = skin.hero_id
          JOIN selectedhero ON skin.id = selectedhero.skin_id
        GROUP BY
          hero.name,
          skin.file_name
      ) AS counts
    WHERE
      counts.name = hero.name
  );