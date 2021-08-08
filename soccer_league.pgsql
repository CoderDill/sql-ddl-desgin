CREATE TABLE "leagues" (
  "id" SERIAL PRIMARY KEY,
  "name" text
);

CREATE TABLE "teams" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "league_id" int
);

CREATE TABLE "players" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "team_id" int
);

CREATE TABLE "referees" (
  "id" int PRIMARY KEY,
  "name" text
);

CREATE TABLE "matches" (
  "id" int PRIMARY KEY,
  "home_team_id" int,
  "away_team_id" int,
  "referee_id" int
);

CREATE TABLE "goals" (
  "id" int PRIMARY KEY,
  "match_id" int,
  "player_id" int
);

CREATE TABLE "goals_per_match" (
  "id" int PRIMARY KEY,
  "match_id" int,
  "player_id" int
);

ALTER TABLE "players" ADD FOREIGN KEY ("team_id") REFERENCES "teams" ("id");

ALTER TABLE "teams" ADD FOREIGN KEY ("league_id") REFERENCES "leagues" ("id");

ALTER TABLE "matches" ADD FOREIGN KEY ("referee_id") REFERENCES "referees" ("id");

ALTER TABLE "matches" ADD FOREIGN KEY ("home_team_id") REFERENCES "teams" ("id");

ALTER TABLE "matches" ADD FOREIGN KEY ("away_team_id") REFERENCES "teams" ("id");

ALTER TABLE "goals" ADD FOREIGN KEY ("player_id") REFERENCES "players" ("id");

ALTER TABLE "goals" ADD FOREIGN KEY ("match_id") REFERENCES "matches" ("id");
