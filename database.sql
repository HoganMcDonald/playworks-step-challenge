
-- USER is a reserved keyword with Postgres
-- You must use double quotes in every query that user is in:
-- ex. SELECT * FROM "user";
-- Otherwise you will have errors!

-- OLD SQL QUERY
-- CREATE TABLE "user" (
--     "id" SERIAL PRIMARY KEY,
--     "username" VARCHAR (80) UNIQUE NOT NULL,
--     "password" VARCHAR (1000) NOT NULL
-- );

-- TABLE NAME playworks_step_challenge
CREATE TYPE admin_level AS ENUM (
  'USER', 
  'CAPTAIN', 
  'ADMIN');
  
CREATE TABLE "contests" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR (80) NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE NOT NULL
);


CREATE TABLE "teams" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR (80) NOT NULL,
    "team_logo" TEXT,
    "company_name" VARCHAR (120)
);

CREATE TABLE "user" (
    "id" SERIAL PRIMARY KEY,
    "username" VARCHAR (80) NOT NULL,
    "email" VARCHAR (30) UNIQUE NOT NULL,
    "first_name" VARCHAR (20) NOT NULL,
    "last_name" VARCHAR (30) NOT NULL,
    "password" VARCHAR (1000) NOT NULL,
    "image_path" TEXT,
    "admin" admin_level,
    "contests_id" INT REFERENCES "contests",
    "teams_id" INT REFERENCES "teams"
);

CREATE TABLE "challenges" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR (80) NOT NULL,
    "description" VARCHAR (200) NOT NULL,
    "date" DATE
);

CREATE TABLE "steps" (
    "id" SERIAL PRIMARY KEY,
    "user_id" INT REFERENCES "user",
    "date" DATE NOT NULL,
    "steps" INT NOT NULL
);

CREATE TABLE "photos" (
    "id" SERIAL PRIMARY KEY,
    "user_id" INT REFERENCES "user",
    "challenges_id" INT REFERENCES "challenges",
    "date" TIMESTAMP NOT NULL,
    "file_url" TEXT
);

