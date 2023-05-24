-- Host: 127.0.0.1
-- Erstellungszeit: 22. Mai 2023 um 15:19
-- Server-Version: 10.4.25-MariaDB
-- PHP-Version: 7.4.30
-- Datenbank: ow
-- --------------------------------------------------------
--
-- Tabellenstruktur für Tabelle 'gametype'
--
CREATE TABLE gametype (
  id SERIAL PRIMARY KEY,
  name varchar(255) NOT NULL
);

-- --------------------------------------------------------
--
-- Tabellenstruktur für Tabelle 'account'
--
CREATE TABLE account (
  id SERIAL PRIMARY KEY,
  mail varchar(255) NOT NULL
);

-- --------------------------------------------------------
--
-- Tabellenstruktur für Tabelle 'hero_type'
--
CREATE TABLE hero_type (
  id SERIAL PRIMARY KEY,
  name varchar(255) NOT NULL
);

-- --------------------------------------------------------
--
-- Tabellenstruktur für Tabelle 'hero'
--
CREATE TABLE hero (
  id SERIAL PRIMARY KEY,
  type_id INT NOT NULL,
  name varchar(255) NOT NULL,
  FOREIGN KEY (type_id) REFERENCES hero_type (id)
);

-- --------------------------------------------------------
--
-- Tabellenstruktur für Tabelle 'hero_ability'
--
CREATE TABLE hero_ability (
  id SERIAL PRIMARY KEY,
  hero_id int NOT NULL,
  name varchar(255) NOT NULL,
  ultimate boolean NOT NULL DEFAULT false,
  FOREIGN KEY (hero_id) REFERENCES hero (id) ON DELETE CASCADE
);

-- --------------------------------------------------------
--
-- Tabellenstruktur für Tabelle 'map'
--
CREATE TABLE map (
  id SERIAL PRIMARY KEY,
  name varchar(255) NOT NULL,
  gameType_id int NOT NULL,
  FOREIGN KEY (gameType_id) REFERENCES gametype (id) ON UPDATE CASCADE
);

-- --------------------------------------------------------
--
-- Tabellenstruktur für Tabelle 'player'
--
CREATE TABLE player (
  id SERIAL PRIMARY KEY,
  name varchar(255) NOT NULL,
  account_id int NOT NULL,
  FOREIGN KEY (account_id) REFERENCES account (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- --------------------------------------------------------
--
-- Tabellenstruktur für Tabelle 'game'
--
CREATE TABLE game (
  id SERIAL PRIMARY KEY,
  map_id int,
  gameType_id int NOT NULL,
  FOREIGN KEY (map_id) REFERENCES map (id) ON UPDATE CASCADE,
  FOREIGN KEY (gameType_id) REFERENCES gametype (id) ON UPDATE CASCADE
);

-- --------------------------------------------------------
--
-- Tabellenstruktur für Tabelle 'team'
--
CREATE TABLE team (
  id SERIAL PRIMARY KEY,
  game_id INT NOT NULL,
  FOREIGN KEY (game_id) REFERENCES game (id) ON DELETE CASCADE
);

-- --------------------------------------------------------
--
-- Tabellenstruktur für Tabelle 'skin'
--
CREATE TABLE skin (
  id SERIAL PRIMARY KEY,
  file_name varchar(255) NOT NULL,
  hero_id int NOT NULL,
  FOREIGN KEY (hero_id) REFERENCES hero (id) ON UPDATE CASCADE
);

-- --------------------------------------------------------
--
-- Tabellenstruktur für Tabelle 'selectedhero'
--
CREATE TABLE selectedhero (
  player_id int NOT NULL,
  hero_id int NOT NULL,
  team_id int NOT NULL,
  skin_id int NOT NULL,
  PRIMARY KEY (player_id, hero_id, team_id),
  FOREIGN KEY (skin_id) REFERENCES skin (id) ON UPDATE CASCADE,
  FOREIGN KEY (player_id) REFERENCES player (id) ON UPDATE CASCADE,
  FOREIGN KEY (hero_id) REFERENCES hero (id) ON UPDATE CASCADE,
  FOREIGN KEY (team_id) REFERENCES team (id) ON UPDATE CASCADE
);