/*
  Warnings:

  - You are about to alter the column `date` on the `post` table. The data in that column could be lost. The data in that column will be cast from `Int` to `BigInt`.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_post" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "date" BIGINT,
    "edit_user_id" INTEGER,
    "last_edited" INTEGER,
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
PRAGMA foreign_key_check("post");
PRAGMA foreign_keys=ON;
