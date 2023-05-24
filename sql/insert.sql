-- Insert data into 'gametype' table
INSERT INTO
    gametype (id, name)
VALUES
    (1, 'Assault'),
    (2, 'Control'),
    (3, 'Escort');

-- Insert data into 'account' table
INSERT INTO
    account (id, mail)
VALUES
    (1, 'example1@example.com'),
    (2, 'example2@example.com'),
    (3, 'example3@example.com'),
    (4, 'example4@example.com'),
    (5, 'example5@example.com');

-- Insert data into 'hero_type' table
INSERT INTO
    hero_type (id, name)
VALUES
    (1, 'Offense'),
    (2, 'Defense'),
    (3, 'Tank'),
    (4, 'Support');

-- Insert data into 'hero' table
INSERT INTO
    hero (id, type_id, name)
VALUES
    (1, 1, 'Doomfist'),
    (2, 1, 'Genji'),
    (3, 1, 'McCree'),
    (4, 1, 'Pharah'),
    (5, 1, 'Reaper'),
    (6, 1, 'Soldier: 76'),
    (7, 1, 'Sombra'),
    (8, 2, 'Bastion'),
    (9, 2, 'Hanzo'),
    (10, 2, 'Junkrat'),
    (11, 2, 'Mei'),
    (12, 2, 'Torbjörn'),
    (13, 2, 'Widowmaker'),
    (14, 3, 'D.Va'),
    (15, 3, 'Orisa'),
    (16, 3, 'Reinhardt'),
    (17, 3, 'Roadhog'),
    (18, 3, 'Sigma'),
    (19, 3, 'Winston'),
    (20, 3, 'Wrecking Ball'),
    (21, 4, 'Ana'),
    (22, 4, 'Baptiste'),
    (23, 4, 'Brigitte'),
    (24, 4, 'Lúcio'),
    (25, 4, 'Mercy'),
    (26, 4, 'Moira'),
    (27, 4, 'Zenyatta');

-- Insert data into 'hero_ability' table
INSERT INTO
    hero_ability (id, hero_id, name, ultimate)
VALUES
    (1, 1, 'Blink', false),
    (2, 1, 'Recall', false),
    (3, 2, 'Shadow Step', false),
    (4, 2, 'Wraith Form', false),
    (5, 3, 'Grappling Hook', false),
    (6, 3, 'Infra-Sight', true),
    (7, 4, 'Hellfire Shotguns', false),
    (8, 4, 'The Reaping', false),
    (9, 5, 'Heavy Pulse Rifle', false),
    (10, 5, 'Helix Rockets', false);

-- Insert data into 'map' table
INSERT INTO
    map (id, name, gameType_id)
VALUES
    (1, 'Hanamura', 1),
    (2, 'Temple of Anubis', 1),
    (3, 'Volskaya Industries', 1),
    (4, 'Dorado', 2),
    (5, 'Route 66', 2),
    (6, 'Watchpoint: Gibraltar', 2),
    (7, 'King''s Row', 3),
    (8, 'Hollywood', 3),
    (9, 'Numbani', 3),
    (10, 'Ilios', 3),
    (11, 'Lijiang Tower', 3),
    (12, 'Nepal', 3),
    (13, 'Oasis', 3);

-- Insert data into 'player' table
INSERT INTO
    player (id, name, account_id)
VALUES
    (1, 'Player 1', 1),
    (2, 'Player 2', 2),
    (3, 'Player 3', 3),
    (4, 'Player 4', 4),
    (5, 'Player 5', 5);

-- Insert data into 'game' table
INSERT INTO
    game (id, map_id, gameType_id)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 1),
    (5, 5, 2),
    (6, NULL, 2);

-- Insert data into 'team' table
INSERT INTO
    team (id, game_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 2),
    (5, 3),
    (6, 3);

-- Insert data into 'skin' table
INSERT INTO
    skin (id, file_name, hero_id)
VALUES
    (1, 'Classic_1.png', 1),
    (2, 'Blackwatch_3.png', 3),
    (3, 'Blackwatch_3.png', 3),
    (4, 'Blackwatch_4.png', 4),
    (5, 'Blackwatch_5.png', 5),
    (6, 'Blackwatch_6.png', 6),
    (7, 'Classic_2.png', 2),
    (8, 'Blackwatch_4.png', 4),
    (9, 'Blackwatch_3.png', 3),
    (10, 'Blackwatch_5.png', 5);

-- Insert data into 'selectedhero' table
INSERT INTO
    selectedhero (player_id, hero_id, team_id, skin_id)
VALUES
    (1, 1, 1, 1),
    (2, 2, 2, 2),
    (3, 3, 3, 3),
    (4, 3, 4, 6),
    (5, 1, 5, 7);