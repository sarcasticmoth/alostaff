/*
  Warnings:

  - You are about to drop the `css` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `poll` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `poll_option` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `poll_voter` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `shoutbox_post` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "css";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "poll";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "poll_option";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "poll_voter";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "shoutbox_post";
PRAGMA foreign_keys=on;
