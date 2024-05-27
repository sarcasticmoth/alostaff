/*
  Warnings:

  - You are about to drop the column `password_protected` on the `board` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_board" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "category_id" INTEGER,
    "description" TEXT,
    "name" TEXT NOT NULL,
    "parent_id" INTEGER,
    "url" TEXT,
    CONSTRAINT "board_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "board" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "board_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "category" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO "new_board" ("category_id", "description", "id", "name", "parent_id", "url") SELECT "category_id", "description", "id", "name", "parent_id", "url" FROM "board";
DROP TABLE "board";
ALTER TABLE "new_board" RENAME TO "board";
PRAGMA foreign_key_check("board");
PRAGMA foreign_keys=ON;
