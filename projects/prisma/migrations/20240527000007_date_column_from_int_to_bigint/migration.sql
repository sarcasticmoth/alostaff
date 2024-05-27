/*
  Warnings:

  - You are about to alter the column `date` on the `shoutbox_post` table. The data in that column could be lost. The data in that column will be cast from `Int` to `BigInt`.
  - You are about to alter the column `last_edited` on the `post` table. The data in that column could be lost. The data in that column will be cast from `Int` to `BigInt`.
  - You are about to alter the column `date_registered` on the `user` table. The data in that column could be lost. The data in that column will be cast from `Int` to `BigInt`.
  - You are about to alter the column `last_online` on the `user` table. The data in that column could be lost. The data in that column will be cast from `Int` to `BigInt`.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_shoutbox_post" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "date" BIGINT,
    "message" TEXT,
    "user_id" INTEGER,
    CONSTRAINT "shoutbox_post_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO "new_shoutbox_post" ("date", "id", "message", "user_id") SELECT "date", "id", "message", "user_id" FROM "shoutbox_post";
DROP TABLE "shoutbox_post";
ALTER TABLE "new_shoutbox_post" RENAME TO "shoutbox_post";
CREATE TABLE "new_post" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "date" BIGINT,
    "edit_user_id" INTEGER,
    "last_edited" BIGINT,
    "message" TEXT,
    "thread_id" INTEGER NOT NULL,
    "url" TEXT,
    "user_id" INTEGER NOT NULL,
    CONSTRAINT "post_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "post_thread_id_fkey" FOREIGN KEY ("thread_id") REFERENCES "thread" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "post_edit_user_id_fkey" FOREIGN KEY ("edit_user_id") REFERENCES "user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO "new_post" ("date", "edit_user_id", "id", "last_edited", "message", "thread_id", "url", "user_id") SELECT "date", "edit_user_id", "id", "last_edited", "message", "thread_id", "url", "user_id" FROM "post";
DROP TABLE "post";
ALTER TABLE "new_post" RENAME TO "post";
CREATE TABLE "new_user" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "age" INTEGER,
    "birthdate" TEXT,
    "date_registered" BIGINT,
    "email" TEXT,
    "played_by" TEXT,
    "gender" TEXT,
    "group" TEXT,
    "last_online" BIGINT,
    "latest_status" TEXT,
    "location" TEXT,
    "name" TEXT,
    "post_count" INTEGER,
    "signature" TEXT,
    "url" TEXT,
    "username" TEXT
);
INSERT INTO "new_user" ("age", "birthdate", "date_registered", "email", "gender", "group", "id", "last_online", "latest_status", "location", "name", "played_by", "post_count", "signature", "url", "username") SELECT "age", "birthdate", "date_registered", "email", "gender", "group", "id", "last_online", "latest_status", "location", "name", "played_by", "post_count", "signature", "url", "username" FROM "user";
DROP TABLE "user";
ALTER TABLE "new_user" RENAME TO "user";
PRAGMA foreign_key_check("shoutbox_post");
PRAGMA foreign_key_check("post");
PRAGMA foreign_key_check("user");
PRAGMA foreign_keys=ON;
