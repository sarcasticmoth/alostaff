-- CreateTable
CREATE TABLE "avatar" (
    "image_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,

    PRIMARY KEY ("image_id", "user_id"),
    CONSTRAINT "avatar_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "avatar_image_id_fkey" FOREIGN KEY ("image_id") REFERENCES "image" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "board" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "category_id" INTEGER,
    "description" TEXT,
    "name" TEXT NOT NULL,
    "parent_id" INTEGER,
    "password_protected" BOOLEAN,
    "url" TEXT,
    CONSTRAINT "board_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "board" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "board_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "category" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "category" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "css" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "description" TEXT,
    "filename" TEXT,
    "md5_hash" TEXT,
    "url" TEXT
);

-- CreateTable
CREATE TABLE "image" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "description" TEXT,
    "filename" TEXT,
    "md5_hash" TEXT,
    "size" INTEGER,
    "url" TEXT
);

-- CreateTable
CREATE TABLE "moderator" (
    "board_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,

    PRIMARY KEY ("board_id", "user_id"),
    CONSTRAINT "moderator_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "moderator_board_id_fkey" FOREIGN KEY ("board_id") REFERENCES "board" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "poll" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT,
    CONSTRAINT "poll_id_fkey" FOREIGN KEY ("id") REFERENCES "thread" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "poll_option" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "poll_id" INTEGER,
    "name" TEXT,
    "votes" INTEGER,
    CONSTRAINT "poll_option_poll_id_fkey" FOREIGN KEY ("poll_id") REFERENCES "poll" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "poll_voter" (
    "poll_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,

    PRIMARY KEY ("poll_id", "user_id"),
    CONSTRAINT "poll_voter_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "poll_voter_poll_id_fkey" FOREIGN KEY ("poll_id") REFERENCES "poll" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "post" (
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

-- CreateTable
CREATE TABLE "shoutbox_post" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "date" INTEGER,
    "message" TEXT,
    "user_id" INTEGER,
    CONSTRAINT "shoutbox_post_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "thread" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "announcement" BOOLEAN,
    "board_id" INTEGER NOT NULL,
    "locked" BOOLEAN,
    "sticky" BOOLEAN,
    "title" TEXT,
    "url" TEXT,
    "user_id" INTEGER NOT NULL,
    "views" INTEGER,
    CONSTRAINT "thread_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "thread_board_id_fkey" FOREIGN KEY ("board_id") REFERENCES "board" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "user" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "age" INTEGER,
    "birthdate" TEXT,
    "date_registered" INTEGER,
    "email" TEXT,
    "played_by" TEXT,
    "gender" TEXT,
    "group" TEXT,
    "last_online" INTEGER,
    "latest_status" TEXT,
    "location" TEXT,
    "name" TEXT,
    "post_count" INTEGER,
    "signature" TEXT,
    "url" TEXT,
    "username" TEXT
);