-- Fake contests
INSERT INTO "contests" ("name", "start_date", "end_date")
VALUES ('A-Team contest', '2020-11-10', '2020-11-15');
INSERT INTO "contests" ("name", "start_date", "end_date")
VALUES ('Fab Four contest', '2020-11-15', '2020-11-20');
INSERT INTO "contests" ("name", "start_date", "end_date")
VALUES ('Some lame contest', '2020-11-20', '2020-10-29');
-- Fake Teams
INSERT INTO "teams" ("name", "team_logo", "company_name")
VALUES ('The A-team', 'www.image.com/fakelogo', 'company A');
INSERT INTO "teams" ("name", "team_logo", "company_name")
VALUES ('The B-team', 'www.image.com/fakelogo', 'company B');
INSERT INTO "teams" ("name", "team_logo", "company_name")
VALUES ('The C-team', 'www.image.com/fakelogo', 'company A');
INSERT INTO "teams" ("name", "team_logo", "company_name")
VALUES ('The C-team', 'www.image.com/fakelogo', 'company B');
INSERT INTO "teams" ("name", "team_logo", "company_name")
VALUES ('The C-team', 'www.image.com/fakelogo', 'company A');
-- Fake users
INSERT INTO "user" ("username", "email", "first_name", "last_name", "password", "image_path", "admin", "teams_id")
VALUES ('spiderman', 'spidey@ateam.com', 'peter', 'parker', '12345', 'https://www.image.com/spiderman', 'ADMIN', NULL);
INSERT INTO "user" ("username", "email", "first_name", "last_name", "password", "image_path", "admin", "teams_id")
VALUES ('superman', 'super@ateam.com', 'clark', 'kent', '12345', 'https://www.image.com/spiderman', 'ADMIN', NULL);
INSERT INTO "user" ("username", "email", "first_name", "last_name", "password", "image_path", "admin", "teams_id")
VALUES ('batman', 'batty@ateam.com', 'bruce', 'wayne', '12345', 'https://www.image.com/spiderman', 'USER', NULL);
INSERT INTO "user" ("username", "email", "first_name", "last_name", "password", "image_path", "admin", "teams_id")
VALUES ('wonder woman', 'ww@ateam.com', 'diana', 'prince', '12345', 'https://www.image.com/spiderman', 'CAPTAIN', NULL);
INSERT INTO "user" ("username", "email", "first_name", "last_name", "password", "image_path", "admin", "teams_id")
VALUES ('aquaman', 'aquaman@ateam.com', 'arthur', 'curry', '12345', 'https://www.image.com/spiderman', 'CAPTAIN', NULL);
INSERT INTO "user" ("username", "email", "first_name", "last_name", "password", "image_path", "admin", "teams_id")
VALUES ('incredible hulk', 'hulk@ateam.com', 'bruce', 'banner', '12345', 'https://www.image.com/spiderman', 'USER', NULL);
INSERT INTO "user" ("username", "email", "first_name", "last_name", "password", "image_path", "admin", "teams_id")
VALUES ('flash', 'flash@ateam.com', 'barry', 'allen', '12345', 'https://www.image.com/spiderman', 'USER', NULL);
-- Adding fake users to fake teams
UPDATE "user"
SET "teams_id" = 1
WHERE "user"."id" = 3;
UPDATE "user"
SET "teams_id" = 1
WHERE "user"."id" = 4;
UPDATE "user"
SET "teams_id" = 2
WHERE "user"."id" = 5;
UPDATE "user"
SET "teams_id" = 3
WHERE "user"."id" = 6;
UPDATE "user"
SET "teams_id" = 3
WHERE "user"."id" = 7;
-- Fake challenges
INSERT INTO "challenges" ("name", "description", "date")
VALUES ('A-team challenge', 'Take a picture of a squirrel', '2020-11-10');
INSERT INTO "challenges" ("name", "description", "date")
VALUES ('A-team challenge', 'Take a picture of a dog', '2020-11-11');
INSERT INTO "challenges" ("name", "description", "date")
VALUES ('A-team challenge', 'Take a picture of a cat', '2020-11-12');
INSERT INTO "challenges" ("name", "description", "date")
VALUES ('A-team challenge', 'Take a picture of a bird', '2020-11-13');
INSERT INTO "challenges" ("name", "description", "date")
VALUES ('A-team challenge', 'Take a picture of a tree', '2020-11-14');
INSERT INTO "challenges" ("name", "description", "date")
VALUES ('A-team challenge', 'Take a picture of a friend', '2020-11-15');
-- Fake step logs
INSERT INTO "steps" ("user_id", "date", "steps")
VALUES (2, '2020-11-10', 100);
INSERT INTO "steps" ("user_id", "date", "steps")
VALUES (2, '2020-11-10', 200);
INSERT INTO "steps" ("user_id", "date", "steps")
VALUES (4, '2020-11-11', 5);
INSERT INTO "steps" ("user_id", "date", "steps")
VALUES (2, '2020-11-12', 25);
INSERT INTO "steps" ("user_id", "date", "steps")
VALUES (6, '2020-11-12', 1000);
INSERT INTO "steps" ("user_id", "date", "steps")
VALUES (7, '2020-11-12', 500);
-- Fake pictures
INSERT INTO "photos" ("user_id", "challenges_id", "date", "image_path")
VALUES (3, 1, '2020-11-10 09:59:30', 'www.images.com/fakeimagepath');
INSERT INTO "photos" ("user_id", "challenges_id", "date", "image_path")
VALUES (4, 1, '2020-11-10 09:59:30', 'www.images.com/fakeimagepath');
INSERT INTO "photos" ("user_id", "challenges_id", "date", "image_path")
VALUES (5, 1, '2020-11-10 09:59:30', 'www.images.com/fakeimagepath');
INSERT INTO "photos" ("user_id", "challenges_id", "date", "image_path")
VALUES (6, 1, '2020-11-11 09:59:30', 'www.images.com/fakeimagepath');
INSERT INTO "photos" ("user_id", "challenges_id", "date", "image_path")
VALUES (7, 1, '2020-11-11 09:59:30', 'www.images.com/fakeimagepath');
INSERT INTO "photos" ("user_id", "challenges_id", "date", "image_path")
VALUES (3, 1, '2020-11-12 09:59:30', 'www.images.com/fakeimagepath');
INSERT INTO "photos" ("user_id", "challenges_id", "date", "image_path")
VALUES (4, 1, '2020-11-12 09:59:30', 'www.images.com/fakeimagepath');
INSERT INTO "photos" ("user_id", "challenges_id", "date", "image_path")
VALUES (5, 1, '2020-11-12 09:59:30', 'www.images.com/fakeimagepath');
INSERT INTO "photos" ("user_id", "challenges_id", "date", "image_path")
VALUES (6, 1, '2020-11-13 09:59:30', 'www.images.com/fakeimagepath');
INSERT INTO "photos" ("user_id", "challenges_id", "date", "image_path")
VALUES (7, 1, '2020-11-13 09:59:30', 'www.images.com/fakeimagepath');
-- Select alls
SELECT * FROM "user";
SELECT * FROM "challenges";
SELECT * FROM "contests";
SELECT * FROM "photos";
SELECT * FROM "steps";
SELECT * FROM "teams";
-- Only enter below to drop tables in the correct order
DROP TABLE "photos";
DROP TABLE "steps";
DROP TABLE "user";
DROP TABLE "challenges";
DROP TABLE "teams";
DROP TABLE "contests";