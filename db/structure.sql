CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "admins" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_admins_on_email" ON "admins" ("email");
CREATE UNIQUE INDEX "index_admins_on_reset_password_token" ON "admins" ("reset_password_token");
CREATE TABLE "members" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "role" varchar, "band_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "articles" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "content" text, "band_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "comments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "content" varchar, "band_id" integer, "article_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, CONSTRAINT "fk_rails_9790013f8d"
FOREIGN KEY ("band_id")
  REFERENCES "bands" ("id")
, CONSTRAINT "fk_rails_3bf61a60d3"
FOREIGN KEY ("article_id")
  REFERENCES "articles" ("id")
);
CREATE INDEX "index_comments_on_band_id" ON "comments" ("band_id");
CREATE INDEX "index_comments_on_article_id" ON "comments" ("article_id");
CREATE TABLE "post_image_users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "image_id" varchar, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "post_image_bands" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "image_id" varchar, "band_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "bands" ("id" integer NOT NULL PRIMARY KEY, "user_id" integer DEFAULT NULL, "band_name" varchar DEFAULT NULL, "band_image_id" varchar DEFAULT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "users" ("id" integer NOT NULL PRIMARY KEY, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar DEFAULT NULL, "reset_password_sent_at" datetime DEFAULT NULL, "remember_created_at" datetime DEFAULT NULL, "user_name" varchar DEFAULT NULL, "last_name" varchar DEFAULT NULL, "first_name" varchar DEFAULT NULL, "last_name_kana" varchar DEFAULT NULL, "first_name_kana" varchar DEFAULT NULL, "postal_code" varchar DEFAULT NULL, "address" varchar DEFAULT NULL, "telephone_number" varchar DEFAULT NULL, "is_active" boolean DEFAULT 1 NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "band_id" integer DEFAULT NULL, "profile_image_id" varchar DEFAULT NULL);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE TABLE "live_organizations" ("id" integer NOT NULL PRIMARY KEY, "band_id" integer DEFAULT NULL, "live_id" integer DEFAULT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "host" boolean DEFAULT 0 NOT NULL);
CREATE TABLE "rents" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "live_id" integer, "live_house_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_rents_on_live_id" ON "rents" ("live_id");
CREATE INDEX "index_rents_on_live_house_id" ON "rents" ("live_house_id");
CREATE TABLE "favorites" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "band_id" integer, "article_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "relationships" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "band_id" integer, "follow_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, CONSTRAINT "fk_rails_eb44bc92b2"
FOREIGN KEY ("band_id")
  REFERENCES "bands" ("id")
, CONSTRAINT "fk_rails_be1f05b3d7"
FOREIGN KEY ("follow_id")
  REFERENCES "bands" ("id")
);
CREATE INDEX "index_relationships_on_band_id" ON "relationships" ("band_id");
CREATE INDEX "index_relationships_on_follow_id" ON "relationships" ("follow_id");
CREATE UNIQUE INDEX "index_relationships_on_band_id_and_follow_id" ON "relationships" ("band_id", "follow_id");
CREATE TABLE "lives" ("id" integer NOT NULL PRIMARY KEY, "introduction" text DEFAULT NULL, "live_name" varchar DEFAULT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "status" integer DEFAULT 0 NOT NULL, "amount" integer DEFAULT NULL, "start_at" datetime DEFAULT NULL, "end_at" datetime DEFAULT NULL, "live_house_id" integer DEFAULT NULL, "registered_person" boolean, "color" varchar);
CREATE TABLE "live_houses" ("id" integer NOT NULL PRIMARY KEY, "price" integer DEFAULT NULL, "house_name" varchar DEFAULT NULL, "postal_code" varchar DEFAULT NULL, "address" varchar DEFAULT NULL, "website" varchar DEFAULT NULL, "branches" float DEFAULT NULL, "latitude" float DEFAULT NULL, "longitude" float DEFAULT NULL, "telephone_number" varchar DEFAULT NULL, "image_id" varchar DEFAULT NULL, "detail" text DEFAULT NULL, "is_active" boolean DEFAULT 0 NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar DEFAULT NULL, "reset_password_sent_at" datetime DEFAULT NULL, "remember_created_at" datetime DEFAULT NULL);
CREATE UNIQUE INDEX "index_live_houses_on_email" ON "live_houses" ("email");
CREATE UNIQUE INDEX "index_live_houses_on_reset_password_token" ON "live_houses" ("reset_password_token");
INSERT INTO "schema_migrations" (version) VALUES
('20210520123007'),
('20210520132250'),
('20210521122215'),
('20210521145530'),
('20210521145951'),
('20210522030405'),
('20210522030524'),
('20210522045035'),
('20210522135746'),
('20210523073513'),
('20210523074134'),
('20210525111416'),
('20210525112837'),
('20210527154148'),
('20210527154228'),
('20210530142655'),
('20210530145410'),
('20210530145611'),
('20210607162929'),
('20210608120213'),
('20210609124132'),
('20210609125744'),
('20210612152138'),
('20210618065743'),
('20210623153430'),
('20210626052746'),
('20210628104322'),
('20210628132314');


