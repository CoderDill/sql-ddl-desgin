CREATE TABLE "regions" (
  "id" SERIAL PRIMARY KEY,
  "name" text
);

CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "preferred_region_id" int
);

CREATE TABLE "posts" (
  "id" int PRIMARY KEY,
  "title" text,
  "text" text,
  "user_id" int,
  "region_id" int,
  "categorie_id" int
);

CREATE TABLE "categories" (
  "id" int PRIMARY KEY,
  "name" text
);

ALTER TABLE "users" ADD FOREIGN KEY ("preferred_region_id") REFERENCES "regions" ("id");

ALTER TABLE "posts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "posts" ADD FOREIGN KEY ("region_id") REFERENCES "regions" ("id");

ALTER TABLE "posts" ADD FOREIGN KEY ("categorie_id") REFERENCES "categories" ("id");
